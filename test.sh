#!/bin/bash

foldername=$(basename "$PWD" | tr ' ' '-')

configuration_mode () {
    echo -n "Please enter your username: "
    read username  # Prompt for the username on the same line
}

create_config_file () {
    config_file="config.txt"  # Name of the configuration file

    # Check if the file exists, if not, create it
    if [[ ! -f $config_file ]]; then
        echo "Configuration file not found. Creating new one..."
        touch $config_file
    fi

    # Save the username to the configuration file
    echo "Saving username to $config_file..."
    echo "username=$username" > $config_file  # Save username to the config file
    echo "Configuration saved!"
}

check_username () {
    config_file="config.txt"

    # Check if the configuration file exists and contains a username
    if [[ -f $config_file ]]; then
        # Read the username from the config file
        source $config_file
        if [[ -n $username ]]; then
            echo "Username is configured: $username"
            # Run command x if the username is configured
            git_init_configured
        else
            echo "Username is not configured."
            # Run command y if the username is not configured
            git_init_configuregit_init_configure
        fi
    else
        echo "Configuration file not found. Running default command y."
        # Run command y if the config file doesn't exist
        git_init_default
    fi
}

git_init_default () {
    # Replace with the actual command to run when the username is configured
    echo "Running command x with username: $username"/
}

git_init_configured() {
    # Replace with the default command to run when the username is not configured
    echo "Running default command y"
}

if [[ -n $1 ]]; then
    case $1 in
    "-c")
        comment="$2"  # Assigning the comment passed in $2 to the variable
        echo "Comment added: $comment"  # Display the comment
    ;;
    "--config")
        echo -e "\033[0;32m ###### Entering configuration mode ##### \033[0m"
        configuration_mode  # Prompt for the username
        create_config_file  # Save username to the configuration file
    ;;
    *)
        echo "Unknown option"
    ;;
    esac
else
    # Check if the username is configured and run the appropriate command
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