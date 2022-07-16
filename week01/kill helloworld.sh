# !/bin/bash
#杀死helloworld进程sh
top -n 1 -b > result.txt
ps aux | grep HelloWorld | grep home | awk '{print $2}' | xargs kill -9

