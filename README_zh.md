# Algea-VE：仅0.8B的微型多模态语言模型 

### 本仓库是由[llava-phi](https://github.com/zhuyiche/llava-phi/tree/main)修改而来，用于推理基于mipha的模型 


## 安装 
#### 1.创建环境并安装需要的包 
    
    conda create -n algea-ve python==3.10 -y
    conda activate algea-ve
    pip install --upgrade pip  # enable PEP 660 support
    pip install -e .

#### 2.下载模型权重 

下载algea-ve权重在[hugggingface](https://huggingface.co/PhelixZhen/Algea-VE/tree/main)

#### 3.使用命令行方式进行推理 

    python -m mipha.serve.cli \
    --model-path /path/to/your/model \
    --image-file "path/to/your/img" \
    --conv-mode phi


## 训练 
algea-ve以[algea-550M-base](https://huggingface.co/PhelixZhen/Algae-550M-base)为底模在LAION-CC-SBU数据集上进行对齐训练在llava_v1_5_mix665k上进行微调而得。使用CLIP ViT-L/14-336作为视觉编码器。模型非常小，微调仅需要32GB显存，推理只需3GB显存。

如果你想使用mipha训练自己的模型但遇到了一些困难，此仓库保留了训练时期修改过mipha原项目的代码，希望对你有帮助。

由于底模训练不充分，模型存在一定的幻觉与重复问题，为解决此问题我正在训练一个新模型，新模型会维持原有大小不变而性能更强，欢迎打星并跟进此项目。


## 感谢 

[llava-phi](https://github.com/zhuyiche/llava-phi/tree/main)

[llava](https://github.com/haotian-liu/LLaVA)
