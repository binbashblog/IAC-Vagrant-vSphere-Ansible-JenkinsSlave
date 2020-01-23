# Script to set up any Windows Server 2012 and newer to work with Ansible
# To be used with Packer or other tool to create a fully patched Windows template, and slip this in as a first boot script, or something

# Author:
# Harp @ Saas Ops

# v1.2

# Encrypting/decrypting password via a file
# read-host -assecurestring | convertfrom-securestring | out-file .\ansible.txt
# Then just read the file into your script:
# $Password = get-content .\ansible.txt | convertto-securestring

winrm quickconfig -quiet # WinRM needs to be enabled for this to work, this is quick and dirty, we only need http unless we decide we need to secure this, for instance to use over a cloud provider
$Password = get-content .\ansible.txt | convertto-securestring

New-LocalUser "ansible" -Password $Password -FullName "ansible" -Description "account used by ansible" -PasswordNeverExpires -UserMayNotChangePassword -AccountNeverExpires # Creates the ansible user
Add-LocalGroupMember -Group Administrators -Member ansible # Ansible needs full access to the machine, but no one should use this machine to RDP.
