FROM ubuntu:18.04

RUN apt-get update

# Install GCC & Clang
RUN apt-get install build-essential -y
RUN apt-get install clang -y

# Symlink so the name matches up with the one provided in makefile
RUN ln -s /usr/bin/clang-10 /usr/bin/clang
RUN ln -s /usr/bin/clang++-10 /usr/bin/clang++

# Install needed ARM deps
RUN apt-get install gcc-arm-none-eabi -y
RUN apt-get install binutils-arm-none-eabi -y

# Install 7z & cURL
RUN apt-get install p7zip-full -y
RUN apt-get install curl -y

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]