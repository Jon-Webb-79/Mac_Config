***********************
Macintosh Configuration
***********************
This repository contains scripts, files, and data used to configure a Macintosh system.


Contributing
############
Full requests are welcome.  For major changes , please open an issue first to discuss
What you would like to change.  Please make sure to include and update tests
As well as relevant doc-strings.

License
#######
This data is not held under License

Installation
############
In order to download this repository from GitHub, follow these instructions;

1. It is assumed that the user has already installed a modern Macintosh operating
   System on their computer prior to cloning this repository.
2. Ensure you have .git installed on your computer.
3. At your desired location create a directory titled ``Mac_Config``.  While the
   user can place this directory anywhere, it is recommended that it be placed in the
   users home directory .
4. Open a terminal (bash, zsh) and cd to the ``Mac_Config`` directory and type
   ``clone https://github.com/Jon-Webb-79/Mac_Config.git Mac_Config``

Code Development Directories
############################
Manually move the ``Code_Dev`` directory into the users home directory

Homebrew
########
Install the homebrew package manager with the following command

``% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"``

Git
###
During the process of installing Homebrew, the installer will also install Xcode command line tools
And git.  However, the user should also install GitHub-cli with the following command;

``% brew install gh``

NeoVim
******
Install NeoVim with the following command

https://medium.com/@rohmanhakim/how-to-set-up-code-completion-for-vim-in-macos-9766dd459385

``% brew install neovim``

Install and configure related packages with the following commands

``% curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent/com/junegunn/vim-plug/master/plug.vim

``% brew install npm``

``% brew install nodejs``

``% brew install python@3.XX``

``% pip3 install jedi``

Install Powerline fonts by cd'ing to your home directory and running the following command

``% git clone https://github/powerline/fonts.git --depth=1``

Then install the powerline fonts

``% ./install.sh``

``cd ..``

``rm -rf fonts``

On the upper panel open ``Terminal >> Prefernces`` and change the terminal font to a powerline
font.
