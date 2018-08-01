#!/bin/bash
# 精确搜索文件
exactFileSearch(){
        read -p "请输入你想要在哪个路径下搜索:" path
	read -p "请输入你想要搜索的文件的完整文件名：" fileName
	echo "在指定路径下，精确搜索该文件的结果为："
        sudo find $path -name $fileName
}

# 2、模糊搜索
fuzzyFileSearch(){
        read -p "请输入你想要在哪个路径下搜索：" path
	read -p "请输入用于搜索的属性（如：-name/-user）：" key
	read -p "请输入属性值:" value
	echo "在指定路径下，模糊搜索的结果为：" 
	sudo find $path $key $value 
}

# 3、返回上级菜单
goBack(){
        echo "返回上级菜单"
        ./mainMenu.sh
}


subMenu5(){
        until false
        do
                echo "--------------------------------------------------"
                echo "|                 1.精确搜索文件                   |"
                echo "|                 2.模糊搜索文件                   |"
                echo "|                 0.返回上级菜单                   |"
                echo "--------------------------------------------------"
                read -p "请输入你的选择(1\2\0):" option
                case $option in
                        1)
                        echo "操作：精确搜索文件"
                        exactFileSearch
                        ;;
                        2)
                        echo "操作：模糊搜索文件"
                        fuzzyFileSearch

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

subMenu5

