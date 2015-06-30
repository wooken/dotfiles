#!/usr/bin/env ruby

require 'fileutils'
require 'find'
require 'yaml'

$VALID_ACTIONS = %w(new deploy)

# helper functions
def cmd?(cmd)
  print "checking for #{cmd}... "
  if system("which #{cmd} > /dev/null 2>&1")
    puts "yes"
    return true
  else
    puts "no"
    return false
  end
end

def error(msg)
  puts "ERROR: " + msg
end

def usage
  puts "Usage: #{$PROGRAM_NAME} " + $VALID_ACTIONS.join('|')
end

# execute
if ARGV.empty?
  usage()
  exit
end
action = ARGV.shift

cfg_paths = []
Find.find('.') do |path|
  cfg_paths << path if path =~ /config\.yaml$/
end

cfg_paths.each do |cfg|
  parsed = begin
             YAML.load_file(cfg)
           rescue ArgumentError => e
             puts "Could not parse YAML: #{e.message}"
           end
  parsed.each do |file|
    if cmd? file['cmd']
      old = File.dirname(File.expand_path(cfg)) + '/' + file['src']
      new = file['dest'].sub!('~', File.expand_path('~'))
      if !File.exists?(old)
        error "Could not find file: #{old}"
      elsif File.exists?(new)
        error "File already exists: #{new}"
      else
        puts "Creating symlink: #{old} => #{new}"
        FileUtils.ln_s(old, new) if File.exists?(old) and !File.exists?(new)
      end
    end
  end
end
