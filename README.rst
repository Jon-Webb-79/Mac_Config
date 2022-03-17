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

Install ITerm2
##############
ITerm2 is a popular terminal emulator for Macintosh computers that allows functionality
such as terminal splitting.  However, much of the functionality of ITerm2 can be achieved
by pairing tmux with the native Terminal application.  For this reason we will not be
using ITerm2.  However, if a user decides to use this application, it can be downloaded
with the following command;

``% brew cask install iterm2``

The above command should install the ITerm2 executable to the ``Downloads`` directory.  The
user should move the executable to the ``Applications`` directory at which point it
is ready for use.

NeoVim
******
Install NeoVim with the following command

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

Create a directory in your home directory titled ``.config`` if it does not already exist;

``% mkdir .config``

Within the ``.config`` directory create another directory titled ``nvim``.  Move the ``init.nvim``
file from the cloned directory to the ``nvim`` directory.  Open the file with the following
command

``% nvim init.vim``

This should display many errors that can be ignored.  Press the escape key, then simultaneously depress the
Shift and : keys.  This should display a : symbol in the bottom left corner.  Type the following command;

``:PlugInstall``

The above command should install all vim packages in the ``init.vim`` file to include Conquerer of Command (CoC).
Next we need to build to CoC pre-requisites.  Exit NeoVim by pressing Escape, then wq.

``% cd ~/.local/share/nvim/plugged/coc.nvim``

Install yarn

``% npm install --global yarn``

``% yarn install``

``% yarn build``

Install code development packages

``% cd ~/.config/nvim``

``% nvim init.vim``

Within the init.vim file install teh appropriate CoC commands

``:CocInstall coc-python``

``:CocInstall coc-clanged``

Install tmux
############
Tmux can be installed with the following command;

``% brew install tmux``

Once tmux has been installed, check to see that it is working properly by typing

``% tmux``

If it is working, then type the following command to exit the tmux session.

``% tmux kill-session``

Clone the pluggin manager

``% git clone https://github.com/tmux-plugins/tpm/tpm ~/.tmux/plugins/tpm``

Move the ``.tmux.conf`` file from the cloned directory to the users
home directory.  Open a tmux session and type ``Control-A-I`` to install
all plugins.

Bash
####

The Apple version of bash is very old.  Upgrade to a new version and change to that shell

``% brew install bash``

``% sudo chsh -s /usr/local/bin/bash $(whoami)``
