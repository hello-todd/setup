#!/bin/bash

cp ~/.bashrc ~/.bashrc.bak

sudo apt install $(cat tools.list | tr "\n" " ") -y
