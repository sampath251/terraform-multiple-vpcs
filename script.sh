#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx unzip
sudo chkconfig nginx on
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
