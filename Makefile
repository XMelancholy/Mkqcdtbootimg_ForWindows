include libfdt/Makefile.libfdt
include libmincrypt/Makefile.libmincrypt

MKBOOTIMG_SRC_FILES := src/mkqcdtbootimg.c $(addprefix libfdt/,$(LIBFDT_SRCS)) $(addprefix libmincrypt/,$(LIBMINCRYPT_SRCS))
MKBOOTIMGOBJ_FILES := $(MKBOOTIMG_SRC_FILES:%.c=%.o)

MKBOOTFS_SRC_FILES := src/mkbootfs.c
MKBOOTFSOBJ_FILES := $(MKBOOTFS_SRC_FILES:%.c=%.o)

UNPACKBOOTIMG_SRC_FILES := src/unpackbootimg.c
UNPACKBOOTIMGOBJ_FILES := $(UNPACKBOOTIMG_SRC_FILES:%.c=%.o)

LDFLAGS := 
CFLAGS := -Iinclude -Ilibfdt -Ilibmincrypt -Wall
MODULE := mkqcdtbootimg.exe
MKBOOTFSMODULE := mkbootfs.exe
UNPACKBOOTIMGMODULE := unpackbootimg.exe

all: $(MODULE) $(MKBOOTFSMODULE) $(UNPACKBOOTIMGMODULE)

$(MODULE): $(MKBOOTIMGOBJ_FILES)
	$(CC) -o $@ $^ $(LDFLAGS)

$(MKBOOTFSMODULE) : $(MKBOOTFSOBJ_FILES)
	$(CC) -o $@ $^ $(LDFLAGS)

$(UNPACKBOOTIMGMODULE) : $(UNPACKBOOTIMGOBJ_FILES)
	$(CC) -o $@ $^ $(LDFLAGS)

	
	
clean: 
	$(RM) $(MKBOOTIMGOBJ_FILES) $(MKBOOTFSOBJ_FILES) $(UNPACKBOOTIMGOBJ_FILES) $(MODULE) $(MKBOOTFSMODULE) $(UNPACKBOOTIMGMODULE)
