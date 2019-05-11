FROM continuumio/anaconda3:5.3.0

RUN conda install -y h5py tensorflow keras
WORKDIR /work
