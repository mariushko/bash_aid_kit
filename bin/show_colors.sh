#!/bin/bash

# 0    reset all attributes to their defaults
# 1    set bold
# 2    set half-bright (simulated with color on a color display)
# 30   set black foreground
# 31   set red foreground
# 32   set green foreground
# 33   set brown foreground
# 34   set blue foreground
# 35   set magenta foreground
# 36   set cyan foreground
# 37   set white foreground

for color in 30 31 32 33 34 35 36 37
do
  for mode in 2 0 1
  do
    echo -e "\e[${mode};${color};40mColor [${mode},${color}]\e[47mColor [${mode},${color}]\e[0m"
  done
done
