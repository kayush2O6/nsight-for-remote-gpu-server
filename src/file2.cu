/*
 * file2.cu
 *
 *  Created on: 06-Aug-2018
 *      Author: Ayush Kumar
 */




#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <iostream>

/* In general it's good to include also the header of the current .c,
   to avoid repeating the prototypes */
#include "file2.h"

int deviceInfo(void)
{
  cudaDeviceProp prop;
  int count,i;
  cudaGetDeviceCount(&count);
  for(i=0;i<count;i++){

    cudaGetDeviceProperties(&prop, i);
    printf("Device #%d ---------------\n",i);
    std::cout<<"Name: "<<prop.name<<"\n";
    std::cout<<"multiProcessorCount :"<<prop.multiProcessorCount<<"\n";
    std::cout<<"max thread per block :"<<prop.maxThreadsPerBlock<<"\n";
  }
return count;
}
