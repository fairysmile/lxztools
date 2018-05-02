#!/bin/bash
source ~/.profile
if [ "$1" == "board" -o "$1" == "newboard" -o "$1" == "flat"  -o "$1" == "classic" ]; then
	echo "正确的游戏类型"
	file_="gameLanguageResCopy.sh"
	if [[ -x $file_ ]]; then
		./$file_ $1
	fi
else
	echo "请输入参数 -- 参数1:游戏类型( board / newboard / flat / classic )"
fi