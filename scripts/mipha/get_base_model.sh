#!/bin/bash

## vision_encoder
vision_encoder=/mnt/n/save/openai-clip-vit-large-patch14-336
#vision_encoder=openai/clip-vit-large-patch14-336

## gemma
# base_model_dir=/path/to/google/gemma-2b
# outputdir=./ckpts/checkpoints-siglip/base_checkpoints/mipha_gemma

## phi2
base_model_dir=/mnt/n/save/Algae-550M-base
outputdir=/mnt/n/save/algeave/mix1


python mipha/train/convert_model2base_mipha.py \
    --model_name_or_path $base_model_dir \
    --version plain \
    --data_path /mnt/n/vedata/blip_laion_cc_sbu_558k.json \
    --image_folder /mnt/n/vedata/images \
    --vision_tower $vision_encoder \
    --mm_projector_type mlp2x_gelu \
    --tune_mm_mlp_adapter True \
    --mm_vision_select_layer -2 \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --bf16 True \
    --output_dir $outputdir \
    --num_train_epochs 1 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 2 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 10000 \
    --save_total_limit 3 \
    --learning_rate 1e-3 \
    --weight_decay 0.1 \
    --warmup_ratio 0. \
    --lr_scheduler_type "cosine" \
    --logging_steps 3 \
    --tf32 True \
    --model_max_length 1024 \
    --gradient_checkpointing True \
    --dataloader_num_workers 4 \
    --lazy_preprocess True \
    --report_to wandb

cp $vision_encoder/preprocessor_config.json  $outputdir