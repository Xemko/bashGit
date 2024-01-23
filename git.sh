#! /bin/bash

# A script to create TAG.
# a branch, add a commit, push it. 
# Casper - add to ~/.zshrc - alias gtag="PATH TO THE SCRIPT"

set -eo pipefail



#if [ -z "$1" ]; then
 # echo ERROR: Must have annotation 
 # exit 1
#fi

#if [ -z "$2" ]; then
#  echo ERROR: Must have description
#  exit 1
# fi

#version=$1
#message=$2

tag="" # The tag name to create

version="1"
suffix="-qa-"
last_version="1"

current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch is: $current_branch"

last_tag=$(git describe --tags --abbrev=0 $current_branch)

# Check if last tag exist and the tag ends with a digit
if [[ $last_tag =~ [0-9]+$ ]]; then
  last_version=${BASH_REMATCH[0]}
  version=$((last_version + 1))
fi

if [ -n "$last_tag" ]; then
  echo -e "\nLatest tag is: $last_tag"
fi

# Example: branch\name-qa-1 -> branch_name-qa-1
suggested_tag=$(echo $current_branch | sed -r 's/\//_/g')
suggested_tag=$suggested_tag$suffix$version

echo -e "ֿֿֿֿֿ\nThe next tag suggestion is [$suggested_tag]."
read -e -p "Press Enter or type the tag name: " input
# If the user just presses Enter, use the default value
tag="${input:-$suggested_tag}"

suggested_msg="Tag for QA"

echo -e "ֿֿֿֿֿ\nThe message suggestion is [$suggested_msg]."
read -e -p "Press Enter or type the message: " input
# If the user just presses Enter, use the default value
message="${input:-$suggested_msg}"

echo -e "\nCreating the tag:"
echo -e "git tag -a \"$tag\" -m \"$message\""

# Execute the git command
git tag -a "$tag" -m "$message"
git push origin "$tag"




#ticket_prefix=$1                                                            # ENG-123
#description=$2                                                              # Fix duplication bug
#kebab_name=$(echo "$description" | tr '[:upper:]' '[:lower:]' | tr ' ' '-') # fix-duplication-bug
#commit_message="${ticket_prefix} ${description}"                            # ENG-123 Fix duplication bug

#git checkout -b "$ticket_prefix"-"$kebab_name"
#git add .
#git commit -m "$commit_message"
#git push -u origin "$ticket_prefix"-"$kebab_name"

