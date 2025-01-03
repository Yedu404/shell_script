#!/bin/bash

DATE=$(date +'%Y-%m-%d-%H-%M-%S')
SCRIPT_NAME=$0
LOGFILE=/tmp/SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
  if [ $USERID -ne 0 ]
  then
  echo -e "$1  $R failure $N "
  exit 1
  else
  echo -e "$2  $G succes $N "
  fi  
}


USERID=$(id -u)



if [ $USERID -ne 0 ]
then
echo "ERROR : pease run the script with root access"
exit 1
fi
yum install git -y &>>$LOGFILE 

VALIDATE $?

yum install postfix -y &>>$LOGFILE

VALIDATE $? "installation "