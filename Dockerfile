# FROM ubuntu:18.04

# RUN dpkg --add-architecture i386
# RUN apt update
# RUN apt install wine32 -y

# COPY SAPI4 /SAPI4

# WORKDIR /SAPI4

# # RUN wine spchapi.exe
# # RUN wine tv_enua.exe

# RUN apt install wget -y
# RUN wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
# RUN apt update --allow-insecure-repositories && apt -y --allow-unauthenticated install --reinstall d-apt-keyring && apt update
# RUN apt install dub -y
# RUN apt install dmd-compiler -y

# # RUN cd SAPI4_web && dub build --build=release

# CMD ["/bin/sh"]

FROM ubuntu:18.04

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install wine32 -y
RUN apt install xvfb -y

RUN export DISPLAY=:0

COPY wine.tar /root
RUN cd /root && tar -xf /root/wine.tar 

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]