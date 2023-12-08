#! /bin/bash

# A script to quickly create a branch, add a commit, and push it up. 
# Casper - add to ~/.zshrc - alias gtag="PATH TO THE SCRIPT"

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


#ticket_prefix=$1                                                            # ENG-123
#description=$2                                                              # Fix duplication bug
#kebab_name=$(echo "$description" | tr '[:upper:]' '[:lower:]' | tr ' ' '-') # fix-duplication-bug
#commit_message="${ticket_prefix} ${description}"                            # ENG-123 Fix duplication bug

#git checkout -b "$ticket_prefix"-"$kebab_name"
#git add .
#git commit -m "$commit_message"
#git push -u origin "$ticket_prefix"-"$kebab_name"
