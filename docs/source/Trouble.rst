***************
Troubleshooting
***************
This chapter contains information on how to trouble shoot the various
utilities on your computer system.

Update Mac 
==========
Unlike a distrobution such as Arch Linux, the Macintosh System is fairly stable 
and does not need to be updated regularly.  However, if you are using Homebrew 
to manage packages, and you want those packages to be up to date, it is recommended
that you conduct updates once every few days.  This section walks a user through 
the process of updating a Macintosh computer.

#. Within Macontosh computers it is common that a file titled ``DS_Store`` will
   randomly show up in a folder.  These files are a natural part of the Macintosh 
   ecosystem; however, they can clutter up your filesystem, and can also contain 
   data that could be exploited by a hacker.  For this reason we want to clean
   these files up perdiodically.  You ``.bash_aliases`` and ``.zsh_aliases`` files 
   contain an alias to cleanup these files titled ``cleanupDS``, lets use this 
   alias 

   .. code-block:: bash 

      cleanupDS

#. Cleanup any disconnected or no longer used Brew packages.

   .. code-block:: bash 

      brew doctor 

#. Update packages.

   .. code-block:: bash 

      brew update 

#. If the previous commands show any outdated packages, you should upgrade 
   them with the following command.

   .. code-block:: bash 

      brew upgrade 

#. If you upgraded any packages you should restart your computer for those 
   changes to take effect.

Cron Tab
========
Cron is a utility that allows you to schedule tasks on your computer.
Check to verify that ``cron`` is installed

.. code-block:: bash 

   which cron 

If nothing is returned then you should install ``cron`` with the following
command. 

.. code-block:: bash 

   brew install --cask cron 

The cron tab has the folllowing format.

.. code-block:: bash 

   # Crontab file for jonwebb
   # https://www.youtube.com/watch?v=IPLFpqPAn5A for examples
   # https://www.youtube.com/watch?v=QZJ1drMQz1A for more examples
   # |-------------- minute (0 -59)
   # | |---------------- hour (0 -23)
   # | | |------------------ day of month (1 - 31)
   # | | | |-------------------- month (1 -12)
   # | | | | |---------------------- day of week (0 - 6) (Sunday to Saturday)
   # | | | | |                                           7 is also Sunday on some systems
   # | | | | |
   # | | | | |
   # * * * * *

The cron files are stored in ``/usr/lib/cron/tabs/username``.

Fail2Ban Configuration
======================
Fail2ban is a utility that helps manage the security of our system.  More 
information on Fail2ban can be found at the 
`Arch Linux Fail2Ban Wiki <https://wiki.archlinux.org/title/fail2ban>`_
#. First check to see if fail2ban is already installed

   .. code-block:: bash 

      which fail2ban 

   If the response to the above command returns nothing, then fail2ban is not installed.
   The command to install fail2ban is shown below;

   .. code-block:: bash 

      sudo pacman -S fail2ban

#. Transition to root user 

   .. code-block:: bash 

      su 

   Enter your root password when prompted.

#. Edit the fail2ban file 

   .. code-block:: bash 

      cd /etc
      nvim fail2ban/fail2ban.conf 

#. Set ``dpurge`` to ``7d``, which will purge the banned list once every 7 days.

#. Close and save the ``fail2ban.conf`` file.

#. Copy the ``fail2ban.conf`` file to ``fail2ban.local`` 

   .. code-block:: bash 

      cp fail2ban/fail2ban.conf fail2ban/fail2ban.local 

#. Configure ``jail.conf``

   .. code-block:: bash 

      nvim /fail2ban/jail 

   Find ``# ignoreip`` and uncomment it.  Write the ip address of any addresses 
   that you do not want banned for incorrectly logging in.

   Set ``findtime`` to ``7m``
   Set ``maxretry`` to ``3``
   Set ``bantime`` to ``1h``
   Set ``send and recieve e-mails`` to your preferred e-mail address for notifications
   Enable all relevant attack vectors

#. Close the ``jail.conf`` file.

#. Copy ``jail.conf`` to ``jail.local``

   .. code-block:: bash

      cp fail2ban/jail.conf fail2ban/jail.local

rsync
=====
Rsync is a utility that allows a user to transfer information from one 
hard drive to another.  This is useful for conducting backups and for 
transmitting information over an ssh socket.  More information on the 
rsync utility can be found at the 
`Arch Linux rsync Wiki <https://wiki.archlinux.org/title/rsync>`_

#. If ``rsync`` is not installed, install it with the following command.

   .. code-block:: bash 

      sudo pacman -S rsync 

#. The rest of this section will be predicated on the process of backing 
   up the home directory to a thumb drive.  For the sake of this section 
   assume the backup drive is located at ``/run/media/username/drive_1``.

#. The first time backing up the home directory, use the following command.

   .. code-block:: bash 

      rsync -arvn --dry-run home/ /run/media/username/drive_1

   The above command will only test to ensure that you are backing up the right 
   information, but will not back it up.

#. Assuming the above command was successful then proceed with the following 
   command 

   .. code-block:: bash 

      rsync -arv /home/username /run/media/username/drive_1

   Every time after this, run 

   .. code-block:: bash 

      rsync -arv --delete /home/username/ /run/media/username/drive_1 

   The above command will delete files on the tumb drive, which were in a
   previous backup, but deleted from the primary server since the last 
   backup.

SSH Configuration 
=================
SSH is a utility that allows us to log into one computer or server from 
another computer or server. This section will walk a reader through the 
process of configuring ssh on the client and server side.  More information 
can be found on the 
`Arch Linux ssh Wiki <https://wiki.archlinux.org/title/OpenSSH>`_

Client Side 
-----------
#. Verify that openssh is installed 

   .. code-block:: bash 

      which ssh 

   if the above command returns nothing, then openssh is not installed and needs 
   to be installed 

   .. code-block:: bash 

      sudo pacman -S openssh 

#. Verify that you can ssh into the server of interest, then exit the server. 
   This assumes that the reader knows the ip and port number of the server they 
   are logging into.  In addition, the user can ommit the < and > symbols 
   when they enter the appropriate information.  If you are trying to set up the 
   ability to ssh into a fresh install, the port number is likely 22.  This 
   command should prompt the user for a password given to them by the server 
   administratory.

   .. code-block:: bash 

      ssh -p <portnumber> <username>@<ipaddress>

   Assuming the reader was succesful in ssh'ing into the server, then exit the 
   server by simultaneously pressing the Control and d keys.

#. Generate public/private key set if the server allows you to create one on 
   your computer and send it to the server.

   #. If a ``.ssh`` directory does not exist in your home directory, then create;

      .. code-block:: bash 

         mkdir ~/.ssh

   #. Change to the ``.ssh`` directory.

      .. code-block:: bash 

         cd ~/.ssh 

   #. Generate the ssh key with the following command.  They keytape can be 
      ``rsa``, ``dsa``, ``ecdsa``, or ``ed25519``.  The defauly keytype is 
      ``rsa`` but I prefer to use ``ed25519``.  The description should be one word.

      .. code-block:: bash 

         ssh-keygen -t <keytype> -C <brief_description>

   #. Rename the key to something descriptive of its use.  Renaming should include 
      the path length when prompted.

   #. Give the key a passphrase, preferable different than the password used in 
      step 2.

   #. The completion of the above commands should generate a public ``.pub``
      password file and a private password file.  Never expose the private key.

#. Send the publick key to the server

   #. Send the key to the server 

      .. code-block:: bash 

         ssh-copy-id -i ~/.ssh/<key_name.pub> <username>@<ipaddress>

   #. Enter the password 

   #. Verify the key works 

      .. code-block:: bash 

         ssh -p <portnumber> <username>@<ipaddress>

      In the server, ensure that you are in the ``.ssh`` directory and verify that 
      the authorized key file contains your password.

   #. Exit by depressing ``Control-d``

#. Associate the key on your computer with the server 

   #. Associate key 

      .. code-block:: bash 

         ssh -i ~/.ssh/<private_key> <username>@<ipaddress> 

      This should require the passphrase to be entered, not the password 

   #. Connect 

      .. code-block:: bash 

         ssh -p <portnumber> <username>@<ipaddress> 

      Type the passphrase, not the password 

#. Configure the computer to remember the passphrase 

   #. Determine if the ssh-agent is turned on 

      .. code-block:: bash 

         ps aux | grep ssh-agent

      If the output has th eword grep in it, it is not active.

   #. Enable ssh-agent if it is not running.

      .. code-block:: bash 

         eval "$(ssh-agent)"

      Repeat step the previous to ensure ssh-agent is running.

   #. Add key to ssh-agent 

      .. code-block:: bash
      
         ssh-add ~/.ssh/<private_key_name>

      Enter the passphrase.  ssh into the client to see if it requests they
      passphrase.  If it asks for the passphrase then the reader made a mistake 
      and should repreat the previous step.  Control-d to leave the server

#. Set up the config file 

   #. cd into the .ssh directory 

      .. code-block:: bash 

         cd ~/.ssh 

   #. Create a file titled ``config``

      .. code-block:: bash 

         nvim config 

      Add the following information to the config file 

      .. code-block:: bash 

         Host <user_defined_short_name> 
         Hostname <ip_address>
         Port <portnumber> 
         User <username> 
         IdentityFile ~/.ssh/<private_key_name> 

#. From now on you can log onto the server by typing 

   .. code-block:: bash 

      ssh <user_defined_short_name>

Server Side 
-----------
#. Verify that the server ssh client exists.

   .. code-block:: bash 

      which sshd 

   If the server side client does not exist, then install it.

   .. code-block:: bash 

      sudo pacman -S ssh-server 

#. Check the status of sshd 

   .. code-block:: bash 

      systemctl status sshd 

#. If necessary we can restart, stop, or enable sshd 

   .. code-block:: bash 

      systemctl restart sshd 
      systemctl stop sshd 
      systemctl start sshd 
      systemctl enable sshd 

#. Modify the ``ssh_config`` file.

   #. ``cd`` to the appropriate directory 

   .. code-block:: bash 
       
      cd /etc/ssh 
   
      **WARNING** Do not delete any files in this directory 

   #. Open the config file 

   .. code-block:: bash 

       sudo nvim sshd_config 

   #. If ``Port`` is set to 22, set it to any other larger number.  You will need 
      to ensure this is reflected on the client side config file.

   #. Add specific users after the ``Allowusers`` keyword

   #. Reset ``PermitRootLogin`` from ``prohibit-password`` to ``no``.

      **NOTE:** Ensure there is a sshkey relationship between all clients before doing this.

   #. Restart and re-enable the ssh server using the previous commands.

#. Lock down the server side files.

   #. Lock down the ``authorized_keys`` file. 

   .. code-block:: bash 

      chmod 400 ~/.ssh/authorized_keys

   #. Set an immutable bit on the ``authorized_keys`` file.  This may require 
      super user privileges

   #. chattr +i ~/.ssh/authorized_keys 

   #. Repeat the previous step on the ``.ssh`` directory 

   .. code-block:: bash 

      chattr +i ~/.ssh 

   #. Immutable bits can be un-set with the following commands 

   .. code-block:: bash 

      chatter -i ~/.ssh/authorized_keys 
      chattr -i ~/.ssh 

#. Login attempts can be viewed with the ``journalctl`` command.

   .. code-block:: bash 

      journalctl --since "5 min ago"
