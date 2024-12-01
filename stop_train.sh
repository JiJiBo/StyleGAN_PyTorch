#!/bin/bash

# 获取yolo_v3_train.py的进程ID并终止
PID=$(ps -a | grep 'train_style.py' | grep -v 'grep' | awk '{print $1}')
if [ -z "$PID" ]; then
  echo "没有正在运行的 train_style.py脚本"
else
  sudo kill -9 $PID
  if [ $? -eq 0 ]; then
    echo "train_style.py脚本已停止"
  else
    echo "train_style.py脚本停止失败"
  fi
fi

# 使用 ps -a + awk 获取所有 pt_main_thread 的进程ID并逐一终止
PT_PIDS=$(ps -a | grep 'pt_data_worker' | grep -v 'grep' | awk '{print $1}')
if [ -z "$PT_PIDS" ]; then
  echo "没有正在运行的 pt_data_worker 进程"
else
  echo "正在停止所有 pt_data_worker 进程..."
  for PID in $PT_PIDS; do
    kill -9 $PID
    if [ $? -eq 0 ]; then
      echo "pt_data_worker 进程 $PID 已停止"
    else
      echo "pt_data_worker 进程 $PID 停止失败"
    fi
  done
  echo "所有 pt_data_worker 进程已停止"
fi
