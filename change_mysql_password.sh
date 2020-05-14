#! /bin/bash
# So excited! I wrote my first meaningful shell script that helps change mysql password (5.7 verion)
# when it was first installed on CentOS7! 
# Before execute this script, make sure mysqld is initialized and started!

old_password=`cat /var/log/mysqld.log  | grep -o root@localhost.*$  | awk '{print $2}' | tail -n 1`	# define a variable and set value

echo 'Please enter your own STRONG password:'	# show helpful infomation

read -s -p 'Password >' new_password	# use -s to hide password and -p to guide

mysqladmin -u root -p${old_password} password ${new_password} # use mysqladmin's way to reset password and ${} to indicate variable
