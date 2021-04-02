#!/bin/bash

date > date.txt
awk '{print $2} {print$3}' date.txt 
