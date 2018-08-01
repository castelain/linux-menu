#!/bin/bash

showTime(){
	echo "当前的系统时间为："
	date 
}

changeTime(){
	showTime
	read -p "请输入欲修改为的合法的时间字符串：" timeStr
	echo "修改结果如下："
	sudo date -s $timeStr
}

goBack(){
	echo "返回上级菜单"
	./mainMenu.sh
}

subMenu4(){
	until false
	do
                echo "--------------------------------------------------"
                echo "|                 1.显示系统时间                   |"
                echo "|                 2.修改系统时间                   |"
                echo "|                 0.返回上级菜单                   |"
                echo "--------------------------------------------------"
                read -p "请输入你的选择(1\2\0):" option
                case $option in
                        1)
                        echo "操作：显示系统时间"
                        showTime
                        ;;
                        2)
                        echo "操作：修改系统时间"
                        changeTime
                        ;;
                        0)
                        echo "操作：返回上级菜单"
                        goBack
                        exit 0
                        ;;
                        *)
                        echo "提示：没有这个选项，请重新选择(1\2\0)！"
                        ;;
                esac
        done
}

subMenu4


}
