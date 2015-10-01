PRODUCT_NAME       = GarrettStache_RoninSupreme
SOURCES            = main.c myLib.c far_bg.c title.c text.c pause_screen.c victory.c lose.c far_bg_1.c foreground.c Taco_Sprites.c Brocolli.c victory_song.c Swords_Clashing.c Sword_Swing.c super_slice.c power_up.c Kung_Fu.c game_loop.c RoundOne.c RoundTwo.c RoundThree.c

DKPATH             = C:/devkitARM/bin
CCPATH             = C:/cygwin/bin
VBASIM             = C:/vba/VisualBoyAdvance.exe
FIND               = find
COPY               = cp -r

# --- File Names
ELF_NAME           = $(PRODUCT_NAME).elf
ROM_NAME           = $(PRODUCT_NAME).gba
BIN_NAME           = $(PRODUCT_NAME)

#MODEL              = -mthumb-interwork -mthumb #This does not make interrupts work
MODEL              = -mthumb-interwork -marm -mlong-calls #This makes interrupts work
SPECS              = -specs=gba.specs

# --- Archiver
AS                 = $(DKPATH)/arm-eabi-as
ASFLAGS            = -mthumb-interwork

# --- Compiler
CC                 = $(DKPATH)/arm-eabi-gcc
CFLAGS             = $(MODEL) -O2 -Wall -pedantic -Wextra -std=c99 -D_ROM=$(ROM_NAME) -D_VBA=$(VBASIM) -save-temps
CC_WRAP            = $(CCPATH)/gcc
CFLAGS_WRAP        = -O3 -Wall -pedantic -D_ROM='"$(ROM_NAME)"' -D_VBA='"$(VBASIM)"'

# --- Linker
LD                 = $(DKPATH)/arm-eabi-gcc
LDFLAGS            = $(SPECS) $(MODEL) -lm

# --- Object/Executable Packager
OBJCOPY            = $(DKPATH)/arm-eabi-objcopy
OBJCOPYFLAGS       = -O binary

# --- ROM Fixer
GBAFIX             = $(DKPATH)/gbafix

# --- Delete
RM                 = rm -f

OBJECTS = $(filter-out gba_wrapper%,$(SOURCES:.c=.o))

# --- Main Build Target
all : build $(BIN_NAME)

run : build
	$(VBASIM) $(ROM_NAME)

build : UNZIP $(ROM_NAME)

# --- GBA Wrapper Stuff
#$(BIN_NAME) : gba_wrapper.c
#	$(CC_WRAP) $(CFLAGS_WRAP) -o $@ $^

# --- Build .elf file into .gba ROM file
$(ROM_NAME) : $(ELF_NAME)
	$(OBJCOPY) $(OBJCOPYFLAGS) $(ELF_NAME) $(ROM_NAME)
	$(GBAFIX) $(ROM_NAME)

# --- Build .o files into .elf file
$(ELF_NAME) : $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $@

# --- Build .c files into .o files
$(OBJECTS) : %.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@


# ============ Common
UNZIP :
	-@$(FIND) . -iname "*.zip" -exec unzip -n {} \;-exec echo "This project must be rebuilt" \; -exec rm {} \;

clean:
	$(RM) $(ROM_NAME)
	$(RM) $(ELF_NAME)
	$(RM) $(BIN_NAME)
	$(RM) *.o
# ============ Common