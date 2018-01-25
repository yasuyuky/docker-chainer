FROM chainer/chainer:v4.0.0b3-python3
MAINTAINER Yasuyuki YAMADA <yasuyuki.ymd@gmail.com>

RUN apt-get update -y && apt-get install -y curl=* git=*
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python3 get-pip.py && rm get-pip.py
RUN pip install matplotlib Pillow git+https://github.com/yasuyuky/chainer-ya-utils
RUN mkdir /work
WORKDIR /work
ENV HOME /work
