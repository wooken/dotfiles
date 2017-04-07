# dotfiles

## ZSH

### Clone zprezto

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

### Stow config files

```
stow zsh
```

### Update zprezto

```
git pull && git submodule update --init --recursive
```
