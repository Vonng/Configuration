Vim Configurations
==================

Usage
-----

### Mac and Linux ###

```shell
cd ~
ln -s $DOTFILES_HOME/vim .vim
ln -s .vim/vimrc .vimrc
```

### Windows ###

```batch
cd %VIM_PROGRAM_PATH%
mklink /d vimfiles %DOTFILES_HOME%\vim
mklink _vimrc vimfiles\vimrc
```

Information
-----------

I use [vim-pathogen](https://github.com/tpope/vim-pathogen) to manage vim extensions. See [Pathogenize your VIM](http://blog.sensible.io/2012/10/18/pathogenize-your-vim.html) for more information.
