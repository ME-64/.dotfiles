### New Environment Setup

-------------------------

```shell
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/ME-64/.dotfiles $HOME/.dotfiles

alias config = '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

config checkout
config config --local status.showUntrackedFiles no
```

NB: will have to delete existing dotfiles on the system otherwise checkout will fail.


