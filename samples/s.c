extern int read(int i, char *s, int j);
extern int printf(char *str, ...);
extern int exit(int k);


int addition(int num1, int num2)
{
     int sum;
     sum = num1+num2;

     if (guard != 3735928559)
     {
        printf("ERROR: __stack_chk_guard has been corrupted\n");
        exit(0);
      }

     return sum;
}


int main() {
	char c1;
	int c2;
	int n;
	int a;
    c2= addition(1,1);
    printf("addition result %i: \n",c2);
	a = 0;

	printf("Please give input: \n");
	n = read(0, &c1, 35);

	if (a==0)
	{
		printf("a has NOT changed.\n");
	}
	else
	{
		printf("a has changed. Buffer Overflow!\n");
	}

	printf("Exiting\n");

	return 0;
}