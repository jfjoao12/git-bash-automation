#!/bin/bash

# Get current folder name and replace spaces with dashes
foldername=$(basename "$PWD" | tr ' ' '-')

# Prompt for commit message
read -p "Enter commit message (default: Initial Commit): " comment

# Set default commit message if none provided
if [ -z "$comment" ]; then
    comment="Initial Commit"
fi

# Create README.md and initialize Git repository
echo "# $foldername" > README.md
git init
git add README.md
git commit -m "$comment"
git remote add origin git@github.com:jfjoao12/$foldername.git
git branch -M main
git push -u origin main