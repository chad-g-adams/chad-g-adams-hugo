+++
categories = []
date = "2020-05-24T14:44:53-04:00"
description = ""
keywords = ["tax", "studiotax", "ubuntu"]
tags = ["tax", "StudioTax", "ubuntu"]
title = "StudioTax 2019 on Ubuntu"

+++

[StudioTax](https://www.studiotax.com) is free tax software for Canadians. It's pretty great to have this free way to file your taxes, but the supported operating systems are Windows, Mac, iOS and Android.. unfortunately no Linux.

For [security reasons](https://en.wikipedia.org/wiki/Watering_hole_attack), I never do work with sensitive/confidential information on the same system I use for browsing/social media/general use.. This rules out doing anything tax-related on my phone. But luckily it's quite easy to spin up a secure Ubuntu system on any old laptop or desktop you may have lying around. 

Here is how I got StudioTax running on Ubuntu with VirtualBox:

1. Install Ubuntu 20.04. Make sure you'll have 20-30 GB free disk space after ubuntu is installed (needed to start windows in VirtualBox).
2. Apply all the latest patches on Ubuntu to be sure you have the latest security updates before starting.
3. Install [VirtualBox](https://www.virtualbox.org/)
4. Download [Windows 10](https://www.microsoft.com/en-us/software-download/windows10) ISO file
5. Use VirtualBox to install a Windows 10 system inside of your Ubuntu system. (Link the ISO file into the "Storage" settings to get the Windows installation going).
6. Once Windows is installed and running, apply all Windows updates to make sure you have the latest security updates before you start.
7. Using Windows now, you can download StudioTax. Install StudioTax as administrator.
8. Good to go!

To transfer files between Ubuntu and Windows, you can do the following:

1. In VirtualBox menu of the running Windows system, go to "Devices -> Insert Guest Additions CD Image"
2. In Windows now, open the File explorer and navigate to the newly added "CD Drive". Run the application VBoxWindowsAdditions
3. In VirtualBox menu go to "Machine -> Settings -> Shared Folders"
4. Add new shared folder. Select the Ubuntu folder you would like to share, and for the mount point you can just put `G:`
5. The `G:` location should now appear in Windows File Explorer and you can use it like any other folder. (If it doesn't show, check under the "Network" section of File Explorer)


