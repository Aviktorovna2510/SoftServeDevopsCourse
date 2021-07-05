#!/bin/bash

function is_user_exists {
user=$1
if id "$user" >/dev/null 2>&1; then
return 0
else
echo "ERROR: User '$user' does not exist in the system. Please, provide correct user name"
return 1
fi
}

function is_directory_exists() {
directory=$1
if [ -d "$directory" ]; then
return 0
else
echo "ERROR: Directory '$directory' not found. Please, provide correct directory path"
return 1
fi
}

function change_owner_and_folders(){
if (is_user_exists $1) && (is_directory_exists $2); then
sudo chown $1 $2
echo "INFO: Directory owner was successfully changed"
fi
}
change_owner_and_folders $1 $2
