# bash_aid_kit

## The main goal
The main goal is to provide a **simple zero configuration bash environment** for linux users.
Also provides **markdown** support for making documentation and **slides** much easier.

Inside:

- **BASH** (functions, aliases, **prompt**)
- **GIT** (config, [prompt](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh))
- **SVN** ([prompt](https://github.com/mcandre/svn-prompt))
- **TMUX** ([config](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf))
- **VIM** ([vim-plug](https://github.com/junegunn/vim-plug))
- **[reveal.js](https://github.com/hakimel/reveal.js/)** ([docker container](https://github.com/amouat/revealjs-docker))

## Requirements

- BASH :)
- systemd
- docker

## Download the code

```
$ git clone git@bitbucket.org:mariushko/bash_aid_kit.git
$ cd bash_aid_kit/sbin
$ ./git-file-wget-all
```
## Testing

```
$ cd bash_aid_kit
$ source .bash_main
┌─[~/GIT/bash_aid_kit]                                               [ram=4.6g home=88g]
│ [git: git@bitbucket.org:mariushko/bash_aid_kit.git (master * u=)]
└─[user@host]$ cd reveal.js/test
┌─[~/GIT/bash_aid_kit/reveal.js/test]                                [ram=4.6g home=88g]
└─[user@host]$ slides-on
```
or
```
$ cd bash_aid_kit/test
$ vagrant up
$ vagrant ssh
vagrant$ vim-plug-update
vagrant$ cd /vagrant/reveal.js/test
vagrant$ slides-on
```
Now you can browse to http://127.0.0.1:8000 to see some slides...

## I want to use it forever
```
[user@host]$ echo "source /path/to/bash_aid_kit.git/.bash_main" >> ~/.bashrc
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
┌─[~/GIT/bash_aid_kit]                                        [dc=98% ram=4.6g home=88g]
│ [git: bitbucket.org:mariushko/bash_aid_kit.git (master u=)]
└─[user@host]$
```
## Features

- BASH prompt indicators:
    - GIT and SVN support
    - Vagrant awareness
    - free RAM and SWAP memory
    - free space on ~/
    - error return code of previous command
    - battery status (AC/DC)
    - trivial network monitoring
    - read only folder
    - acl
    - linked folder
- turned off terminal flow control (**Ctrl-S** and **Ctrl-Q** are back!!!)
- GIT aliases (tested on git 2.15.1)
- BASH functions, aliases and scripts
    - ```ll``` - cool folder listing
    - ```cm``` - clean memory
    - ```vim-plug-update``` - update vim plugin manager and all plugins
- VIM configuration:
    - [code school](http://astonj.com/tech/vim-for-ruby-rails-and-a-sexy-theme/) color scheme
    - 80th column indicator
    - trailing whitespaces indicator
    - tabs indicator
    - [vim-plug](https://github.com/junegunn/vim-plug) manager:
        - [supertab](https://github.com/ervandew/supertab) ```TAB```
        - [nerdtree](https://github.com/scrooloose/nerdtree) ```<F9>```
        - [markdown-preview](https://github.com/iamcco/markdown-preview.vim) ```<F12>```
    - shortcuts:
        - delete all trailing whitespaces ```<F7>```
        - replace all tab characters by spaces ```<F8>```
- TMUX configuration based on ```Ctrl-S``` prefix and great [colors](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf)
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

Relax, it should run on most of modern linux distos.

## To Do

- downgrade .gitconfig aliases from GIT 2.15 to GIT 1.8 for CentOS 7 sake...
