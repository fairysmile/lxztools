#!/bin/bash
source ~/.profile

######### 复制 小语种资源到指定路径

echo "--------游戏类型资源-------" $1
if [[ "$1" == "newboard" ]]; then
	fileP="../../WordGameClient/res_newboard" # 资源路径
	targetP="../../WordGameClient/res_extra_newboard" # 资源路径
	resP="res_newboard_"
fi
if [[ "$1" == "board" ]]; then
	fileP="../../WordGameClient/res_board" # 资源路径
	targetP="../../WordGameClient/res_extra_board" # 资源路径
	resP="res_board_"
fi
if [[ "$1" == "flat" ]]; then
	fileP="../../WordGameClient/res_flat" # 资源路径
	targetP="../../WordGameClient/res_extra_flat" # 资源路径
	resP="res_flat_"
fi
if [[ "$1" == "classic" ]]; then
	fileP="../../WordGameClient/res" # 资源路径
	targetP="../../WordGameClient/res_extra" # 资源路径
	resP="res_"
fi



# 先csv
echo "(1).开始处理csv"
Files=$(find $fileP -name csv_\*)
# echo $Files # "../../WordGameClient/res_newboard/csv_de ../../WordGameClient/res_newboard/csv_fr"
for file in $Files; do
	# echo "某语言csv路径:" $file # "../../WordGameClient/res_newboard/csv_de"
	leng=${#fileP}+1
	FanderName=${file:leng}
	echo $FanderName   啦啦
	language=${FanderName:${#FanderName}-2}

	# 1.先删除 目标路径 的文件
	tp=$targetP/$resP$language/res/csv/$language
	if [[ -d $tp ]]; then
		echo "目标路径:" $tp
	else
		echo "无目标路径1,创建路径:" $tp
		mkdir $tp
	fi
	# 遍历文件夹下的csv
	csvFander=$file
	if [[ -d $csvFander ]]; then
		# echo "该路径存在:" $csvFander
		files=$(find $csvFander -name \*.csv)
		for csv in $files; do
			FileName=${csv:${#csvFander}+1}
			# echo $FileName #shop.csv #stage.csv
			Dir=$(dirname $tp/$FileName) #目标文件路径
			cp $csv $Dir
			echo "处理: $csv"
		done
	fi
done
echo "    csv 处理结束"



# 再处理res
echo "(2).开始处理 png_plist"
Files=$(find $fileP -name UI_Resources_\*)
for file in $Files; do
	leng=${#fileP}+1
	FanderName=${file:leng}
	language=${FanderName:${#FanderName}-2}
	# echo "语言:" $language
	# echo "文件名夹名:"$FanderName #文件名

	# 1.先删除 目标路径 的文件
	tp=$targetP/$resP$language/res/UI_Resources
	if [[ -d $tp ]]; then
		echo "目标路径:" $tp
	else
		echo "无目标路径2,创建路径:" $tp
		mkdir $tp
	fi
	# 遍历文件夹下的res
	resFander=$file
	if [[ -d $resFander ]]; then
		# echo "该路径存在:" $resFander
		files=$(find $resFander -name \*.png -o -name \*.plist)
		for res in $files; do
			# echo $res
			FileName=${res:${#resFander}+1}
			# echo $FileName #shop.csv #stage.csv
			Dir=$(dirname $tp/$FileName) #目标文件路径
			cp $res $Dir
			echo "处理: $res"
		done
	fi
done
echo "    png_plist 处理结束"



# 最后处理骨骼动画animation
echo "(3).开始处理 animation_"
Files=$(find $fileP -name animation_\*)
for file in $Files; do
	echo "--------->>>   $file"
	leng=${#fileP}+1
	FanderName=${file:leng}
	language=${FanderName:${#FanderName}-2}
	# echo "语言:" $language
	# echo "文件名夹名:"$FanderName #文件名

	# 1.先删除 目标路径 的文件
	tp=$targetP/$resP$language/res/animation
	if [[ -d $tp ]]; then
		echo "目标路径:" $tp
	else
		echo "无目标路径3,创建路径:" $tp
		mkdir $tp
	fi
	# 遍历文件夹下的res
	resFander=$file
	if [[ -d $resFander ]]; then
		# echo "该路径存在:" $resFander
		files=$(find $resFander -name \*.png -o -name \*.plist -o -name \*.xml)
		for res in $files; do
			# echo $res
			FileName=${res:${#resFander}+1}
			# echo $FileName #shop.csv #stage.csv
			Dir=$(dirname $tp/$FileName) #目标文件路径
			cp $res $Dir
			echo "处理: $res"
		done
	fi
done
echo "    animation_ 处理结束"




