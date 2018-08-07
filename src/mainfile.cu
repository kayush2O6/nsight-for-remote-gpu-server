/*
 * mainfile.cu
 *
 *  Created on: 06-Aug-2018
 *      Author: Ayush Kumar
 */



#include <stdio.h>


/* In general it's good to include also the header of the current .c,
   to avoid repeating the prototypes */
#include "file2.h"

int main(void)
{
	int ret=0;
	printf("printing the available gpu devices :\n");
	ret=deviceInfo();
	printf("Total gpu devices : %d\n",ret);
	return 0;
}
