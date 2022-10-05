# USER PROVISINING SCRIPT
# Written for WMU's WALI CDH Team
# Script written by Adam Pohl

# This script creates standard AND sudo users based on the parameters passed in the following arrays.
# WARNING: This script gives each user a random password and prints it to the terminal.
# ENSURE THAT THE USER RECEIVES THIS PASSWORD AND THEN PROMPTLY CHANGES IT AFTER GAINING ACCESS TO THE SYSTEM
# THESE TEMPORARY PASSWORDS WILL NOT BE PRINTED A SECOND TIME, YOU MUST SAVE THEM BEFORE CLOSING YOUR TERMINAL.

# Add your intended standard users in the below "users" array
# Add the intended sudo users in the "sudo_users" array.
# Do NOT add a user to both the "users" and "sudo_users" array. A sudo user ONLY needs to be added to the "sudo_users" array

# Use the following format to add the users to the array:
# array=("user1" "user2" "user3")
# Notice: The users are NOT seperated by commas, only spaces. These array items CANNOT contain spaces
# The proper format for these users is firstinitial lastname
# For example, the username for the user "Adam Pohl" would be "apohl"

users=()
sudo_users=()

# Create a user and ensure .ssh/authorized_keys exists
create_user () {
    local user=$1
    sudo useradd -m $user
    sudo mkdir -p /home/$user/.ssh
    sudo touch /home/$user/.ssh/authorized_keys
    pw=$(randpw)
    echo $str:$pw | sudo chpasswd
    echo "User: $str | Pass: $pw"
}

randpw () {
    local pass=$(</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo "")
    echo $pass
}

if [ "$EUID" -ne 0 ]
    then echo "Permission Denied: Must be run as root"
    exit 1
fi


echo "The following users will be created."
for str in ${users[@]}; do
  echo $str
done

echo "WARNING: The following users will be given sudo priviliges."

for str in ${sudo_users[@]}; do
  echo $str
done

echo -n "Are you sure you want to do this? y/n:"

read answer

if [ $answer == "y" ];
then
    # Create standard users
    echo "USER PASSWORDS PRINTED BELOW: SAVE THESE, THEY WILL NOT BE SHOWN AGAIN"
    for str in ${users[@]}; do
        create_user "$str"
    done
    # Create sudo users
    for str in ${sudo_users[@]}; do
        create_user "$str"
        sudo usermod -aG sudo $str
    done

    echo "ENSURE USER CHANGES THESE PASSWORDS"

else
    echo "Cancelling operation"
    exit 1
fi

exit 0