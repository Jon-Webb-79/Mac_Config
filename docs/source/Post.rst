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

