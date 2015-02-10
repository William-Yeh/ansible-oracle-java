#!/bin/sh
# simple script to update the /etc/alternatives settings
# of Oracle JDK, if installed.
#

if [[ $# < 1 ]]; then
    echo "Missing argument: jdk_version"
    exit 1
fi 


jdk_version=$1
echo "Checking Java path: " /usr/java/jdk$jdk_version


#--------------------------------------#
# set /usr/java/default symbolic link
#

line=$(ls -l /usr/java/default)
if [[ $line =~ /usr/java/jdk$jdk_version$ ]]; then
    echo "Already done for '/usr/java/default'."

else

    if [ -L /usr/java/default ]; then
        echo "Removing symbolic link '/usr/java/default' ..."
        rm -f  /usr/java/default
    else
        echo "'/usr/java/default' should be a symbolic link; fixing..."
        rm -rf /usr/java/default
    fi

    echo "Re-linking '/usr/java/default' to chosen version..."
    ln -s  /usr/java/jdk$jdk_version  /usr/java/default

fi



#--------------------------------------#
# set alternatives
#

line=$(ls -l /etc/alternatives/java)
#echo $line


if [[ $line =~ /usr/java/default/bin/java$ ]]; then
    echo "alternatives system already done."

else
    echo "Updating /etc/alternatives ..."

    # set java link
    update-alternatives --verbose  \
        --install /usr/bin/java   java   /usr/java/default/bin/java 1  \
        --slave   /usr/bin/javac  javac  /usr/java/default/bin/javac   \
        --slave   /usr/bin/jar    jar    /usr/java/default/bin/jar

    echo "1" | update-alternatives --config java 

fi
