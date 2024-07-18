#!/bin/bash

# Function to create or edit a file using nano
create_or_edit_file() {
    read -p "Enter the file name to create or edit: " filename
    nano "$filename"  # Use nano to create/edit the file

    # Log file creation/editing
    timestamp=$(date +"%Y-%m-%d %T")
    echo "$timestamp - $USER created or edited file: $filename" >> oshistory.log
}

# Function to print the contents of a file
print_file() {
    read -p "Enter the file name to print: " filename
    if [ ! -e "$filename" ]; then
        echo "File does not exist."
        return 1
    fi

    echo "Contents of $filename:"
    cat "$filename"

    # Log file printing
    timestamp=$(date +"%Y-%m-%d %T")
    echo "$timestamp - $USER printed contents of file: $filename" >> oshistory.log
}

# Function to change file permissions
change_permissions() {
    read -p "Enter the file name to change permissions: " filename
    if [ ! -e "$filename" ]; then
        echo "File does not exist."
        return 1
    fi

    # Display current permissions
    echo "Current permissions of $filename:"
    ls -l "$filename"

    # Ask for new permissions
    read -p "Enter the new permissions (in octal form, e.g., 755): " new_permissions
    chmod $new_permissions "$filename"
    echo "Permissions changed successfully."

    # Log permission change
    timestamp=$(date +"%Y-%m-%d %T")
    echo "$timestamp - $USER changed permissions of $filename to $new_permissions" >> oshistory.log
}

# Function to change ACL of a file
change_acl() {
    read -p "Enter the file name to change ACL: " filename
    if [ ! -e "$filename" ]; then
        echo "File does not exist."
        return 1
    fi

    # Display current ACL
    echo "Current ACL of $filename:"
    getfacl "$filename"

    # Ask for ACL command
    read -p "Enter the ACL command (e.g., setfacl -m u:user:rw): " acl_command
    setfacl -m "$acl_command" "$filename"
    echo "ACL changed successfully."

    # Log ACL change
    timestamp=$(date +"%Y-%m-%d %T")
    echo "$timestamp - $USER changed ACL of $filename with command: $acl_command" >> oshistory.log
}

# Main script
echo "Welcome to the File Management Script"

# Ask for action choice
while true; do
    echo
    echo "Choose an action:"
    echo "1. Create or edit a file"
    echo "2. Print the contents of a file"
    echo "3. Change permissions of a file"
    echo "4. Change ACL of a file"
    echo "5. Exit"

    read -p "Enter your choice (1/2/3/4/5): " action_choice
    echo

    case $action_choice in
        1)
            create_or_edit_file
            ;;
        2)
            print_file
            ;;
        3)
            change_permissions
            ;;
        4)
            change_acl
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, 3, 4, or 5."
            ;;
    esac
done
