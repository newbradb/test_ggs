#!/bin/bash

read filename

echo "`awk '{print $12, $7}' $filename | grep -i 'google' | awk '{print $2}'`"

