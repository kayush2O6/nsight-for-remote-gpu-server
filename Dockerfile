FROM nvidia/cuda:9.0-devel-ubuntu16.04

RUN apt update -y && apt install -y  openssh-server vim
RUN mkdir /var/run/sshd

RUN useradd -ms /bin/bash usergpu
RUN echo 'usergpu:gpupassword' | chpasswd
USER usergpu
WORKDIR /home/usergpu
RUN echo "PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:$PATH" >> ~/.bashrc
RUN echo "LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"] 

