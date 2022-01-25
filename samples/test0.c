extern int read(int i, char *s, int j);
extern int printf(char *str, ...);
void  __stack_chk_fail(void);
unsigned long __stack_chk_guard = 0xbadeebad;

void __stack_chk_fail(void) {
  printf("ERROR: __stack_chk_guard has been corrupted\n");

}


int main() {
	char c1;
	char c2;
	int n;
	int a;

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