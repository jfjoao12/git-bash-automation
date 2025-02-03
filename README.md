# Git Bash Automation

A script that automates the initial setup for GitHub repositories.
If you create a lot of projects and are tired of typing the same commands to push to your repository, this script makes the process effortless.

## Repository
[Git Bash Automation](https://github.com/jfjoao12/git-bash-automation)

## Features
- Initializes a Git repository.
- Creates and commits a README.md file.
- Adds a remote origin and pushes the initial commit.
- Supports configuration mode to store a GitHub username.
- Can be used as a native command in your terminal.

## Installation
To use this script as a native command in your terminal:

1. **Download the script**
   ```bash
   curl -o git-init-automation.sh https://raw.githubusercontent.com/jfjoao12/git-bash-automation/main/git-init-automation.sh
   ```
2. **Make it executable**
   ```bash
   chmod +x git-init-automation.sh
   ```
3. **Move it to a directory in your `PATH`**
   ```bash
   mv git-init-automation.sh /usr/local/bin/git-init
   ```
4. **Now, you can run it from any project folder!**
   ```bash
   git-init
   ```

## TO-DO:
- [ ] Add functionality to allow the user to choose between HTTPS and SSH
- [ ] Improve error handling
- [ ] Improve code and implement undone features

