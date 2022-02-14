#!/bin/bash
#Install Pre reqs
echo "Installing Prereqs"
DownloadUrl="https://www.free-css.com/assets/files/free-css-templates/download/page274/nekmit.zip"
sudo yum update -y &>> /dev/null
sudo yum install httpd -y
sudo yum install wget -y
sudo yum install unzip -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd

mkdir -p /tmp/sitefiles/
cd /tmp/sitefiles
wget $DownloadUrl

##Get Folder Name
echo "Download url : " $DownloadUrl
IFS='/'
read -ra URLArray <<< "$DownloadUrl"
len=${#URLArray[@]}
DirWithExt=${URLArray[$len-1]}
echo "Download url is "+ $DownloadUrl
echo "Dir with extnison is : "+  $DirWithExt	

#Get Filename
IFS='.'
read -ra DirArray <<< "$DirWithExt"
DirName=${DirArray[0]}
mkdir -p $DirName
echo $DirName	

sudo rm -r /var/www/html/*


sudo unzip -d $DirName/ $DirName
cd $DirName
cd $DirName

#Copy files to /var/www

sudo cp -r * /var/www/html/
sudo ls /var/www/html/
sudo systemctl restart httpd