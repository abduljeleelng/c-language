assembly: main.c
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -S main.c -o main.s

machinecode: assembly
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld main.s -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin
	riscv64-unknown-elf-objdump -d main.elf > main.dump
printbinary: machinecode
	#xxd -e -c 4 -g 4 main.bin 
	xxd -b main.bin
startqemu: machinecode
	qemu-system-riscv32 -S -M virt -nographic  -bios none -kernel main.elf -gdb tcp::1234
	#qemu-riscv32 -machine virt -nographic -m 128M -kernel main.bin
connectgdb: machinecode
	gdb-multiarch main.elf -ex "target remote :1234" -ex "break _start" -ex "continue" -q
	#riscv64-unknown-elf-gdb main.elf -ex "target remote :1234" -ex "layout asm" -ex "layout regs"
clean:
	rm -f main.s main.elf main.bin main.dump main.out