#!/bin/bash

chef-client -z -r 'recipe[provision]'
curl localhost:8888
echo
sleep 2
curl localhost:8888
echo
sleep 2
curl localhost:8888
echo
