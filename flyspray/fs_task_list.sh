#! /bin/bash

TASK_HTML=$(http --follow GET http://flyspray.excelsystems.com/flyspray/ \
	do==index \
	project==2 \
	type[0]==2 \
	type[1]==1 \
	type[2]==21 \
	type[3]==20 \
	sev[0]== \
	pri[0]== \
	due[0]== \
	dev==jhughes \
	cat[0]== \
	status[0]==2 \
	status[1]==3 \
	status[2]==7 \
	status[3]==4 \
	status[4]==5 \
	status[5]==6 \
	status[6]==12 \
	status[7]==13 \
	status[8]==14 \
	status[9]==15 \
	status[10]==16 \
	status[11]==9 \
	percent[0]== \
	search_in_details==1 \
	reported[0]==
)

TASK_LIST=$( echo "$TASK_HTML" \
	| grep -Po "task_summary.*?/td>" \
	| grep -o "title.*\/a>" \
	| grep -Po ">.*<" \
	| sed -e 's/[<>]//g'
)

TASK_IDS=$( echo "$TASK_HTML" \
	| grep -Po "task_summary.*?/td>" \
	| grep -Po "(?<=task_id=)\d+"
)

TASK_IDS=$( echo "$TASK_IDS" \
	| sed 's/.*/ '$(echo -e "\033[32m")'\0'$(echo -e "\033[37m")'/g'
)

echo -e "$TASK_LIST" > ./tasklist
echo -e "$TASK_IDS" > ./taskids

paste ./taskids ./tasklist

rm ./taskids ./tasklist
