# Author : Vikas Manocha <manochavikas@gmail.com>

CROSS_COMPILE ?= arm-none-eabi
CC = $(CROSS_COMPILE)-gcc
AS = $(CROSS_COMPILE)-as
LD = $(CROSS_COMPILE)-ld
OBJCOPY = $(CROSS_COMPILE)-objcopy
SIZE = $(CROSS_COMPILE)-size

CFLAGS += -mlittle-endian -mthumb -g
CFLAGS += -specs=nano.specs
LDFLAGS += -specs=nosys.specs -Wl,--gc-sections -Wl,--defsym=malloc_getpagesize_P=0x80 -Wl,--start-group -lc -lm -Wl,--end-group
