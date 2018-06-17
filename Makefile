pacakge = jupiter
version = 1.0
tarname = $(pacakge)-$(version)
distdir = $(tarname)

prefix = /home/peace/duar/scripts/autools_tut/projects/jupiter
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin

export prefix
export exec_prefix
export bindir

all clean check jupiter install uninstall:
	cd src && $(MAKE) $@

dist: $(distdir).tar.gz

$(distdir).tar.gz: $(distdir)
	tar -czf $@ $(distdir)
	rm -rf $(distdir)

$(distdir): clean FORCE
	mkdir -p $(distdir)/src
	cp Makefile $(distdir)
	cp -R src $(distdir)

distcheck: $(distdir).tar.gz
	tar -xzf $(distdir).tar.gz
	cd $(distdir) && \
		$(MAKE) all && \
		$(MAKE) check && \
		$(MAKE) DESTDIR=$${PWD}/_inst install && \
		$(MAKE) DESTDIR=$${PWD}/_inst uninstall
		@remaining="`find $${PWD}/$(distdir)/_inst -type f | wc -l`"; \
		if test "$${remaining}" -ne 0; then \
			echo "*** $${remaining} file(s) remaining in stage directory!"; \
			exit 1; \
		fi
		$(MAKE) clean
	-rm -rf $(distdir)
	@echo "*** Package $(distdir).tar.gz is ready for distribution ***"

FORCE:
	-rm $(distdir).tar.gz > /dev/null 2>&1
	-rm -rf $(distdir) > /dev/null 2>&1

.PHONY: all clean dist distcheck check install uninstall FORCE
