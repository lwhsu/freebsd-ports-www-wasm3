# $FreeBSD$

PORTNAME=	wasm3
DISTVERSIONPREFIX=	v
DISTVERSION=	0.4.7
CATEGORIES=	www

MAINTAINER=	lwhsu@FreeBSD.org
COMMENT=	High performance WebAssembly interpreter written in C

LICENSE=	MIT

USES=	cmake

USE_GITHUB=	yes

GH_TUPLE=	cjihrig:uvwasi:v0.0.8:uvwasi/deps/uvwasi \
		libuv:libuv:v1.37.0:libuv/deps/libuv

CMAKE_ARGS=	-DUVWASI_INCLUDE_DIR=${WRKSRC}/deps/uvwasi \
		-DLIBUV_INCLUDE_DIR=${WRKSRC}/deps/libuv \

PLIST_FILES=	bin/wasm3

do-install:
	${INSTALL_PROGRAM} ${INSTALL_WRKSRC}/wasm3 ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
