# Author : Vikas Manocha <manochavikas@gmail.com>

FAMILY = G0
DEVICE = STM32$(FAMILY)71xx
CFLAGS += -mcpu=cortex-m0plus

INC_BOARD += -IDrivers/STM32$(FAMILY)xx_HAL_Driver/Inc/
INC_BOARD += -IDrivers/CMSIS/Device/ST/STM32$(FAMILY)xx/Include/
INC_BOARD += -IDrivers/CMSIS/Include/
INC_BOARD += -IDrivers/BSP/STM32$(FAMILY)xx_Nucleo/

srcs += $(wildcard Drivers/STM32$(FAMILY)xx_HAL_Driver/Src/*.c) # or provide only the needed drivers
