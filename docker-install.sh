#!/bin/bash

function check(){
        docker --version &> /dev/null
        if [ "$?" != "0" ];then
                install
        else
                echo -e "---------------------------------------------"
                echo -e "Docker is already installed\n"
                docker --version
                echo -e "---------------------------------------------"
        fi
}

function install(){
        apt update &> /dev/null

        apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common &> /dev/null

        echo -e "Adding GPG Key..."
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

        echo -e "Adding Repository..."
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &> /dev/null

        apt update &> /dev/null

        echo -e "Installing Docker..."
        apt install -y docker-ce docker-ce-cli  containerd.io &> /dev/null

        systemctl start docker &> /dev/null

        systemctl enable docker &> /dev/null
        echo -e "\nDocker has been installed and enabled"
}

check
