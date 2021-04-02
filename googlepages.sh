#!/bin/bash

awk '{print $12, $7}' test.txt | grep -i 'google' | awk '{print $2}'

