#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
ESMAJORVERSION="7"

if ! [ -e "/lib/systemd/system/elasticsearch.service" ]; then
	echo " * Setting up ElasticSearch $ESMAJORVERSION"

	echo " * Preparing install"
	curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch |  APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
	echo "deb https://artifacts.elastic.co/packages/$ESMAJORVERSION.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-$ESMAJORVERSION.x.list

	echo " * Refreshing packages"
	apt-get update

	echo " * Installing"
	apt-get install elasticsearch

	echo " * Configuring service"
	systemctl restart elasticsearch
	systemctl enable elasticsearch
	(systemctl status elasticsearch | grep -q running )|| (echo " ! Not running :(" && exit 1)
	echo " * Installed ElasticSearch"

else
	echo " * ElasticSearch $ESMAJORVERSION already installed"
fi
