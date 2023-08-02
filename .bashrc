#!/usr/local/bin/bash 
# .bashrc file
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
# Begin script

# If not running interactively, dont do anything
[[ $- != *i* ]] && return
# ================================================================================
# Set the path

PATH='/opt/homebrew/bin:/usr/local/bin/:/usr/local/sbin/:/bin/:/usr/bin/:/usr/sbin'
export PATH

# ================================================================================
# Increase the Stack Size
ulimit -S -s hard
# --------------------------------------------------------------------------------
# Make vim the default editor

export EDITOR=nvim
# --------------------------------------------------------------------------------
# Apply Colors to

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxgedahagacedd
# --------------------------------------------------------------------------------
# Install Powerline-status

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#export PATH="/opt/homebrew/lib/python3.11/site-packages/powerline/bindings/bash:$PATH"
source /opt/homebrew/lib/python3.11/site-packages/powerline/bindings/bash/powerline.sh
# --------------------------------------------------------------------------------

shopt -s cdspell
# --------------------------------------------------------------------------------
# Install aliases

# General aliases
source ~/.config/bash_scripts/.bash_aliases
# Aliases to support Git
source ~/.config/bash_scripts/.bash_git_aliases
# ================================================================================
# ================================================================================
# eof
