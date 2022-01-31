FROM nvidia/cuda:10.1-cudnn7-runtime-centos7
FROM centos:7

SHELL ["/bin/bash", "-c"]

RUN yum -y upgrade && yum install -y \
        gcc \
        g++ \
        gcc-c++ \
        make \
        linux-headers-generic \
        libsm6 \
        libxrender1 \
        libxext6 \
        emacs \
        vim \
        nano \
        ncurses-devel \
        bc \
        libzstd-dev \
        bzip2 \
        screen \
        wget \
        tmux && yum clean all


WORKDIR /tmp

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p /tmp/miniconda3 && \
    source /tmp/miniconda3/bin/activate  && \
    conda init

ENV PATH=/tmp/miniconda3/bin:${PATH}
COPY bashrc /tmp 

RUN conda create --name model-env -y && \
    echo 'conda activate model-env' >> /tmp/bashrc && \
    source /tmp/bashrc

ARG myuser

RUN useradd -ms /bin/bash $myuser

RUN activate && \
    conda init && \ 
    conda update -y conda && \
    conda install -y numpy matplotlib pandas ipython && \


USER $myuser

WORKDIR /home/${myuser}


