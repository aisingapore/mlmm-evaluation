#!/bin/bash
# refer to run.sh for original usage
# ./scripts/nscc-run.sh zh sealion7b /data/projects/11003281/.cache/models--aisingapore--sealion7b/snapshots/11cc4274ab12322435890b20b8de64511e1885f1/,use_accelerate=True,trust_remote_code=True

lang=$1
model_alias=$2
model_path=$3
tasks=arc_${lang},hellaswag_${lang},mmlu_${lang}
device=cuda

python main.py \
    --task_alias=okapi \
    --model_alias=${model_alias} \
    --tasks=${tasks} \
    --model_args pretrained=${model_path} \
    --device=${device} \
    --no_cache \
    
