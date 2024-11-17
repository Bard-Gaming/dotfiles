##
## EPITECH PROJECT, 2024
## Project - [PROJECT_NAME]
## File description:
## Makefile used to help
## and facilitate the compilation
## of [PROJECT_NAME]
##

CC = gcc

CFLAGS =

NAME = [PROJECT_NAME]

SRC_FILES = main.c

INCLUDE_DIR = include/


all: $(NAME)

$(NAME):
	@$(CC) -o $(NAME) $(CFLAGS) $(SRC_FILES) -I./$(INCLUDE_DIR)

debug: CFLAGS = -ggdb -Wall -Wextra
debug: fclean $(NAME)

clean:

fclean: clean
	@rm -f $(NAME)

re: fclean all
