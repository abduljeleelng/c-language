// #include <stdio.h>

__asm__(
    _start:
        li sp, 0x80002000
        j noble
    j .

);


int main()
{
    int a=2, b=4, sum;
    sum = a+b;
    // printf("Sum is %d\n", sum);
    // printf("Hello World\n");
    return 0;
}
