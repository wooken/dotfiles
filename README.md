# dotfiles

Each directory can be used with GNU [Stow](https://www.gnu.org/software/stow) to create symlinks to its contents.

e.g. `stow zsh`

## Git Hooks

Set up git hooks with:
```
stow git-hooks
```

## ZSH zprezto Setup

### Clone zprezto

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

### Update zprezto

```
git pull && git submodule update --init --recursive
```
