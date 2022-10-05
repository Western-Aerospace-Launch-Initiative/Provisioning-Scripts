# USER PROVISINING SCRIPT
# Written for WMU's WALI CDH Team
# Script written by Adam Pohl

# This script creates standard AND sudo users based on the parameters passed in the following arrays.

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
    echo "DOING IT"
else
    echo "Cancelling operation"
    exit 1
fi