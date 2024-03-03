#export CUDA_VISIBLE_DEVICES=0

python src/train_bash.py \
    --stage sft \
    --do_train \
    --model_name_or_path input/my_pretrain_model/Qwen-0.5B \
    --dataset summary_train \
    --template default \
    --finetuning_type lora \
    --lora_target q_proj,v_proj \
    --output_dir output \
    --overwrite_cache \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 500 \
    --learning_rate 5e-5 \
    --num_train_epochs 5.0 \
    --plot_loss \
    --fp16