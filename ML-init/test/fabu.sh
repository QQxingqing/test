#!/bin/bash
select chose in "更新安卓大登录" "更新IOS大登录" "退出"
do
case $chose in
"更新安卓大登录")
>log/run.log
for i in `cat config/adoserver.txt`
	do
		export server=`echo $i`
		export cmdfile="config/center.txt"
		./fabu.exp $server $cmdfile
		echo  "$i 更新完毕,需重启tomcat生效"
	done
	break;
	;;

"更新IOS大登录")
>log/run.log
for i in `cat config/iosserver.txt`
	do
		export server=`echo $i`
		export cmdfile="config/center.txt"
		./fabu.exp $server $cmdfile
	done
	break;
	;;

"退出")
	echo "exit"
	break;
	;;

*)
	echo "兄台您选错了!!"
	;;
esac 
done
