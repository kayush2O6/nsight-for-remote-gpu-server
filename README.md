# Nsight: run CUDA code on  remote gpu server
*nsight, an eclipse IDE for CUDA programming*

### Steps for configuring the execution on remote gpu server:  

---

#### Insallation:

1. nvidia cuda-toolkit should be installed.  
2. set the system path for nvcc compiler.  
3. pull the docker image on remote server using: `docker pull kayush206/ssh-docker`  
4. run the docker image on remote server using: `nvidia-docker run -d -p port:22 kayush206/ssh-docker`  
5. run `nvcc -V` on you local machine to get the version.  
6. run the `nsight` on you local, it will open the nsight ide in GUI.   

#### Configuration:

1. 


#### References:

1. [Executing CUDA C++ Application on a remote machine using Nsight Eclipse](https://medium.com/@rajeshkumar/executing-cuda-c-application-on-a-remote-machine-using-nsight-eclipse-fb8364029625)

