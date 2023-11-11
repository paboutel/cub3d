# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfaivre <nfaivre@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/10 17:09:05 by nino              #+#    #+#              #
#    Updated: 2022/04/06 11:07:34 by paboutel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL = all

CC = clang
CFLAGS = -Wall -Werror -Wextra

DIR_SRC = src
DIR_OBJ ?= .obj

INCLUDE = -Iinclude

SRC = $(DIR_SRC)/get_next_line.c $(DIR_SRC)/get_next_line_utils.c
OBJ = $(addprefix $(DIR_OBJ)/, $(notdir $(SRC:.c=.o)))

mkdir_DIR_OBJ:
	mkdir -p $(DIR_OBJ)

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c ./include/get_next_line.h
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDE)

all: mkdir_DIR_OBJ $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -rf $(DIR_OBJ)

re: fclean all

.PHONY: all clean fclean re
