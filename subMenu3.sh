#!/bin/bash

# 1、显示文件属性
lsFileAttr(){
	read -p "请输入你想查看属性的文件的合法路径以及文件名:" filePath
	ls -l $filePath
}

# 2、编辑文件属性
chmodFile(){
	read -p "请输入你想要编辑属性的文件的合法路径以及文件名：" filePath
	read -p "请输入合法的属性编辑参数(如：+x/u-r):" signal
	chmod $signal $filePath
	echo "编辑文件属性的操作成功，修改后的文件属性为："
	ls -l $filePath
}

# 3、返回上级菜单
goBack(){
	echo "返回上级菜单"
	./mainMenu.sh	
}


subMenu3(){
	until false
	do
		echo "--------------------------------------------------"
		echo "|         	1.显示文件属性                   |"
        	echo "|         	2.编辑文件属性                   |"
        	echo "|         	0.返回上级菜单                	 |"
        	echo "--------------------------------------------------"
        	read -p "请输入你的选择(1\2\0):" option
        	case $option in
                	1)
                  	echo "操作：显示文件属性"
		  	lsFileAttr
                	;;
                	2)
                  	echo "操作：编辑文件属性"
		  	chmodFile
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

subMenu3
