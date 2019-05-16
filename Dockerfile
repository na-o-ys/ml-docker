FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ build-essential ca-certificates software-properties-common \
    bzip2 libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion \
    && rm -rf /var/lib/apt/lists/*

# anaconda
ENV PATH /opt/conda/bin:$PATH
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN conda install -y h5py tensorflow-gpu keras
RUN pip install keras-bert
RUN conda install -c conda-forge pytorch-pretrained-bert
RUN conda install -c fastai fastai
RUN conda install -c pytorch pytorch
WORKDIR /root/user
