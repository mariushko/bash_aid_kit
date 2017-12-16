# console_aid_kit

## Main goal
The main goal is to provide a **simple zero configuration bash environment** for linux users.
Provides **comfortable bash user expirience** and **markdown** support for making documentation and **slides**.

Inside:
- **BASH** (functions, aliases, **prompt**)
- **GIT** (config, [prompt](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh))
- **SVN** ([prompt](https://github.com/mcandre/svn-prompt))
- **tmux** ([config](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf))
- **vim** ([vim-plug](https://github.com/junegunn/vim-plug))
- **[reveal.js](https://github.com/hakimel/reveal.js/)** ([docker container](https://github.com/amouat/revealjs-docker))

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
┌─[~/GIT/console_aid_kit]                                            [ram=4.6g home=88g]
│ [git: git@bitbucket.org:mariushko/console_aid_kit.git (master * u=)]
└─[user@host]$ cd /sys/class/power_supply/BAT0
┌─[/sys/class/power_supply/BAT0][access=ro path=linked]              [ram=4.6g home=88g]
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
[user@host]$ echo "source /path/to/console_aid_kit.git/.bash_main" >> ~/.bashrc
```
maybe even:
```
[root@host]# echo "source /path/to/the/same/as/above/.bash_main" >> ~/.bashrc
```

## Files

| File/Folder         | Describtion
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
| test                | Vagrant configuration for testing

BASH prompt example:

```
┌─[~/GIT/console_aid_kit]                                     [dc=98% ram=4.6g home=88g]
│ [git: bitbucket.org:mariushko/console_aid_kit.git (master u=)]
└─[user@host]$
```
## Features

- BASH prompt indicators:
  - GIT and SVN support
  - Vagrant awareness
  - free RAM and SWAP memory
  - free space on ~/
  - error return code of previous command
  - battery status
  - trivial network monitoring
  - read only folder
  - acl set
  - linked folder
- turned off terminal flow control (Ctrl-S and Ctrl-Q are back!!!)
- GIT aliases (tested on git 2.15.1)
- BASH functions, aliases and scripts
  - ```ll``` - cool folder listing
  - ```cm``` - clean memory
  - ```vim-plug-update``` - update vim plugin manager and all plugins
- VIM configuration:
  - "code school" color scheme
  - 80th column indicator
  - trailing whitespaces indicator
  - tabs indicator
  - vim-plug manager:
    - supertab ```TAB```
    - nerdtree ```<F9>```
    - markdown-preview ```<F12>```
  - shortcuts:
    - delete all trailing whitespaces ```<F7>```
    - replace all tab characters by spaces ```<F8>```
- reveal.js docker container to present slides directly from markdown file
  - bash functions:
    - ```slides-on``` to run reveal.js container
    - ```slides-off``` to turn off container
  - you need only markdown to make slides
    - every header in markdown is a new slide
    - predefined separators:
      - ```<!---->``` - new (horizontal) slide
      - ```<!--vert-->``` - new vertical slide
      - ```<!--note-->``` - presenter note

and many others

> **Your own config files have always the highest priority**.

## Not tested on animals

Tested on:

- Arch Linux - best distro ever
- CentOS 7.3+ - enterprise distro

Relax, it should run on most of linux distos.

## To Do

- downgrade .gitconfig aliases from 2.15 to 1.8 for CentOS 7 sake...
