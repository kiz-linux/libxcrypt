###########
#LIBXCRYPT#
###########

autogen:
	cd libxcrypt && ./autogen.sh

configure:
	cd libxcrypt && ./configure --enable-static --enable-year2038 --prefix=/usr 

compile:
	cd libxcrypt && make

###########
# PACKAGE #
###########

copy_to_pkgdir:
	mkdir package/files
	cd libxcrypt && make install DESTDIR=$(PWD)/package/files

build_pkg:
	tar --zstd -cf libcrypt.tar.zst package/

###########
# META    #
###########

build: autogen configure compile

package: build copy_to_pkgdir build_pkg

clean:
	rm -rf package/files
	rm -rf libcrypt.tar.zst
