#!/bin/bash
foldername=$(basename "$PWD" | tr ' ' '-')
config_file="config.txt"

# Load username from config file
if [[ -f $config_file ]]; then
    source $config_file
fi

# Prompt the user for username if can't find config file
if [[ -z "$username" ]]; then
    echo -n "Please enter your GitHub username: "
    read username
    echo "username=$username" > $config_file
    echo "Configuration saved!"
fi

# Default-command if no -c
default_command() {
    read -p "Enter commit message (default: Initial Commit): " comment

    if [ -z "$comment" ]; then
        comment="Initial Commit"
    fi

    echo "# $foldername" > README.md
    git init
    git add README.md
    git commit -m "$comment"
    git remote add origin "https://github.com/$username/$foldername.git"
    git branch -M main
    git push -u origin main
}

# Command if -c is specified
git_comment_command() {
    local comment="$1"

    if [ -z "$comment" ]; then
        echo "Error: No commit message provided. Use -c \"Your commit message\""
        exit 1
    fi

    echo "# $foldername" > README.md
    git init
    git add README.md
    git commit -m "$comment"
    git remote add origin "https://github.com/$username/$foldername.git"
    git branch -M main
    git push -u origin main
}

git_init_default() {
    default_command
}

# Affirm the user
git_init_configured() {
    echo "Running command for configured user: $username"
    default_command
}

configuration_mode() {
    echo -n "Please enter your GitHub username: "
    read username
    echo "username=$username" > $config_file
    echo "Configuration saved!"
}

check_username() {
    if [[ -f $config_file ]]; then
        source $config_file
        if [[ -n $username ]]; then
            echo "Username is configured: $username"
            git_init_configured

        else
            echo "Username is not configured."
            configuration_mode
        fi
    else
        echo "Configuration file not found. Running default init commands."
        git_init_default
    fi
}

if [[ -n $1 ]]; then
    case $1 in
    "-c")
        if [[ -n $2 ]]; then
            git_comment_command "$2"
        else
            echo "Error: No commit message provided. Use -c \"Your commit message\""
            exit 1
        fi
    ;;
    "--config")
        echo -e "\033[0;32m ###### Entering configuration mode ##### \033[0m"
        configuration_mode
    ;;
    *)
        echo "Unknown option"
    ;;
    esac
else
    check_username
fi
