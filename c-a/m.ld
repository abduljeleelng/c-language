/*MEMORY
{
/* qemu-system-risc64 virt machine 
   RAM (rwx)  : ORIGIN = 0x80000000, LENGTH = 128M 
}
ENTRY(_start)
*/

MEMORY
{
    RAM : ORIGIN = 0x80000000, LENGTH = 4K 
}

SECTIONS
{
    .text : {
        *(.text)*
    } > RAM
}