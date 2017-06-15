#!/bin/sh
project_name=$1
echo start to transfer example to $project_name
if [ x"$project_name" = x ] 
then
	echo no project name,exit!!!
	exit
fi
#clean
mvn clean

#rename packageName
#module
find . -name 'example-server' -printf %h\\n | xargs -i{} mv {}/example-server {}/$project_name-server
find . -name 'example-service' -printf %h\\n | xargs -i{} mv {}/example-service {}/$project_name-service
find . -name 'example-api' -printf %h\\n | xargs -i{} mv {}/example-api {}/$project_name-api
#packge
find . -name 'example' -printf %h\\n | xargs -i{} mv {}/example {}/$project_name
#conetent 
sed -i "s/example/$project_name/g" `find . -name '*.properties'`
sed -i "s/example/$project_name/g" `find . -name '*.java'`
sed -i "s/example/$project_name/g" `find . -name 'pom.xml'`
sed -i "s/example/$project_name/g" `find . -name '*Mapper.xml'`

#新的项目
mkdir ../$project_name
cp -r `ls -A|grep -v ".git$"|xargs` ../$project_name
git checkout .
rm -rf "$project_name"*
