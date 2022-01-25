extern int printf(char *str, ...);
void __stack_chk_fail(void)
{
  printf("ERROR: __stack_chk_guard has been corrupted\n");
  exit(0);
}
int addition(int num1, int num2)
{
     int sum;
     /* Arguments are used here*/
     sum = num1+num2;

     /* Function return type is integer so we are returning
      * an integer value, the sum of the passed numbers.
      */
     return sum;
}

int main()
{
     int var1;
     int var2;
     int res;
    var1 =10;
    var2 =20;

    res = addition(var1, var2);
     printf ("Output: %d", res);


     return 0;
}