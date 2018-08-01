#!/bin/bash

# 1、压缩并替代原文件
zip1(){
	read -p "请输入待压缩的一个合法的文件名：" fileName
	echo "对指定文件进行压缩并替换原文件的结果为："
	suffix=".tar.gz"
	tar -czf "${fileName}${suffix}" $fileName --remove-files
	ls -l $fileName.* 
}

# 2、打包压缩文件夹
zip2(){
        read -p "请输入待压缩的一个合法的文件夹名：" direc
	echo "对指定文件夹进行压缩后的结果为："
	suffix=".tar.gz"
	tar -czf "${direc}${suffix}" $direc
	ls -l $direc.*
}

# 3、返回上级菜单
goBack(){
        echo "返回上级菜单"
        ./subMenu2.sh
}


subMenu2_1(){
        until false
        do
                echo "--------------------------------------------------"
                echo "|                 1.压缩并替代原文件             |"
                echo "|                 2.打包压缩文件夹               |"
                echo "|                 0.返回上级菜单                 |"
                echo "--------------------------------------------------"
                read -p "请输入你的选择(1\2\0):" option
                case $option in
                        1)
                        echo "操作：压缩并替代原文件"
                        zip1
                        ;;
                        2)
                        echo "操作：打包压缩文件夹"
                        zip2
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

subMenu2_1

