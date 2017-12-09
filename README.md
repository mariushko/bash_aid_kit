# console_aid_kit

## Main goal
** Simple zero configuration** bash environment for linux admins/developers.
**BASH** (functions, aliases, **prompt**), **GIT** config, **tmux** config and **vim** config and many others software technologies inside.

## Download the code

```
$ git clone git@bitbucket.org:mariushko/console_aid_kit.git
$ cd console_aid_kit/sbin
$ ./git-file-wget-all
```
## Testing

```
$ cd console_aid_kit
$ source .bash_main
┌─[~/GIT/console_aid_kit]                                               [ram=4.6g home=88g]
│ [git: git@bitbucket.org:mariushko/console_aid_kit.git (master * u=)]
└─[user@host]$ cd /sys/class/power_supply/BAT0
┌─[/sys/class/power_supply/BAT0][access=ro path=linked]                 [ram=4.6g home=88g]
└─[user@host]$ cd ~/GIT/console_aid_kit
```
or
```
$ cd console_aid_kit/test
$ vagrant up
$ vagrant ssh
vagrant$ cd /vagrant
```

## I want to use it forever
```
$ echo "source /path/to/console_aid_kit.git/.bash_main" >> ~/.bashrc
```

## Files

| Plik/Katalog        | Opis
| ------------------  | ---------------------------------------- |
| **.bash_main**      | main file, you should "source" it
| .bash_custom        | BASH custom config file
| .bash_prompt        | BASH prompt main file
| .git-completion.sh  | BASH completion support fot GIT
| .git-prompt.sh      | BASH prompt GIT support
| .svn-prompt.sh      | BASH prompt SVN support
| .gitconfig          | GIT config file, you should "include" this in your ~/.gitconfig
| .screenrc           | screen config file
| .tmux.conf          | TMUX config file
| .vim                | VIM config folder with vim-plug support
| .vimrc              | VIM config file
| .fonts              | fonts
| sbin                | system scripts
| bin                 | scripts
| test                | Vagrant config for testing

BASH prompt example:

```
┌─[~/GIT/console_aid_kit]                          [dc=98% ram=1.7g home=39.8g]
│ [git: bitbucket.org:mariushko/console_aid_kit.git (master u=)]
└─[mb@x201]$
```
## Features

- BASH prompt with GIT and SVN support
- free RAM and SWAP memory indicator
- free ~/ space indicator
- error exit status (return code) indicator
- battery indicator
- trivial network monitoring

and many others

## Not tested on animals

Tested on:
- Arch Linux - best distro ever
- Centos 7.3+ - enterprise distro

Relax, it should run on most of linux distos.
