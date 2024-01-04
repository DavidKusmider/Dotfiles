#!/bin/bash

colorGreen="\x1b[32;49;1m"
colorBlue="\x1b[34;49;1m"
colorRed="\x1b[31;49;1m"
bold="\x1b[1m"

if [[ $# -ne 2 ]]; then
	echo -e "\n[\e[0;${colorBlue}INFO\n[00m]1 or more paramaters are missing !"
else
	groupName=$1
	projectName=$2

	mvn archetype:generate -DgroupId=${groupName} -DartifactId=${projectName} -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false 	
	mkdir -p ./${projectName}/src/main/java  -p ./${projectName}/src/main/webapp/WEB-INF/classes
	echo -e "\n[\e[0;${colorGreen}INFO\e[00m] The generation of your project is done ! \e[0;${bold}${colorGreen} Leet it code !!\e[00m"
fi


