**********************
Database Installations
**********************
This section will describe the process of installing Relational Database 
Management Systems (RDBMS).

MySQL
=====
TBD

PostGreSQL
==========
#. Install PostGreSQL with the following commands.

   .. code-block:: bash 

      brew install postgresql 

#. Start service with the following command 

   .. code-block:: bash 

      brew services start postgresql 

#. Login to postgresql 

   .. code-block:: bash 

      psql postgresql 

#. Create role

   .. code-block:: bash 

      CREATE ROLE username WITH LOGIN PASSWORD 'passowrd';

#. Alter role 

   .. code-block:: bash 

      ALTER ROLE username ROLES;

where ``ROLES`` could be ``CREATEDB``, ``SUPERUSER``. ``REPLICATION``.
``BYPASS RLS``, etc.

SQL-Server
==========
#. Install `Docker <https://docs.docker.com/desktop/install/mac-install/>`_

   a. Click the install for the correct chip type
   b. Once downloaded move the docker into the Applications folder
   c. Open docker and configure with standard settings.
   d. Sign up for docker service if you have not already done so.
   e. Click on the settings icon and navigage to advanced
   f. In the settings, ensure at least 4Gb of memory is allocated

#. Install Azure Data Studio

   a. Navigate to the 
      `Azure <https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16&tabs=redhat-install%2Credhat-uninstall>`_ web site.
   b. Click on the MacOS zip file.
   c. This automatically installs to the Download folder.  Move the Applications
      to the Applications folder once the download is finished.

#. Download the MS SQL Container Image 

   a. Navigate to `Azure SQL <https://hub.docker.com>`_
   b. Type ``azure sql edge`` into the docker hub search
   c. Find and click on the azure sql edge icon supplied by microsoft  
   d. Find the terminal con the top right corner of the screen.  Copy the 
      command and paste into terminal.
   e. Once the command is complete, you should be able to see the image 
      in docker.

#. Run the SQL image in a container.

   a. While inserting an appropriate password Run this command 

      .. code-block:: bash

         docker run --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=yourStrong(!)Password'\ 
         -e 'MSSQL_PID=Developer' -p 1433:1433 --name azuresqledge -d mcr.microsoft.com/azure-sql-edge

   b. If executed correctly then the Docker image should show that it is in use.

#. Connect Azuer Data Studio to database

   a. Open Azure Data studio
   b. Click on Create a connection
   c. Set user to sa and fill out other information. Also set server to localhost for local operations.
   d. Also set Authentical to SQL Login and click connect

