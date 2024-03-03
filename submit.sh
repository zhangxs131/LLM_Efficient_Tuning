#!/bin/bash

cur_time=`date  +"%Y%m%d-%H%M"`
job_name=qwen_summary_${cur_time}


# 作业参数


group_name="sasd-aladdin-40g-1-yq01-k8s-gpu-a100-8-0"                   # 将作业提交到group_name指定的组，必填
#group_name="sasd-16g-0-yq01-k8s-gpu-v100-8"
#group_name="sasd-aladdin-80g-eb-yq01-k8s-gpu-a100-8"


start_cmd="sh run.sh"
file_dir="."
#job_version='pytorch-1.7.1'

job_version="custom-framework"
# 自定义镜像的地址
#image_addr="iregistry.baidu-int.com/paddlecloud/pytorch1.7.1:ubuntu18.04-cuda11.0_cudnn8"

image_addr="iregistry.baidu-int.com/zxs_image/torch1.13.1:ubuntu16.04-cuda11.7_cudnn8"

k8s_trainers=1
k8s_gpu_cards=1

paddlecloud job \
        --ak 2c3e200411dd56d08ee2ae35cf2e95eb \
        --sk 1e8bf1d5195a5016bd8fdc039bccc9b9 \
        train --job-name ${job_name} \
        --group-name ${group_name} \
        --job-conf config.ini \
         --start-cmd "${start_cmd}" \
        --file-dir . \
        --job-version ${job_version}  \
        --image-addr ${image_addr} \
        --k8s-trainers ${k8s_trainers} \
        --k8s-gpu-cards ${k8s_gpu_cards} \
        --is-standalone 1 \
        --non-paddle-finish-date 2025-03-01 \
        --non-paddle-remark paper_reproduction \
        --non-paddle-reason test_in_pytorch \
        --algo-id algo-6669da044c5e41bf