#!/bin/zsh
# .zshrc file
# ================================================================================
# ================================================================================
# - Purpose: This file contains all information relevant to interactive
#            Bash sessions to include reference calls to the .bashrc file
#
# Source Metadata
# - Author:    Jonathan A. Webb
# - Date:      February 22, 2022
# - Version:   1.0
# - Copyright: Copyright 2022, Jon Webb Inc.
# ================================================================================
# ================================================================================
# Basic input

PATH='/opt/homebrew/bin:/usr/local/bin/:/usr/local/sbin/:/bin/:/usr/bin/:/Users/jonwebb/.local/bin'
export PATH
# --------------------------------------------------------------------------------
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/jonwebb/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v

#increase the stacksize
ulimit -S -s hard
# --------------------------------------------------------------------------------
# Make vim the default editor and set github token

export EDITOR=nvim
# -------------------------------------------------------------------------------
# Set color schem
#
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxgedahagacedd
# --------------------------------------------------------------------------------
# Install powerline status
#
powerline-daemon -q
POWERLINE_ZSH_CONTINUATION=1
POWERLINE_ZSH_SELECT=1
source /opt/homebrew/lib/python3.11/site-packages/powerline/bindings/zsh/powerline.zsh
# --------------------------------------------------------------------------------
# Install plugins

# Syntax highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.config/zsh_scripts/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions.git
source ~/.config/zsh_scripts/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Web search
# git clone https://github.com/sinetoami/web-search.git
source ~/.config/zsh_scripts/plugins/web-search/web_search.plugin.zsh 
# --------------------------------------------------------------------------------
# Reference alias files

# Generic aliases
source ~/.config/zsh_scripts/.zsh_aliases

# git aliases
source ~/.config/zsh_scripts/.zsh_git_aliases
# ================================================================================
# ================================================================================
# eof
