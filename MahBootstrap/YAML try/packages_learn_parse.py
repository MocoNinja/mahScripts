#! /usr/bin/python

import yaml

default_filename = "packages_learn.yml"

yaml_file = None

with open(default_filename, 'r') as stream:
    try:
        yaml_file = yaml.load(stream)
    except yaml.YAMLError as exc:
        print(exc)
        
if yaml_file != None:
    print("YAML file was successfully read!")
    print(yaml_file)
    
shell_packages = (yaml_file['packages'])[0]

print("The following packages were parsed as \"shell\"...")
print(shell_packages)
