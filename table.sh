#!/bin/bash
cd ./$1
clear
#User prompt
PS3="Enter A Selection from the Above Menu:- "
#function variables
currentDB=$1
#menu Variables
list_table_menu="List Current Tables."
create_table_menu="Create A new Table."
delete_table_menu="Delete A Table."
open_table_menu="Open A Table."
exit_table_menu="Enter 5 to Return to DB Menu."

#function to escape mistake
function ops(){
read
if [ $REPLY=="^&*"  ]
then
	echo " "
fi
}
#print headline function
function print_head(){
	echo ""
	echo ""
	echo "      Table Control Menu"
	echo "   Current DataBase: ${currentDB%%.*}"
	echo ""
}
#function to list menu items after every selection
function list_menu_items(){
	print_head
	i=1
	for h in "$list_table_menu" "$create_table_menu" "$delete_table_menu" "$open_table_menu" "$exit_table_menu"
	do
		echo "$i) $h"
		i=$((i+1))
	done
}

#function to return the output 
function list_table() {
	echo " "
	echo "   Existing Tables"

	echo " "
	echo " "
   for output_Return in $(find ./ -name '*.tbl' -exec basename {} \;)
   do
          echo "   ${output_Return%%.*}"
  done
  }

#function table select
function table_select()
{	
	
	echo "Please Enter Table Name."
	read
	echo "$(pwd)"
	../row.sh $REPLY.tbl
}
clear
#echo "         Table Control Menu"
#echo "  Current Database: ${currentDB%%.*}"
print_head
select input in "$list_table_menu" "$create_table_menu" "$delete_table_menu" "$open_table_menu" "$exit_table_menu"
 do
	 clear

 case $REPLY in
    1)list_table;;
    2)read;
        $(mkdir $REPLY.tbl);
       echo "$(list_table)";;
    3)read;
      $(rm -rf ./$REPLY.tbl);
      echo "$(list_table)";;
    4)table_select;;
    5)break;;
    *)echo "This Menu only Accepts Inputs from 1->5";
	    echo "Please Try Again!!";;
    esac
    list_menu_items
done
					      
