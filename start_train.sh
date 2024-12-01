#!/bin/bash

# 使用nohup将 train_stylegan.py.py放到后台运行，并将输出保存
nohup python3 train_stylegan.py.py > log.txt 2>&1 &
echo "训练脚本已在后台启动，输出保存在log.txt"
