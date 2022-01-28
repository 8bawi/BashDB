#!/bin/bash
clear
#echo "$(cat $1)"
#User Prompt
PS3="Enter A Selection from the Above Menu:- "

#menu Variables
insert_menu="Insert New Record."
delete_menu="delete a Record."
show_menu="Query A Record."
exit_menu="Press 4 to Return to Table Menu."
#function variables
currentTable=$1
function current(){
	lastrow="$(tail -n 1 $currentTable|awk -F : '{print $1}')"
}
#number of rows
numbOfRows="$(wc -l $currentTable|awk -F " " '{print $1}')"
#function print header
function print_head(){

echo " "
echo "     Row Control Menu   "
echo " "
echo "    Current Table: ${currentTable%%.*}"
}
#function to list menu items after every selection
function list_menu_items(){
	print_head
	i=1
	echo "  Current Table: ${currentTable%%.*}"
	for h in "$insert_menu" "$delete_menu" "$show_menu" "$exit_menu"
	do
		echo "$i) $h"
		i=$((i+1))
	done
}
#function to insert a new record
function insert_to(){
#	echo "Enter the record data separated by a space"
#	IFS=' ' read -ra line
#       
#	for h in ${line[@]}
#	do
#	echo $h	
#	
#done
echo "enter record"
currentrow=$((numbOfRows+1))
echo $currentrow
read line
echo "$line" >> $currentTable
}
#function query
function query_record(){
	echo "enter line id to query"
	read id
	clear	
	echo " The Requested Row:"
	echo "  $(awk -F : -v idawk="$id" '$1==idawk {print $0}' $currentTable|sed 's/:/ /g')"
}
#function delete
function delete_record(){
	echo "enter Record ID to delete."
	read id
	clear

	awk -F : -v idawk="$id" 'NR==idawk {next} {print}' $currentTable > tmpfile && mv tmpfile $currentTable
	echo "Record Deleted!."
}

#function Print info
function tableInfo(){
	
	echo "Current Table: ${currentTable%%.*}"
	current
	echo "Number of Records: $numbOfRows"
	
}

#function to show output

clear
print_head
select input in "$insert_menu" "$delete_menu" "$show_menu" "$exit_menu"
do
	clear
	if [ $REPLY != 4 ]
	then
	tableInfo
	fi		
	case $REPLY in
		1) insert_to;
			current;;
		2) delete_record;;
		3) query_record;;
		4) break;;
		*)echo "This Menu only Accepts inputs from 1 -> 4";
			echo "please try again!!";;
	esac
	echo ""
	echo ""
	list_menu_items
done
