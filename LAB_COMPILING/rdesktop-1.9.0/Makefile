#
# rdesktop: A Remote Desktop Protocol client
# Makefile.in
# Copyright (C) Matthew Chapman 1999-2007
#

prefix      = /usr/local
exec_prefix = ${prefix}
bindir      = ${exec_prefix}/bin
mandir      = ${datarootdir}/man
datarootdir = ${prefix}/share
datadir     = ${datarootdir}

VERSION     = 1.9.0
KEYMAP_PATH = $(datadir)/rdesktop/keymaps/

CC          = gcc
INSTALL     = /usr/bin/install -c
CFLAGS      = -g -O2 -Wall -Wextra     -I/usr/include/p11-kit-1   -DPACKAGE_NAME=\"rdesktop\" -DPACKAGE_TARNAME=\"rdesktop\" -DPACKAGE_VERSION=\"1.9.0\" -DPACKAGE_STRING=\"rdesktop\ 1.9.0\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DL_ENDIAN=1 -DHAVE_SYS_SELECT_H=1 -DHAVE_LOCALE_H=1 -DHAVE_LANGINFO_H=1 -DHAVE_SYSEXITS_H=1 -DHAVE_XCURSOR=1 -DEGD_SOCKET=\"/var/run/egd-pool\" -DWITH_RDPSND=1 -DRDPSND_OSS=1 -DHAVE_DIRENT_H=1 -DHAVE_DIRFD=1 -DHAVE_DECL_DIRFD=1 -DHAVE_ICONV_H=1 -DHAVE_ICONV=1 -DICONV_CONST= -DHAVE_SYS_VFS_H=1 -DHAVE_SYS_STATVFS_H=1 -DHAVE_SYS_STATFS_H=1 -DHAVE_SYS_PARAM_H=1 -DHAVE_SYS_MOUNT_H=1 -DSTAT_STATVFS=1 -DHAVE_STRUCT_STATVFS_F_NAMEMAX=1 -DHAVE_STRUCT_STATFS_F_NAMELEN=1 -DHAVE_MNTENT_H=1 -DHAVE_SETMNTENT=1 -DKEYMAP_PATH=\"$(KEYMAP_PATH)\"
LDFLAGS     =  -lgmp  -lXcursor -ltasn1 -lnettle -lhogweed -lgnutls    
STRIP       = strip

TARGETS     = rdesktop
SOUNDOBJ    =  rdpsnd.o rdpsnd_dsp.o rdpsnd_oss.o
SCARDOBJ    = 
CREDSSPOBJ  = 

RDPOBJ   = tcp.o asn.o iso.o mcs.o secure.o licence.o rdp.o orders.o bitmap.o cache.o rdp5.o channels.o rdpdr.o serial.o printer.o disk.o parallel.o printercache.o mppc.o pstcache.o lspci.o seamless.o ssl.o utils.o stream.o dvc.o rdpedisp.o
X11OBJ   = rdesktop.o xwin.o xkeymap.o ewmhints.o xclip.o cliprdr.o ctrl.o

.PHONY: all
all: $(TARGETS)

rdesktop: $(X11OBJ) $(SOUNDOBJ) $(RDPOBJ) $(SCARDOBJ) $(CREDSSPOBJ)
	$(CC) $(CFLAGS) -o rdesktop $(X11OBJ) $(SOUNDOBJ) $(RDPOBJ) $(SCARDOBJ) $(CREDSSPOBJ) $(LDFLAGS) -lX11

.PHONY: install
install: installbin installkeymaps installman

.PHONY: installbin
installbin: rdesktop
	mkdir -p $(DESTDIR)$(bindir)
	$(INSTALL) rdesktop $(DESTDIR)$(bindir)
	$(STRIP) $(DESTDIR)$(bindir)/rdesktop
	chmod 755 $(DESTDIR)$(bindir)/rdesktop

.PHONY: installman
installman: doc/rdesktop.1
	mkdir -p $(DESTDIR)$(mandir)/man1
	cp doc/rdesktop.1 $(DESTDIR)$(mandir)/man1
	chmod 644 $(DESTDIR)$(mandir)/man1/rdesktop.1

.PHONY: installkeymaps
installkeymaps:
	mkdir -p $(DESTDIR)$(KEYMAP_PATH)
# Prevent copying the CVS directory
	cp keymaps/?? keymaps/??-?? keymaps/??-??-???? $(DESTDIR)$(KEYMAP_PATH)
	cp keymaps/common $(DESTDIR)$(KEYMAP_PATH)
	cp keymaps/modifiers $(DESTDIR)$(KEYMAP_PATH)
	chmod 644 $(DESTDIR)$(KEYMAP_PATH)/*

.PHONY: clean
clean:
	rm -f *.o *~ rdesktop

.PHONY: distclean
distclean: clean
	rm -rf autom4te.cache config.log config.status Makefile rdesktop-$(VERSION).tar.gz

.PHONY: dist
dist: rdesktop-$(VERSION).tar.gz

rdesktop-$(VERSION).tar.gz: Makefile configure
	mkdir -p /tmp/rdesktop-make-dist-dir
	ln -sf `pwd` /tmp/rdesktop-make-dist-dir/rdesktop-$(VERSION)
	(cd /tmp/rdesktop-make-dist-dir; \
	tar zcvf rdesktop-$(VERSION)/rdesktop-$(VERSION).tar.gz \
	rdesktop-$(VERSION)/COPYING \
	rdesktop-$(VERSION)/README.md \
	rdesktop-$(VERSION)/configure \
	rdesktop-$(VERSION)/configure.ac \
	rdesktop-$(VERSION)/config.sub \
	rdesktop-$(VERSION)/config.guess \
	rdesktop-$(VERSION)/bootstrap \
	rdesktop-$(VERSION)/install-sh \
	rdesktop-$(VERSION)/Makefile.in \
	rdesktop-$(VERSION)/rdesktop.spec \
	rdesktop-$(VERSION)/*.c \
	rdesktop-$(VERSION)/*.h \
	rdesktop-$(VERSION)/keymaps/?? \
	rdesktop-$(VERSION)/keymaps/??-* \
	rdesktop-$(VERSION)/keymaps/common \
	rdesktop-$(VERSION)/keymaps/modifiers \
	rdesktop-$(VERSION)/keymaps/convert-map \
	rdesktop-$(VERSION)/doc/HACKING \
	rdesktop-$(VERSION)/doc/AUTHORS \
	rdesktop-$(VERSION)/doc/TODO \
	rdesktop-$(VERSION)/doc/ChangeLog \
	rdesktop-$(VERSION)/doc/keymapping.txt \
	rdesktop-$(VERSION)/doc/keymap-names.txt \
	rdesktop-$(VERSION)/doc/ipv6.txt \
	rdesktop-$(VERSION)/doc/licensing.txt \
	rdesktop-$(VERSION)/doc/patches.txt \
	rdesktop-$(VERSION)/doc/redirection.txt \
	rdesktop-$(VERSION)/doc/rdesktop.1 )
	rm -rf /tmp/rdesktop-make-dist-dir

.PHONY: dist-noversion
dist-noversion: rdesktop.tar.gz

rdesktop.tar.gz: rdesktop-$(VERSION).tar.gz
	mkdir -p /tmp/rdesktop-make-dist-dir
	tar zxvf $< -C /tmp/rdesktop-make-dist-dir
	mv /tmp/rdesktop-make-dist-dir/rdesktop-$(VERSION) /tmp/rdesktop-make-dist-dir/rdesktop
	ls /tmp/rdesktop-make-dist-dir/rdesktop
	tar zcvf $@ -C /tmp/rdesktop-make-dist-dir rdesktop
	rm -rf /tmp/rdesktop-make-dist-dir

Makefile: Makefile.in configure
	./config.status

configure: configure.ac
	./bootstrap

.SUFFIXES:
.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: doc/AUTHORS
doc/AUTHORS:
	./genauthors *.c
