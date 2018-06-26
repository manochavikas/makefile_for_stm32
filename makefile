# Author : Vikas Manocha <manochavikas@gmail.com>

BOARD_PATH = Projects/NUCLEO-G071RB
PROJECT_PATH = Examples/GPIO/GPIO_IOToggle
TARGET = GPIO_IOToggle

include config_common.mk
#include $(BOARD_PATH)/board_config.mk
include config_board.mk

# if board_config not present in top directory, then error
# echo "board_config not present,please configure the board"
 
INC += -I$(BOARD_PATH)/$(PROJECT_PATH)/Inc/
INCDIRS = ${INC} ${INC_BOARD}

srcs += $(wildcard $(BOARD_PATH)/$(PROJECT_PATH)/Src/*.c)
#srcs += $(wildcard $(BOARD_PATH)/$(PROJECT_PATH)/SW4STM32/*.s)
srcs_s += $(wildcard $(BOARD_PATH)/$(PROJECT_PATH)/SW4STM32/*.s)

objs := $(srcs:.c=.o)
objs += $(srcs_s:.s=.o)

LDFLAGS += -Wl,-Map=$@.map
LDFILE = $(BOARD_PATH)/$(PROJECT_PATH)/SW4STM32/STM32G071RB-Nucleo_GPIO_IOToggle/STM32G071RBTx_FLASH.ld 

$(TARGET):$(objs)
	$(CC) $(CFLAGS) $(LDFLAGS) -T $(LDFILE) -o $@.elf $(objs)
	$(OBJCOPY) -Obinary $@.elf $@.bin
	$(SIZE) $@.elf
	
%.o: %.c
	$(CC) -c $(CFLAGS) ${INCDIRS} -D$(DEVICE) $< -o $@

clean:
	rm -f a.out
	rm -f *.o
	rm -f *.a
	rm -f *.elf *.map *.bin
	rm -f ${objs}
