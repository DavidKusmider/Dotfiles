#!/bin/bash

### Variable

colorGreen="\x1b[32;49;1m"
colorBlue="\x1b[34;49;1m"
colorRed="\x1b[31;49;1m"
bold="\x1b[1m"
nameProjetForUrl=`pwd | cut -d / -f 7` 

# Exécutez la commande systemctl status tomcat et stockez la sortie dans une variable
status_output=$(systemctl status tomcat | head -n 8)


### Main execution

# Run your Maven and systemctl commands
sudo mvn clean install
sudo cp ./target/*.war /opt/tomcat10/apache-tomcat-10.1.13/webapps/
sudo systemctl restart tomcat


# Vérifiez si la commande a réussi (code de sortie 0)
if [ $? -eq 0 ]; then
	echo -e "\n\e[0;${colorGreen}Tomcat est en cours d'exécution :\e[00m"
    echo "$status_output"
else
    echo -e "\n\e[0;${colorRed}Tomcat n'est pas en cours d'exécution.\e[00m"
fi

echo -e "\n\e[0;${bold}------------------------------------------------------------------------------------------------------------\e[00m
\n
[\e[0;${colorBlue}INFO\e[00m] -  Done !  You can go check, to the next URL : localhost:8080/
\n
\e[0;${bold}------------------------------------------------------------------------------------------------------------\e[00m"


URL="http://localhost:8080/${nameProjetForUrl}"
# chromix-too tabs close :url http://${URL}

# google-chrome http://localhost:8080/${nameProjetForUrl}
echo "${URL}"


# Sortie du script
exit 0
