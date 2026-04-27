#!/bin/bash
# In the Username & Password fields, put your tacacs credentials
# The script will log in with your username and password to make
# the changes described in the script.
# You must specify the file where the hosts are listed and another file with the commands, in front of the script.
# Example: script.sh hosts.txt commands.txt
# You must have the expect packet installed your machine

# START

# Declaring variables
USERNAME=user
PASSWORD=!@#@!#
HOST="$1"
CMD="$(cat $2)"

for var in $(cat $1); do

# Using the declared variables above to authenticate on the hosts

expect -c "
spawn telnet $var
expect \"*Username:*\"
send \"$USERNAME\r\"
expect \"*Password:*\"
send \"$PASSWORD\r\"
expect \"*#*\"
sleep 5
send \"$CMD\r\"
expect \"*#*\"
send \"end\r\"
expect \"*#*\"
send \"exit\r\"
interact
"
done

# END

#Save and exit the file.

#Apply execution permission:

#chmod 755 file.sh
#To execute:

bash
./expect.sh hosts-file.txt commands-file.txt
