noble: c-asm.c m.s
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m.s c-asm.c -o main.elf
	riscv64-unknown-elf-objcopy -O binary main.elf main.bin
	riscv64-unknown-elf-objdump -d main.elf > main.dump
	
assembly: c-asm.c
	riscv64-unknown-elf-gcc -O0 -nostdlib -march=rv32i -mabi=ilp32 -S c-asm.c
	#riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -S c-asm.c -o m.s

machinecode: c-asm.s m.s m.ld
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tm.ld m.s -o m.elf
	riscv64-unknown-elf-objcopy -O binary m.elf m.bin
	riscv64-unknown-elf-objdump -d m.elf > m.dump
printbinary: machinecode
	#xxd -e -c 4 -g 4 m.bin 
	xxd -b m.bin
startqemu: main.elf
	qemu-system-riscv32 -S -M virt -nographic  -bios none -kernel main.elf -gdb tcp::1234
	#qemu-riscv32 -machine virt -nographic -m 128M -kernel main.bin
connectgdb:main.elf
	gdb-multiarch main.elf -ex "target remote :1234" -ex "break _start" -ex "continue" -q
	#riscv64-unknown-elf-gdb main.elf -ex "target remote :1234" -ex "layout asm" -ex "layout regs"
clean:
	rm -f c-asm.s main.elf main.bin main.dump a.out