*********************
Package Installations
*********************
Unlike Linux Operating Systems, a Macintosh computer comes with an Operating System 
and Desktop Environment pre-installed.  As a result, a Macintosh computer allows 
a user to focus on the installation of individual products that they can use to be
more effective as a developer or engineer.

Brew
====
The first thing a user should install is the Brew package manager.  We will use this
command line utility to download and manage packages for us.  Open your terminal 
and type the following command.

.. code-block:: bash

   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Git 
===
The next fundamental tool that is required for many of the steps described in this document 
is the ability to access and manage git repositories as well as Github.  This section will 
describe the step by step process to interact with these tool sets.

#. Download git with the following command.

   .. code-block:: bash 

      brew install git 

#. A git repository is hosted locally on your machine.  This can allow a user to manage revisions
   of a code base.  However, you will need Github to publically share your repository in order to
   distribute it or to allow for joint development.  If you do not have a Github account you should 
   log on the `Github <https://github.com>`_ site and create an account.

#. Install ``gh`` to reduce the complexity required by providing credentials at each software
   commit.  Enter the following command into your Terminal.

   .. code-block:: bash 

      brew install gh

#. Configure the ``gh`` utility.  Start by typing the following command into your terminal.

   .. code-block:: bash 

      gh auth login 

#. Log into your Github user account and click on the User icon in the upper right.

#. Click on Settings.

#. Click on Developer Settings.

#. Click on Personal Access Tokens.

#. Click on Generate new token (classic style).

#. Give the token a name and click on the appropriate settings/privileges for
   your repository, finally clicking generate token.

#. Save the token to a password file, somewhere of your choosing.  You may also choose 
   to encrypt the file for privacy.

#. Once you have a password, you can now associate the password with your git 
   permissions by tpying the following command into the terminal.

   .. code-block:: bash 

      gh auth login 

   Follow the instructions to associate your key with github.

Download Mac_Config
===================
Download configuration files for Macintosh from github.  This command 
will download the file to your home directory.

.. code-block:: bash 

   git clone https://github.com/Jon-Webb-79/Mac_Config.git ~/Mac_Config 

ITerm2
======
The out of the box Desktop Environment comes pre-installed with a Terminal.
However, their is another Terminal called ``ITerm2`` that contains the same
capability as the Terminal provided at installation, but with increased 
functionality.  Download ``ITerm2`` with the following command.

.. code-block:: bash 

   brew install --cask iterm2 

At this point, ``ITerm2`` should be available in the Applications menu.  While
the reader can continue to use the out of hte box Terminal, I recommend 
switching to ``ITerm2`` for all future terminal commands.

Install Powerline Fonts
=======================
This step is necessary to install fonts that will be useful for powerline 
status bars.

#. Download the fonts repository

   .. code-block:: bash 

      git clone https://github.com/powerline/fonts.git --depth=1

#. Install fonts 

   .. code-block:: bash 

      cd fonts 
      ./install.sh 

#. Cleanup unused fonts 

   .. code-block:: bash 

      cd ..
      rm -rf fonts 

NeoVim
======
Next we will install and configure NeoVim.

#. Install NeoVim from brew 

   .. code-block:: bash 

      brew install neovim

#. Install the Packer NeoVim package manager from git 

   .. code-block:: bash 

     git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim 

#. Create a ``nvim`` directory in your ``.config`` directory.

   .. code-block:: bash 

      mkdir ~/.config/nvim

#. Move the ``nvim`` configuration file from the ``Mac_Config`` directory 
   to your ``nvim`` directory.

   .. code-block:: bash 

      cp -r ~/Mac_Config/.config/nvim ~/.config/nvim/

#. Temporarily move the ``.config/nvim/after`` directory to the Desktop 
   so it does not interfere with the package download process.

   .. code-block:: bash 

      mv ~/.config/nvim/after ~/Desktop/

#. Open the ``packer.lua`` file with neovim

   .. code-block:: bash 

      nvim ~/.config/nvim/lua/core/packer.lua 

#. From within NeoVim download all packages by depressing the ``:`` key 
   and then typing ``PackerSync``.  The bottom of the NeoVim window should 
   look like this, then press enter.

   .. code-block:: bash 

      :PackerSync 

#. Now that all packages are downloaded, move teh ``after`` directory back to 
   the ``nvim`` directory.

   .. code-block:: bash 

      mv ~/Desktop/after ~/.config/nvim/

#. Open up a file with NeoVim and ensure that it is performing correctly.
   While this should provide you a working version of NeoVim, I encourage
   you to review all of the files in the ``nvim`` directory to understand
   how they work together and also you should explore other packages that 
   may customize NeoVim better for you.

#. At this point the scrolling rate in neovim may be slow.  To fix this 
   got to Settings->Keyboard and set the Key Repeat rate to the maximum
   value.

Install tmux 
============
#. Install tmux with the following command.

   .. code-block:: bash 

      brew install tmux 

#. Once tmux has been installed, check to see that it is working properly
   by typing tmux.  If it is working properly, kill the session and exit
   by typing 

   .. code-block:: bash 

      tmux kill-session 

#. Clone the plugin manager.

   .. code-block:: bash 

      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/ 

#. Move the ``tmux.conf`` file from the cloned directory to the home directory.

   .. code-block:: bash 

      cp ~/Mac_Config/tmux.conf ~/tmux.conf

#. Open tmux and type ``Control-A-I`` to install all plugins

Install Bash 
============
Bash used to be the default shell environment for Macintosh window but 
still can be used as the backup shell.  In this section we will install 
all Bash schell scripts to run a bash environment in a Macintosh computer.

#. Install bash.  **NOTE:** Bash is already installed, but it is likely an
   outdated version.  This step will install a more up to date bash shell.

   .. code-block:: bash 

      brew install bash 

   The default Bash is installed to ``/usr/local/bin/bash``; however, the 
   version you just installed is located at ``/opt/homebrew/bin/bash``.

#. Change the default shell to bash.  **NOTE:** We will change this back to 
   zshell shortly.

   .. code-block:: bash 

      sudo chsh -s /opt/homebrew/bin/bash $(wwhoami)

#. Move the ``c_files``, ``c++_files``, ``bash_scripts`` and ``py_files``
   directories from the ``Mac_Config`` directory to the ``.config`` 
   directory.

   .. code-block:: bash 

      cp -r ~/Mac_Config/.config/c_files ~/.config/c_files 
      cp -r ~/Mac_Config/.config/c++_files ~/.config/c++_files
      cp -r ~/Mac_Config/.config/py_files ~/.config/py_files/ 
      cp -r ~/Mac_Config/.config/bash_scripts ~/.config/bash_scripts 

#. Move the bash config files to the home directory.  If you have a 
   ``.bashrc`` or ``.bash_profile`` file, delete those before this step.

   .. code-block:: bash 

      cp ~/Mac_Config/.config/.bashrc ~/.bashrc 
      cp ~/Mac_Config/.config/.bash_profile ~/.bash_profile 

#. Refresh the terminal by closing it and re-opening it.  Once you reopen 
   the terminal you should notive the powerline fonts on the botom of the 
   terminal and a new color scheme.  If the icons are not properly showing
   in the terminal, you need to open the ITerm2 settings and change to a 
   powerline font.  

#. Investigate the ``~/.config/bash_scripts/.bash_alias`` file.  This file
   contains several aliases that can be used to manage daily activities and
   code development environments.

Install ZShell 
==============
ZShell is now the standard shell environment for Macintosh computers, so 
it is likely that you are currently logged into zshell.  However, if you 
are not, and you are currently using a Bash terminal, switch to zshell 
with the following command.

.. code-block:: bash 

   sudo -s /bin/zsh 

Exit the terminal and re-open into a zshell environment.

When installing Bash we already moved the ``c_files``, ``c++_files``, 
``py_files``, and ``bash_scripts`` files from the ``Mac_Config`` directory 
to the ``.config`` directories.  Now lets move the ``zsh_scripts`` 
directory to the ``.config`` directory with the following command.

.. code-block:: bash 

   cp -r ~/Mac_Config/.config/zsh_scripts ~/.config/zsh_scripts 

Next, lets move the zsh config files to the home directory with the 
following commands.

.. code-block:: bash 

   cp ~/Mac_Config/.config/.zshrc ~/.zshrc 
   cp ~/Mac_Config/.config/.zsh_profile ~/.zsh_profile 

Now if you close the terminal and re-open it, you should be logged into 
a fully funcitonaing zshell terminal.  Take some time to log into the 
``~/.config/zsh_scripts`` directory and view the ``.zsh_aliases`` file 
to understand the capabilities enabled in that file.

Install Misc Tools 
==================
Consider the installation of the following tools

.. code-block:: bash 

   brew isntall --cask google-earth-pro 
   brew install htop 
   brew install tree 
   bre install --cask textmate 
   brew install rsync 
   brew install neofetch 
   brew install master-pdf-editor 
   brew install --cask libreoffice 
   brew install openssh 
   brew install fail2ban 
   brew install --cask cron

Install Python 
==============
Macintosh computers come pre-installed with Python; however, the installed
Python version is most likely outdated.  Install a modern version with the 
following commands.

.. code-block:: bash 

   brew install python3 
   python -m ensurepip --upgrade

Install pyppoetry as a package manager.

.. code-block:: bash 

   curl -sSL https://install.python-poetry.org | python3 -
   poetry config virtualenvs.in-project true

Instal General Software Development Packages 
=============================================
Install the following software development tools.

.. code-block:: bash 

   brew install git 
   xcode-select --install 
   brew install googletest 
   brew install cmake 
   brew install cmocka

Install Arduino if it a required package 
========================================
Arduino support packages can be installed with the following commands. 

.. code-block:: bash 

   brew install --cask arduino 
   brew install arduino-cli
   arduino-cli core update-index 
   arduino-cli board list 
   arduino-cli core install arduino:avr 
   arduino-cli core list 

Install the Arduino AVER C Support 

.. code-block:: bash 

   brew tap osx-cross/avr 
   brew install avr-gcc 
   brew install avrdude 

Backup 
======
Format the drive.  Click on the ``Disk Utility``.  Click on the backup drive,
then click Erase.  This should prompt the user to enter the format type,
which should be ``MacOS Extended (journaled)``
