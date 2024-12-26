#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "ERROR : pease run the script with root access"
yum install git -y
