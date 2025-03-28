FROM ubuntu 

MAINTAINER calvinhartwell

# copy comfyui 
COPY comfyui /home/ubuntu/comfyui/

# install and configure comfyui
RUN \
  apt-get update && \
  apt-get install -y python3 pip python3-venv nvidia-cuda-toolkit && \
  rm -rf /var/lib/apt/lists/* && \
  python3 -m venv comfyui-env && \
  comfyui-env/bin/pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 && \
  comfyui-env/bin/pip install -r /home/ubuntu/comfyui/requirements.txt

CMD ["comfyui-env/bin/python","/home/ubuntu/comfyui/main.py"]

EXPOSE 8188  
