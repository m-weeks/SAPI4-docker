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
CMD ["/bin/bash"]