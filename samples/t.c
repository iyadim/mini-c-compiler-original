extern int read(int i, char *s, int j);
extern int printf(char *str, ...);
extern char *strcpy (char *__restrict __dest, __const char *__restrict __src);

void  __stack_chk_fail(void);
unsigned long __stack_chk_guard = 0xbadeebad;

void __stack_chk_fail(void) {
  printf("ERROR: __stack_chk_guard has been corrupted\n");

}

void func(int a, int b, char *str) {

 int c = 0xdeadbeef;
 int c1 = 0xdeadbeef;
 int c2 = 0xdeadbeef;

 char buf[4];
 strcpy(buf,str);
}

int main(int argc, char**argv) {
 func(0xaaaaaaaa,0xbbbbbbbb,argv[1]);
 return 0;
}