#! /bin/bash

# A script to quickly create a branch, add a commit, and push it up.

set -eo pipefail

# current_branch=$(git rev-parse --abbrev-ref HEAD)

#if [ -z "$1" ]; then
 # echo ERROR: Must have annotation 
 # exit 1
#fi

#if [ -z "$2" ]; then
#  echo ERROR: Must have description
#  exit 1
# fi

version=$1                                                           
message=$2                                                                               

echo Current branch: "$current_branch".

read -p "Please enter the version number: " annotation
echo "You entered: $version"
read -p "Please enter your message: " message
echo "You entered: $message"

git tag -a "$version" -m "$message"
