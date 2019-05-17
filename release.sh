#!/bin/sh
REPO_NAME=""
PROJECT_NAME=""

helpFunction()
{
   UNDERLINE='\033[4m' 
   GREEN='\033[0;32m'
   NC='\033[0m'

   echo ""
   echo "${UNDERLINE}Usage:${NC}"
   echo "\t${GREEN}$0 -v version${NC}"
   echo ""
   exit 1 # Exit script after printing help
}


while getopts "v:" opt; do
   case $opt in
      v ) version="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$version" ]
then
   helpFunction
fi

# Begin script in case all parameters are correct
fastlane release_pod repo:$REPO_NAME project:$PROJECT_NAME version:$version