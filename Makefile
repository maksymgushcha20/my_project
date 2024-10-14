# Makefile

CC = gcc
CFLAGS = -Iinclude -Wall
SRC_DIR = src
OBJ_DIR = build
LIB_STATIC = libmylib.a
LIB_SHARED = libmylib.so

all: $(OBJ_DIR)/main $(OBJ_DIR)/$(LIB_STATIC)

$(OBJ_DIR)/$(LIB_STATIC): $(OBJ_DIR)/mylib.o
	ar rcs $@ $^

$(OBJ_DIR)/$(LIB_SHARED): $(OBJ_DIR)/mylib.o
	$(CC) -shared -o $@ $(OBJ_DIR)/mylib.o

$(OBJ_DIR)/main: $(OBJ_DIR)/main.o $(OBJ_DIR)/$(LIB_STATIC)
	$(CC) -o $@ $(OBJ_DIR)/main.o -L$(OBJ_DIR) -lmylib
$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/main.c -o $@

$(OBJ_DIR)/mylib.o: $(SRC_DIR)/mylib.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/mylib.c -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR)
