#!/bin/sh
REPO_NAME="yuge-specs"
PROJECT_NAME="YugeCAM"

helpFunction()
{
   echo ""
   echo "Usage: $0 -v version"
   echo "\t-v Value for new release, i.e 1.0"
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
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
fastlane release_pod repo:$REPO_NAME project:$PROJECT_NAME version:$version