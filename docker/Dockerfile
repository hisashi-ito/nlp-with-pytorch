# PyTorch (CPU)
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y init && apt-get clean all
RUN apt update -y
RUN apt dist-upgrade -y
RUN apt autoremove -y
RUN apt-get -y update
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    patch \
    file \
    git \
    curl \
    swig \
    nkf \
    libmecab-dev \
    locales \
    wget \
    vim \
    emacs \
    unzip \
    mlocate \
    time

RUN apt-get install --reinstall -y libnss3
RUN apt-get install -y language-pack-ja-base language-pack-ja
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
ENV PYTHONIOENCODING utf-8
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc
RUN echo "export LC_ALL=ja_JP.UTF-8" >> ~/.bashrc
RUN echo "export PYTHONIOENCODING=utf-8" >> ~/.bashrc
# python3.6
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# python lib and important OSS
RUN pip3 install \
    PyYAML==3.12 \
    sentencepiece==0.1.83 \
    nltk==3.4.5 \
    fairseq \
    mojimoji \
    mecab-python3==0.996.2 \
    scikit-learn==0.19.2 \
    gensim==3.8.0

# mecab
WORKDIR /opt
RUN git clone https://github.com/taku910/mecab.git
WORKDIR /opt/mecab/mecab
RUN ./configure --enable-utf8-only && make && make check && make install && ldconfig
WORKDIR /opt/mecab/mecab-ipadic
RUN ./configure --with-charset=utf8 && make && make install
WORKDIR /opt
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
WORKDIR /opt/mecab-ipadic-neologd
RUN ./bin/install-mecab-ipadic-neologd -n -y

# 作業領域の作成 (ホストOSの /data をマウントするため)
WORKDIR /work
