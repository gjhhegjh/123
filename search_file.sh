#!/bin/bash

while true; do
    read -p "Please input file extension (q to quit): " extension
    if [[ "$extension" == "q" ]]; then
        echo "Exiting program."
        break
    fi

    read -p "Please input directory to search (q to quit): " directory
    if [[ "$directory" == "q" ]]; then
        echo "Exiting program."
        break
    fi

    if [ -d "$directory" ]; then
        # 搜索文件并处理路径
        files=$(find "$directory" -type f -name "*$extension")
        
        # 处理输出路径
        count=0
        while IFS= read -r file; do
            if [[ "$file" == $HOME* ]]; then
                # 替换家目录为~
                file="${file/$HOME/~}"
            fi
            echo "$file"
            ((count++))
        done <<< "$files"
        
        echo "总共找到 $count 个文件。"
    else
        echo "目录 $directory 不存在，请重新输入。"
    fi
done
