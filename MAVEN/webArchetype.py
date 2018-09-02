#! /usr/bin/env python3
# coding: utf-8

from sys import argv
from os import system

if len(argv) != 3:
    print("Wrong number of parameters passed...")
    pass
else:
    groupId = argv[1]
    artifactId = argv[2]
    var = "mvn archetype:generate -DgroupId={} -DartifactId={} -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false".format(groupId, artifactId)
    print("Leido ",var)
    system(var)


