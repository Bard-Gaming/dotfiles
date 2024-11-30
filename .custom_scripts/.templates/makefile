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
TEST_NAME = unit_tests

INCLUDE_DIR = include/

SRC_FILES = main.c								\

TST_FILES = $(filter-out main.c, $(SRC_FILES))	\

.PHONY = all debug tests_run test_coverage clean fclean re

all: $(NAME)

$(NAME):
	@$(CC) -o $(NAME) $(CFLAGS) $(SRC_FILES) -I./$(INCLUDE_DIR)

debug: CFLAGS += -ggdb -Wall -Wextra
debug: fclean $(NAME)

$(TEST_NAME): CFLAGS += -o $(TEST_NAME) --coverage -lcriterion
$(TEST_NAME): SRC_FILES := $(TST_FILES)
$(TEST_NAME): $(NAME)

tests_run: $(TEST_NAME)
	@./$(TEST_NAME)
	@rm -f $(TEST_NAME)

test_coverage: $(TEST_NAME)
	@gcovr --exclude tests/
	@gcovr --exclude tests/ --txt-metric=branch

clean:
	@rm -f *.gcno
	@rm -f *.gcda

fclean: clean
	@rm -f $(TEST_NAME)
	@rm -f $(NAME)

re: fclean all
