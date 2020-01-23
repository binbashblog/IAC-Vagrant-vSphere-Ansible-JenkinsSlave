# Prerequisites

* Vagrant 2.2.6+
* vagrant-vsphere (vagrant plugin install vagrant-vsphere)
* Ansible 2.5+
** Linux needs the nokogiri package
*** For apt-based distros: 
    sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
    gem install nokogiri
*** For yum-based distros:
    sudo yum install -y rubygem-nokogiri
* Python
** pywinrm module for Ansible (pip install pywinrm)
sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
gem install nokogiri

...and anything else I may have forgot
