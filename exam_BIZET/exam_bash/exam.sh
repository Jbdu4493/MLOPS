#!/bin/bash

output_dir=`dirname $0`
output_file=$output_dir/"sales.txt"
echo $output_file 
echo "$(date)" >> $output_file

list_gpu=(rtx3060 rtx3070 rtx3080 rtx3090 rx6700)

function get_nb_vente(){
	nb_vente=`curl "http://0.0.0.0:5000/$1"`
	echo $1:$nb_vente >> $output_file
}
for gpu in ${list_gpu[*]}
do
	get_nb_vente $gpu
done

