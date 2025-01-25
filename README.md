# Git Bash Automation
A script that automatically runs the initial setup for GitHub.
If you create a lot of projects and are tired of typing the same code all the time to push to your repo, you can easily run this script.
It's currently set up to use SSH for it.

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
- [ ] Change the command and file name to git-init
- [ ] Add functionality to allow the user to choose between HTTPS and SSH
- [ ] Improve error handling

