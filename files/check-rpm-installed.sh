#!/bin/sh
# simple script to query the existance of specific Oracle jdk RPM package, if installed.
#
# @return: JSON string : { "found": true/false, "not_found": true/false } 
#

PACKAGE=jdk.?$1

line=$(rpm -qa | egrep $PACKAGE | wc -l)
#line=$(rpm -qa jdk-1.7.0_22)
#line=$(rpm -qa jdk1.8.0_31)
#echo $line


if [[ $line =~ 0 ]]; then
  echo '{ "found": false , "not_found": true  }'

else
  echo '{ "found": true  , "not_found": false }'

fi
