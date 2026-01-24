#!/bin/bash 

dnf install ansible -y 
# push 
# ansible-playbook -i inventory mysql.yaml 

# pull 
ansible-pull -i localhost, -U https://github.com/Trinath9395/roles-ansible-tf.git main.yaml -e component=backend -e environment=$1 
