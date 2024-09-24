#!/bin/bash

ANSIBLE_STDOUT_CALLBACK=yaml ansible-playbook ansible/playbook.yml -i ansible/inventory/eu-west-1.aws_ec2.yml

