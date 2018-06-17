objects = main.o print.o display.o

main.o: main.c print.h display.h
print.o: print.c print.h
display.o: display.c display.h

program: $(objects)
	gcc -g -O0 -o $@ $(objects)
