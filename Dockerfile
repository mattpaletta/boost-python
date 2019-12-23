FROM mattpaletta/cpp-dev:latest
RUN apt-get install -y --no-install-suggests --no-install-recommends python3-pip python3-dev
RUN rm /opt/cmake/share/cmake-3.9/Modules/FindBoost.cmake
RUN git clone --depth 1 --recursive https://github.com/boostorg/boost.git && cd boost && ./bootstrap.sh --with-python=python3 --with-libraries=python && ./b2 install && ldconfig
RUN pip3 install setuptools
RUN pip3 install sklearn
COPY . /src

RUN mkdir -p /src/build && cd /src/build && cmake .. && cmake --build .
WORKDIR /src/build
#ENTRYPOINT ["./hello"]
ENTRYPOINT ["./hello-sklearn"]
