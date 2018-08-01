#!/bin/bash

# 1、挂载u盘
loadUsb(){
	sudo mkdir /mnt/usb
	sudo mount -t vfat /dev/sdb4 /mnt/usb
	echo "已完成将u盘挂载到/mnt/usb下的操作"        
}

# 2、卸载u盘
unloadUsb(){
	sudo umount /dev/sdb4
	sudo rmdir /mnt/usb
	echo "已完成卸载u盘的操作"
}


# 3、显示u盘文件信息
showUsbFileInf(){
	echo "下面的操作需要输入用户的密码："
	sudo su - root <<EOF
	cd
	cd /mnt
	cd usb
	echo "u盘下的文件信息为："
	ls -l
EOF
}

# 4、拷贝u盘文件到当前文件夹
copyFiles(){
	read -p "请输入要拷贝到当前文件夹下的文件或文件夹：" name
	path="/mnt/usb/"
	cp -r "$path$name" .
	echo "拷贝操作已完成"
	echo "当前文件夹的文件信息为："
	ls -l .
}

# 5、删除u盘文件
deleteUsbFile(){
	read -p "请输入待删除的文件名或文件夹名：" name
	read -p "确定要删除u盘的文件吗(y/n)？" isDelete
	path="/mnt/usb/"
	if [ $isDelete == "y" ]
	then
		if [ -f $name ]
		then
			rm -i "$path$name"
			echo "删除该u盘文件的操作已完成"
		else
			rm -irv "$path$name"
			echo "删除该u盘文件的操作已完成"		
		fi
	 else
		echo "中止了删除文件的操作"
 	 fi
}

#6、返回上级菜单
goBack(){
	echo "返回上级菜单"
        ./mainMenu.sh
	
}

# 7、拷贝当前文件夹下的文件到u盘
copyFilesToUsb(){
	echo "当前文件夹下的内容有："
	ls -l .
	read -p "请输入当前文件夹下待拷贝到u盘的一个文件名或文件夹名：" name
	echo "拷贝当前文件夹下的文件到u盘的操作已完成"
	cp -r $name /mnt/usb
	echo "u盘现在的文件信息如下："
	showUsbFileInf
}


subMenu1(){
        until false
        do
                echo "---------------------------------------------------"
                echo "|           1.挂载u盘                             |"
                echo "|           2.卸载u盘                             |"
	        echo "|           3.显示u盘文件信息                     |"
                echo "|           4.拷贝当前文件夹下的文件到u盘         |"
                echo "|           5.拷贝u盘文件到当前文件夹             |"
	        echo "|           6.删除u盘文件                         |"
                echo "|           0.返回上级菜单                        |"
                echo "---------------------------------------------------"
                read -p "请输入你的选择(1\2\3\4\5\6\0):" option
                case $option in
                        1)
                        echo "操作：挂载u盘"
                        loadUsb
                        ;;
                        2)
                        echo "操作：卸载u盘"
                        unloadUsb
			;;
			3)
			echo "操作：显示u盘文件信息"
			showUsbFileInf
			;;
			4)
			echo "操作：拷贝当前文件夹下的文件到u盘"
			copyFilesToUsb
			;;
			5)
			echo "操作：拷贝当前文件到当前文件夹"
			copyFiles
			;;
			6)
			echo "操作：删除u盘文件"
			deleteUsbFile
			;;		
                        0)
                        echo "操作：返回上级菜单"
                        goBack
                        exit 0
                        ;;
                        *)
                        echo "提示：没有这个选项，请重新选择(1\2\3\4\5\6\0)！"
                        ;;
                esac
        done
}

subMenu1

