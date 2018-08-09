FROM nvidia/cuda:8.0-devel-ubuntu16.04

RUN apt update -y && apt install -y  openssh-server vim sudo git
RUN mkdir /var/run/sshd

RUN echo 'root:gpupassword' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN echo "PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:$PATH" >> /root/.bashrc
RUN echo "LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:$LD_LIBRARY_PATH" >> /root/.bashrc

RUN echo "export PATH=$PATH" >> /etc/profile && \
    echo "ldconfig" >> /etc/profile

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN /usr/bin/ssh-keygen -A
EXPOSE 22
RUN mkdir nsight-workspace
CMD ["/usr/sbin/sshd", "-D"]
