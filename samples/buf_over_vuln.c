extern int read(int i, char *s, int j);
extern int printf(char *str, ...);
extern int exit(int k);

int main() {
	char c1;
	char c2;
	int n;
	int a;

	a = 0;

	printf("Please give input: \n");
	n = read(0, &c1, 35);

	{
		int a1, a2, a3, a4;


	}

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