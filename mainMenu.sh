#!/bin/bash

mainMenu(){
		echo "-------------------------------------------------"
		echo "|		1.选择usb功能		        |"
		echo "|		2.压缩功能                      |"
		echo "|		3.编辑文件属性                  |"
		echo "|		4.系统时间功能                  |"
		echo "|		5.搜索功能		        |"
		echo "|	         0.退出程序			|"
		echo "-------------------------------------------------"
		read -p "请输入你的选择(1\2\3\4\5\0):" option
		if [ $option -eq 0 ]
		then
			echo "退出程序"
			return -1
			exit 0
		fi
		case $option in
			1)
		  	echo "usb功能"
			./subMenu1.sh
			;;
			2)
		  	echo "压缩功能"
			./subMenu2.sh
			;;
			3)
		  	echo "选择功能：编辑文件属性"
			./subMenu3.sh	
			;;
			4)
		  	echo "系统时间"
			./subMenu4.sh
			;;
			5)
		  	echo "搜索功能"
			./subMenu5.sh
			;;
			*)
		  	echo "没有这个选项，请重新选择(1\2\3\4\5\0)！"
			;;
		esac
}

mainMenu

