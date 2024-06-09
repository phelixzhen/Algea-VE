#!/bin/bash

## vision_encoder
#vision_encoder=openai/clip-vit-large-patch14-336
vision_encoder=/mnt/n/save/openai-clip-vit-large-patch14-336

## gemma
# model_dir=./ckpts/checkpoints-siglip/base_checkpoints/mipha_gemma
# outputdir=./ckpts/checkpoints-siglip/gemma_2b/MiphaGemma-v0-2b-pretrain

## phi2
model_dir=/mnt/n/save/algeave/mix1
outputdir=/mnt/n/save/algeave/pt1

deepspeed --master_port 29600 mipha/train/train.py \
    --deepspeed ./scripts/zero2.json \
    --model_name_or_path $model_dir \
    --version plain \
    --data_path /mnt/n/vedata/blip_laion_cc_sbu_558k.json \
    --image_folder /mnt/n/vedata/images \
    --tune_mm_mlp_adapter True \
    --freeze_vision_tower True \
    --freeze_backbone True \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --bf16 True \
    --output_dir $outputdir \
    --num_train_epochs 1 \
    --per_device_train_batch_size 10 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 10000 \
    --save_total_limit 3 \
    --learning_rate 1e-3 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 3 \
    --tf32 True \
    --model_max_length 1024 \
    --gradient_checkpointing True \
    --dataloader_num_workers 5 \
    --lazy_preprocess True \
    --report_to wandb

cp $vision_encoder/preprocessor_config.json  $outputdir
