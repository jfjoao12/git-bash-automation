#!/bin/bash
foldername=$(basename "$PWD" | tr ' ' '-')

default_command() {
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
    git remote add origin https://github.com/jfjoao12/$foldername.git
    git branch -M main
    git push -u origin main
}

configuration_mode () {
    echo -n "Please enter your username: "
    read username
}

create_config_file () {
    config_file="config.txt"


    if [[ ! -f $config_file ]]; then
        echo "Configuration file not found. Creating new one..."
        touch $config_file
    fi


    echo "Saving username to $config_file..."
    echo "username=$username" > $config_file
    echo "Configuration saved!"
}

check_username () {
    config_file="config.txt"


    if [[ -f $config_file ]]; then

        source $config_file
        if [[ -n $username ]]; then
            echo "Username is configured: $username"
            git_init_configured
        else
            echo "Username is not configured."
            git_init_configuregit_init_configure
        fi
    else
        echo "Configuration file not found. Running default init commands."
        git_init_default
    fi
}

git_init_default () {
    default_command
}

git_init_configured() {
    echo "Running default command y"
}

if [[ -n $1 ]]; then
    case $1 in
    "-c")
        comment="$2"
        echo "Comment added: $comment"
    ;;
    "--config")
        echo -e "\033[0;32m ###### Entering configuration mode ##### \033[0m"
        configuration_mode
        create_config_file
    ;;
    *)
        echo "Unknown option"
    ;;
    esac
else
    check_username
fi



# # Prompt for commit message
# read -p "Enter commit message (default: Initial Commit): " comment

# # Set default commit message if none provided
# if [ -z "$comment" ]; then
#     comment="Initial Commit"
# fi

# # Create README.md and initialize Git repository
# echo "# $foldername" > README.md
# git init
# git add README.md
# git commit -m "$comment"
# git remote add origin git@github.com:jfjoao12/$foldername.git
# git branch -M main
# git push -u origin main