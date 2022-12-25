CC = gcc
CFLAGS = -Wall -O2 -Wpedantic

SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = obj

SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(BIN_DIR)/$(OBJ_DIR)/%.o)

TARGET = tetris

define resolve_dir_win
	@if not exist "$(1)" mkdir "$(1)"
endef

define resolve_dir_unix
	@mkdir -p $(1)
endef

ifeq ($(OS),Windows_NT)
	SHELL = cmd.exe
	RM_DIR = rmdir /s /q
	CFLAGS += -IPDCurses
	RESOLVE_DIR = resolve_dir_win
	CURSES_LIB = PDCurses/wincon/pdcurses.a
else
	SHELL = /bin/bash
	RM_DIR = rm -f -r
	RESOLVE_DIR = resolve_dir_unix
	CURSES_LIB = -lcurses
endif

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $^ $(CURSES_LIB) -o $(BIN_DIR)/$@

$(BIN_DIR)/$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(call $(RESOLVE_DIR),$(@D))
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean

clean:
	$(RM_DIR) $(BIN_DIR)
