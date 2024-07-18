File Management Script

This script provides basic functionalities to manage files including creating/editing files, printing file contents, changing file permissions, and modifying Access Control Lists (ACLs).
Features

    Create or Edit a File: Allows you to create a new file or edit an existing one using the nano text editor.
    Print File Contents: Prints the contents of a specified file to the terminal.
    Change File Permissions: Enables changing the permissions of a file by specifying new permissions in octal form (e.g., 755).
    Change ACL (Access Control List): Modifies the ACL of a file using the setfacl command.

Getting Started

To use the script, simply execute it in a Unix/Linux environment. You will be presented with a menu to choose from the available actions.
Prerequisites

    Nano Text Editor: Required for creating/editing files.
    ACL Tools (Optional): Necessary only if you intend to modify ACLs.

Usage

    Clone the repository:

    bash

git clone https://github.com/your-username/your-repository.git

Navigate into the project directory:

bash

cd your-repository

Run the script:

bash

    ./file_management_script.sh

    Follow the on-screen prompts to perform desired actions.

Example Commands

    Create or Edit a File:

    bash

Enter the file name to create or edit: example.txt

Print File Contents:

bash

Enter the file name to print: example.txt

Change File Permissions:

bash

Enter the file name to change permissions: example.txt
Enter the new permissions (in octal form, e.g., 755): 644

Change ACL:

bash

    Enter the file name to change ACL: example.txt
    Enter the ACL command (e.g., setfacl -m u:user:rw): setfacl -m u:john:rw

Logging

All actions performed through this script are logged in the oshistory.log file located in the script's directory. The log includes timestamps and details of each action executed.
Authors

    Hrithik b

License

This project is licensed under the MIT License - see the LICENSE file for details.
