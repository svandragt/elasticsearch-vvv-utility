#!/usr/bin/env bash

echo "Setting up ElasticSearch"

echo "Preparing"
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch |  APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

echo "Update packages"
apt-get update

echo "Getting latest ElasticSearch release"
apt-get install elasticsearch

echo "Configuring service"
systemctl start elasticsearch
systemctl enable elasticsearch
(systemctl status elasticsearch | grep -q running )|| (echo "Not running :(" && exit 1)

