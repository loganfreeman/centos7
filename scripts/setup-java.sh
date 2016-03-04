#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalJava {
	echo "installing oracle jdk: /vagrant/resources/$JAVA_ARCHIVE"
	FILE=/vagrant/resources/$JAVA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteJava {
	echo "install open jdk"
	yum install -y jdk-8u25-linux-i586
}

function setupJava {
	echo "setting up java"
	if [ -d /usr/local/jdk1.8.0_73 ]; then
		ln -sf /usr/local/jdk1.8.0_73 /usr/local/java
	else
		echo "something is wrong"
		exit
	fi
}

function setupEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> ~/.bashrc
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> ~/.bashrc
	source ~/.bashrc
}

function installJava {
	if resourceExists $JAVA_ARCHIVE; then
		installLocalJava
	else
		installRemoteJava
	fi
}

echo "setup java"
installJava
setupJava
setupEnvVars
