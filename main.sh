#!/bin/bash

#User prompt
PS3="Enter A Selection from the Above menu:- "
#engine keep alive
userInput=1
#variables
list_menu="List Current Databases."
create_menu="Create A New Database."
delete_menu="Delete A Database."
open_menu="Open A Database."
exit_menu="Enter 5 to Exit the Engine."
#list_table_menu="List Current Tables."
#create_table_menu="Create A new Table."
#delete_table_menu="Delete A Table."
#open_table_menu="Open A Table."

#function to exit
#function exit_Engine(){
#
#}
#function print header
function print_head(){

	echo " "
	echo "  Welcome to Bash DB Engine. "
	echo " "
	echo " "
	echo "You can use this Engine to..."
	echo ""
}
#function to list menu item after every selection
function list_menu_items(){
	print_head
	i=1
	for h in "$list_menu" "$create_menu" "$delete_menu" "$open_menu" "$exit_menu"
	do
		echo "$i) $h"
		i=$((i+1))
	done
}
#function to output the return of engine output
#function outPut_Engine() {
#	for functionInput in $1
#	do
#		echo $functionInput
#	done
#}

#this Fuction gets the basename of files and then removes all suffixes after '.'
function list_db(){
	echo""
	echo "  Existing DataBases"
	for output_Return in $(find ./ -name '*.db' -exec basename {} \;)
	do
		echo "   ${output_Return%%.*}"
	done
}
#function list_table(){
#	echo""
#	for output_Return in $(find ./ -name '*.tbl' -exec basename {} \;)
#	do
#		echo ${output_Return%%.*}
#	done
#}
#function table_Menu() {
#select input in "$list_table_menu" "$create_table_menu" "$delete_table_menu" "$open_table_menu"
#do
#   case $REPLY in
#        1)echo "$(list_table)";;
#        2)read;
#            $(mkdir $REPLY.tbl);
#            echo "$(list_table)";;
#        3)read;
#            $(rm -rf ./$REPLY.tbl);
#            echo "$(list_table)";;
#        4)read;
#		$(cat $REPLY);;
#        *)break;
#   esac
#done
#}
#function table select
function db_select()
{
	echo "Please Enter Database Name"
	read
	./table.sh $REPLY.db
}
#function select
#this function ask the user for input to contiune the script
function select_menu() {
	
select input in "$list_menu" "$create_menu" "$delete_menu" "$open_menu" "$exit_menu"
do
	clear
   case $REPLY in

	   1)list_db;;
	   2)read;
		   $(mkdir $REPLY.db);
		   echo "$(list_db)";;
	   3)read;
		   $(rm -rf ./$REPLY.db);
		   echo "$(list_db)";;
	   4)db_select;;
           5)break;;
	   *)echo "This Menu only Accepts inputs from 1->5";
		   echo "Please Try Again!!";;
   esac
  
  echo ""
  echo ""
 list_menu_items  
   
done
}



#while [ "$userInput" -ne "2525" ]
#do
	clear
	print_head	
	select_menu  


	echo " "
	echo " "
#	echo "Enter exit to quit"


	#read userInput
#done
clear
        echo "Thank you for using Bash DB Engine"
	
