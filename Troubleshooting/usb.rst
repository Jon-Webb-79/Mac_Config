*****************
USB Configuration
*****************
This file describes how to configure and format usb drives
to include backup drives and thumb drives.

1. Determine where the backup drive is located

   a. Type ``df`` to determine where the drive is located.  For this example
      lets assume the drive is ``/dev/sda1``

   b. Unmount the drive with the following command;

      ``% sudo umount /dev/sda1``

   c. Format the drive to a linux format

      ``% sudo mkfs.ext4 /dev/sda1``

   d. You can also reformat a  drive by opening Disk Utility, clicking
      on the external drive you wish to reformat and then selecting
      the format type.  I recommend ``Mac OS Extended (Journaled)``.
      The drive can also be re-labeled from this method.  This should
      prompt the user to set up the backup drive for use with TimeMachine
      which will create a master backup and successive snapshots.
