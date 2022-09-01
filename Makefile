CC := gcc 
CFLAGS := -W -Wall -Wextra -Wno-unused-parameter -fno-stack-protector -z execstack -no-pie -m32

all: bo exploit exploit-remote

bo:
	$(CC) $(CFLAGS) src/bo.c -o bin/bo

exploit:
	$(CC) $(CFLAGS) src/exploit.c -o bin/exploit

exploit-remote:
	$(CC) $(CFLAGS) src/exploit-remote.c -o bin/exploit-remote

test-bo:
	./bo `perl -e 'print "A"x1024 '`
clean:
	rm -f bin/*

disableaslr:
	echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

