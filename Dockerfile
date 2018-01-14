FROM nvidia/cuda:8.0-cudnn5-devel
MAINTAINER Yasuyuki YAMADA <yasuyuki.ymd@gmail.com>

RUN apt-get update
RUN apt-get install -y curl=7.* bzip2=1.* git=* python3=* gcc python3-dev
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python3 get-pip.py
ENV CUDA_PATH=/usr/local/cuda
ENV PATH=${CUDA_PATH}/bin:$PATH
ENV DYLD_LIBRARY_PATH=${CUDA_PATH}/lib64:${CUDA_PATH}/lib64/stubs:$DYLD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${CUDA_PATH}/lib64/stubs:$LD_LIBRARY_PATH
ENV CPATH ${CUDA_PATH}/include:$CPATH
ENV CHAINER_VER 3.2.0
RUN pip install cupy chainer==${CHAINER_VER} matplotlib Pillow requests
RUN pip install git+https://github.com/yasuyuky/chainer-ya-utils
RUN mkdir /work
WORKDIR /work
ENV HOME /work
