***********************
Macintosh Configuration
***********************
This repository contains scripts, files, and data used to configure a Macintosh system.

.. image:: https://img.shields.io/badge/code%20style-black-000000.svg
    :target: https://github.com/psf/black

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
4. If you do not have git installed, then do so with the command
   ``brew install git``
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

``% brew install --cask iterm2``

NeoVim
******
Navigate to your home directory.  Install NeoVim with the following command

``% brew install neovim``

Install and configure related packages with the following commands

``% curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim``
``% brew install npm``

``% brew install node``

``% brew install python@3.XX``

In the above command, ``XX`` designates whatever version of Python you want to download.
Currently, this will install to the ``/opt/homebrew/bin/`` directory.  However, this
can change, so please check which directory it is installed to with the ``which python3``
command.  You will need this information later in the installation process.

``% pip3 install powerline-status``

``% pip3 install jedi``

Install Powerline fonts by cd'ing to your home directory and running the following command

``% git clone https://github/powerline/fonts.git --depth=1``

Then install the powerline fonts.  First navigate the the fonts directory you just created.

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

``% git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm``

Move the ``.tmux.conf`` file from the cloned directory to the users
home directory.  Open a tmux session and type ``Control-A-I`` to install
all plugins.

Bash
####
Apple no longer uses Bash as the default terminal application.  As a result
the Apple version of bash is very old.  In oder to upgrade to a newer
version of bash, type in and enter the following command to your terminal.

``% brew install bash``

The default version of bash is installed to ``/usr/local/bin/bash``;
however,  the new version will be installed to ``/opt/homebrew/bin/bash``. 
Next, we will change from the default zshell to bash with the folllowing command.

``% sudo chsh -s /opt/homebrew/bin/bash $(whoami)``

Move the ``c_files``, ``c++_files``, ``bash_scripts`` and ``py_files`` directories
from the cloned copy into the ``.config`` directory.  Next move the ``.bash_profile``
and ``.bashrc`` files from the cloned copy to the home directory.  Close the terminal
andd re-open.  If the files are working correctly there should be no errors and
the powerline status bar should appear at the bottom of the terminal.  If the powerline
status bar is not displayed, or you recieve a warnging, this is likely caused by
an error in the ``PATH`` on line 22, or the powerline source entered on line 44 of the
``.bashrc`` file.

Zsh
###
If you are logged into a Bash terminal change to a Zsh terminal with the following command;

``% sudo -s /bin/zsh``

Exit the terminal and reopen into a Z shell.

Move the ``c_files``, ``c++_files``, ``zsh_scripts`` and ``py_files`` directories
from the cloned copy into the ``.config`` directory.  Next move the ``.zsh_profile``
and ``.zshrc`` files from the cloned copy to the home directory.  Close the terminal
andd re-open.  If the files were properly transferred, when you open up the terminal
the powerline status display should be present.  However, it is likely that the user
will see several warnings displayed.  THis is likely due to the fact that the the plugins
entered on lines 53 to 65 of the ``.zshrc`` file have not been downloaded.  If this is
the case navigate to the ``~/home/.local/zsh_scripts/plugins`` directory.  Clear
any directories that may be in there, and follow the git clone instructions
on lines 57, 61, and 65 of the .zshrc file.

Install Misc.Tools
##################

``% brew install --cask google-earth-pro``

``% brew install htop``

``% brew install tree``

``% brew install --cask textmate``

``% brew install rsync``

``% brew install neofetch``

``% brew install master-pdf-editor``

``% brew install --cask libreoffice``

``% brew install openssh``

``% brew install fail2ban``

Install Arduino
###############
Install arduino packages.  This only applies if you have an arduino baord.

``% brew install --cask arduino``

``% brew install arduino-cli``

Update the local cache of available platforms

``% arduino-cli core update-index``

Check to see if the board is connected.  This assumes the arduino board is plugged
into a USB port

``% arduino-cli board list``

Install the platform for your board

``% arduino-cli core install arduino:avr``

Verify that the board is installed

``% arduino-cli core list``

Install AVR Support
###################
Install relevant packages.  This only applies if you plan to use standdardd C to write for
Arduino boards.

``% brew tap osx-cross/avr``

``% brew install avr-gcc``

``% brew install avrdude``

Install Extra Codde Dev Packages
################################

``% brew install googletest``

``% brew install cmake``

``% brew install --cask visual-studio-code``

``% brew install cmocka``

Install Poetry for Python
#########################
Install the Poetry package manager for Python

``$ curl -sSL https://install.python-poetry.org | python3 -`` 

Set virtual environment installs to local package

``$ poetry config virtualenvs.in-project true``

Unfortunately any ``brew`` updates to python are not reflected in ``poetry``.  If
poetry stops working it is likely caused by a mismatch between an upgraded version
of poetry and the base python versions.  In this event, delete the ``pypoetry`` folder
with the following command.

``rm -r /Library/Application Support/pypoetry``

Once the above folder has been deleted, re-install poetry.

Backup
######

1. Format the drive.  Click on the ``Disk Utility``.  Click on the backup drive,
   then click Erase.  This should prompt the user to enter the format type,
   which should be ``MacOS Extended (journaled)``
