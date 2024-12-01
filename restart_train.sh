#!/bin/bash

# 停止训练
./stop_train.sh

# 更新代码库
git pull

# 启动训练
./start_train.sh