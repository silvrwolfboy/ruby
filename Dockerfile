FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  build-essential autoconf libtool \
  git \
  ruby \
  pkg-config \
  libffi-dev \
  libffi6 \
  && apt-get clean

RUN apt-get install -y \
  cmake \
  gdb \
  valgrind

RUN apt-get install -y libssl-dev \
  libgdbm5 \
  libgdbm-dev \
  libedit-dev \
  libedit2 \
  bison \
  hugepages \
  leaktracer \
  libgdbm-dev

RUN apt-get install -y libjemalloc-dev

ADD . .
RUN autoconf
RUN ./configure --disable-install-rdoc --with-jemalloc
RUN make -s -j$(nproc)
RUN make test
