
# Algea-VE: A Tiny Multimodal Language Model with Only 0.8B Parameters 

[中文](https://github.com/phelixzhen/Algea-VE/blob/main/README_zh.md)

### This repository is a modification of [llava-phi](https://github.com/zhuyiche/llava-phi/tree/main) for inference based on the mipha model 


## Installation 

#### 1. Create an environment and install the required packages 

```sh
conda create -n algea-ve python==3.10 -y
conda activate algea-ve
pip install --upgrade pip  # enable PEP 660 support
pip install -e .
```

#### 2. Download the model weights 

Download the algea-ve weights from [huggingface](https://huggingface.co/PhelixZhen/Algea-VE/tree/main)

#### 3. Use the command line for inference 

```sh
python -m mipha.serve.cli \
--model-path /path/to/your/model \
--image-file "path/to/your/img" \
--conv-mode phi
```

## Training 

Algea-ve is trained on the LAION-CC-SBU dataset using [algea-550M-base](https://huggingface.co/PhelixZhen/Algae-550M-base) as the base model and fine-tuned on llava_v1_5_mix665k. It uses CLIP ViT-L/14-336 as the visual encoder. The model is very small, requiring only 32GB of VRAM for fine-tuning and 3GB for inference.

If you encounter difficulties using mipha to train your own model, this repository retains the code modifications made to the original mipha project during training, which may be helpful.

Due to insufficient training of the base model, the current model has some issues with hallucinations and repetition. To address this, I am training a new model that will maintain the same size but offer better performance. Please star and follow this project for updates.

## Acknowledgements 

[llava-phi](https://github.com/zhuyiche/llava-phi/tree/main)

[llava](https://github.com/haotian-liu/LLaVA)
