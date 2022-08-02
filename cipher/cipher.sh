#!/bin/bash
# Script for cipher text and files
# Author: Thaer Maddah
# Version: 0.1
################################################################################
################################################################################
# Help
################################################################################
################################################################################
Help()
{
   # Display Help
   echo "Caesar cipher script"
   echo
   echo "Syntax: scriptTemplate [-e|d|f|h|t|v]"
   echo "options:"
   echo "-e     encode"
   echo "-d     decode"
   echo "-f     file name"
   echo "-h     Print this Help."
   echo "-t     text"
   echo "-v     Print software version and exit."
   echo
}


################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################

[[ $1 == "" || $2 == "" ]] && Help || txt=$2

while getopts ":e :d f: t: :h :v" flag
do
    case "${flag}" in
        e) [[ -n $2 ]] && echo "The cipher text is:" 
            cipher="tr [A-Za-z] [X-ZA-Wx-za-w]";;
        d) [[ -n $2 ]] && echo "Decoded text is:" 
           cipher="tr [X-ZA-Wx-za-w] [A-Za-z]";;
        f) [[ -n f ]] && file=${OPTARG} || Help;;
        t) txt=${OPTARG};;
        v) # print software version
            echo "version 0.1"
            exit;;
        h) # display help
            Help
            exit;;
        \?) # incorrect option
            echo "Invalid option"
            exit;;
    esac
done

[[ -n $file ]] && cat "$file" | ${cipher} || echo "$txt" | ${cipher}

