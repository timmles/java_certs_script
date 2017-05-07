#!/bin/bash -       
#title           :install_certs.sh
#description     :This script will find any .cer files in the same directory and install them to a given java cacerts file.
#                :And as always, if you don't understand how the script works, don't run it.
#author                     :timmles
#date            :20170331
#version         :0.1
#usage                      :bash mkscript.sh
#notes           :Run this script in git bash
#bash_version    :4.4.12(1)-release
#==============================================================================

# the keystore to install the certs to
keystore="/c/lib/jdk1.8.0_121/jre/lib/security/cacerts"

# loop through the current directory and find all *.cer files
for filename in ./*.cer; do
               # take the filename ('./filename.cer') and trim the leading './' and the trailing '.cer'
    SUBSTRING=$(echo $filename | cut -d '/' -f 2 | cut -d '.' -f 1)
               # run the java keytool to install the certs
                              # sets the alias as the filename
                              # assumes the keystore password is the default 'changeit'
                              # runs with noprompt so that the certs will silently install
    keytool -import -alias $SUBSTRING -file $filename -keystore $keystore -storepass changeit -noprompt
done

# you're welcome
