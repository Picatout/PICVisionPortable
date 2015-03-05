#include <stdio.h>
#include <stdlib.h>





int main(int argc, char **argv){
	FILE *f1,*f2;
	unsigned char c1,c2;
	unsigned i;
	
	if (argc<3) return 0;
	f1=fopen(argv[1],"rb");
	f2=fopen(argv[2],"rb");
	i=0;
	c1=fgetc(f1);
	c2=fgetc(f2);
	while (!(feof(f1)||feof(f2))){
		if (c1!=c2){
			printf("at 0x%03X, c1=0x%02X and c2=0x%02X\n",i,c1,c2);
		}
		i++;
		c1=fgetc(f1);
		c2=fgetc(f2);
	}
	printf("bytes count: %u\n",i);
	fclose(f1);
	fclose(f2);
	return 0;
}



