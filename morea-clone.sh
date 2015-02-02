#!/bin/bash

if [ $# != 2 ]; then
    echo "morea-clone <github account> <github repo>"
    exit 1
fi

# git clone always pulls the default branch -- the repo name at the end is the folder name
# -b forces a clone of a particular branch
dirs="master gh-pages"
for repo in $dirs; do
	if [ ! -d "./$repo" ]; then
	  echo "Creating $repo/ directory."
	  ( set -x ; git clone -b $repo git@github.com:$1/$2.git $repo)
	else
	  echo "$repo/ exists. Pulling instead."
	  ( set -x ; cd ./$repo ; git pull )
	fi
	echo "Here are the current upstream repos:"
	(set x; cd ./$repo; git remote -v)
	echo ""
done

# if [ -d "./gh-pages" ]; then
#   ( set -x ; cd gh-pages; git checkout --orphan gh-pages; git rm -rf . )
# else
#   echo "gh-pages directory not created. Exiting..."
#   exit 1
# fi

#echo ""
echo "master/ and gh-pages/ directories created."

# echo "Setting the remote to morea-framework/basic-template (this can fail if already set)"
# (set x; cd ./master; git remote add upstream https://github.com/morea-framework/basic-template.git)

# echo "Fetching upstream basic-template"
# ( set -x ; cd ./master ; git fetch upstream)

# echo "Merging upstream into master"
# ( set -x ; cd ./master ; git merge upstream/master ) 

#echo "Add README."
#( set -x ; cd ./master ; git add README.md ; git commit -a -m "Adding README back into tree." ) 
