#!/bin/sh
# get only the task list and replace '*' by 'active' for easier parsing
exe=`task list|awk '(NR > 3) && (NR < $NF -1)'| dmenu|sed 's/\*/-active-/'`
# get task number
t=`echo $exe|awk '{print $1}'`
if echo $exe|grep -q "\-active\-"
then
    exec task stop $t
else
    exec task start $t
fi
 
