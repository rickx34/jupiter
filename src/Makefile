CFLAGS = -g -02
all: jupiter

jupiter: main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ main.c

install:
	install -d $(DESTDIR)$(bindir)
	install -m 0755 jupiter $(DESTDIR)$(bindir)

check: all
	./jupiter | grep "Hello from .*jupiter!"
	@echo "** All TESTS PASSED **"

clean:
	-rm -f jupiter *.o > /dev/null 2>&1

uninstall:
	-rm -f $(DESTDIR)$(bindir)/jupiter

.PHONY: all clean check
