#!/bin/bash
source ~/.profile

# if [ "$1" == "" ]; then
# 	return
# fi

# P="res_newboard/$1"  # 目标路径
# TEMP_DIC="../WordGameResources/wordgameResNewboard/temp"
# TEMP_DIC_BASE="../WordGameResources/wordgameResNewboard/temp_base"
# RES_DIC="../WordGameResources/wordgameResNewboard/Published-iOS/$1"
# if [ ! -d $RES_DIC ]; then
# 	RES_DIC="../WordGameResources/wordgameResNewboard/unencrypt/$1"
# fi

# if [ ! -d $RES_DIC ]; then
# 	echo "不存在的路劲地址"
# 	return
# fi

# if [ ! -d $P ]; then
# 	mkdir $P
# fi

# if [ ! -d $TEMP_DIC ]; then
# 	echo "不存在临时文件，开始创建"
# 	mkdir $TEMP_DIC
# else
# 	echo "存在临时文件，开始清理"
# 	rm -rf $TEMP_DIC/
# 	mkdir $TEMP_DIC
# fi

# if [ ! -d $TEMP_DIC_BASE ]; then
# 	echo "不存在临时文件，开始创建"
# 	mkdir $TEMP_DIC_BASE
# else
# 	echo "存在临时文件，开始清理"
# 	rm -rf $TEMP_DIC_BASE/
# 	mkdir $TEMP_DIC_BASE
# fi

# Files=$(find $RES_DIC -name "*.png" -o -name "*.jpg")
# for file in $Files; do
# 	leng=${#RES_DIC}+1
# 	FileName=${file:leng}
# 	echo "处理png图片$FileName"
# 	Dir=$(dirname $TEMP_DIC/$FileName)
# 	mkdir -p $Dir
# 	if [[ "$1" == "UI_Resources" 
# 		|| "$1" == "secene_bg"
# 		 ]]; then
# 		echo "使用blurizer压缩图片"
# 		cp $RES_DIC/$FileName $TEMP_DIC/$FileName 
# 		# /Applications/ImageAlpha.app/Contents/Resources/blurizer 8 $RES_DIC/$FileName $TEMP_DIC/$FileName
# 	else
# 		cp $RES_DIC/$FileName $TEMP_DIC/$FileName 
# 		echo "使用pngquant压缩图片"
# 		# /Applications/ImageAlpha.app/Contents/Resources/pngquant -f 256 --ext .png $TEMP_DIC/$FileName 
# 	fi
# done

# Files=$(find $RES_DIC -name \*.xml -o -name \*.fnt -o -name \*.ccbi -o -name \*.plist -o -name \*.csv)
# for file in $Files; do
# 	leng=${#RES_DIC}+1
# 	FileName=${file:leng}
# 	Dir=$(dirname $TEMP_DIC/$FileName)
# 	mkdir -p $Dir
# 	cp $RES_DIC/$FileName $TEMP_DIC/$FileName
# done



######### 复制 小语种资源到指定路径

fileP="../../WordGameClient/res_newboard" # 资源路径
targetP="../../WordGameClient/res_extra_newboard" # 资源路径

# 先csv
echo "开始处理csv"
Files=$(find $fileP -name csv_\*)
echo $Files # "../../WordGameClient/res_newboard/csv_de ../../WordGameClient/res_newboard/csv_fr"
for file in $Files; do
	# echo "某语言csv路径:" $file # "../../WordGameClient/res_newboard/csv_de"
	leng=${#fileP}+1
	FanderName=${file:leng}
	language=${FanderName:${#FanderName}-2}

	# 1.先删除 目标路径 的文件
	tp=$targetP/res_newboard_$language/res/csv/$language
	if [[ -d $tp ]]; then
		echo "目标路径:" $tp
	else
		echo "无目标路径,创建路径:" $tp
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
echo "csv 处理结束"

# 再处理res
echo "开始处理res"
Files=$(find $fileP -name UI_Resources_\*)
for file in $Files; do
	leng=${#fileP}+1
	FanderName=${file:leng}
	language=${FanderName:${#FanderName}-2}
	# echo "语言:" $language
	# echo "文件名夹名:"$FanderName #文件名

	# 1.先删除 目标路径 的文件
	tp=$targetP/res_newboard_$language/res/UI_Resources
	if [[ -d $tp ]]; then
		echo "目标路径:" $tp
	else
		echo "无目标路径,创建路径:" $tp
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
echo "png plist处理结束"

# 最后处理骨骼动画animation
echo "开始处理 animation"
Files=$(find $fileP -name animation_\*)
for file in $Files; do
	echo "--------->>>   $file"
	leng=${#fileP}+1
	FanderName=${file:leng}
	language=${FanderName:${#FanderName}-2}
	# echo "语言:" $language
	# echo "文件名夹名:"$FanderName #文件名

	# 1.先删除 目标路径 的文件
	tp=$targetP/res_newboard_$language/res/animation
	if [[ -d $tp ]]; then
		echo "目标路径:" $tp
	else
		echo "无目标路径,创建路径:" $tp
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
echo "png plist处理结束"




