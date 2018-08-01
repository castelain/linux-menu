#!/bin/bash

# 1、解压文件
unzipFile(){
        read -p "请输入带解压缩的压缩包名:" gizName
	echo "对指定压缩包解压缩的结果为："
	chmod +xrw $gizName
	tar -xzf $gizName	        
	ls -l 
}

# 2、返回上级菜单
goBack(){
        echo "返回上级菜单"
        ./mainMenu.sh
}


subMenu2(){
        until false
        do
                echo "--------------------------------------------------"
                echo "|                 1.压缩文件                     |"
                echo "|                 2.解压文件                     |"
                echo "|                 0.返回上级菜单                 |"
                echo "--------------------------------------------------"
                read -p "请输入你的选择(1\2\0):" option
                case $option in
                        1)
                        echo "操作：压缩文件"
                        ./subMenu2_1.sh
                        ;;
                        2)
                        echo "操作：解压文件"
                        unzipFile
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

subMenu2

