#!/bin/bash

file="/etc/selinux/config"

sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' $file
