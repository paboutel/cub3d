# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfaivre <nfaivre@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/24 10:25:16 by nfaivre           #+#    #+#              #
#    Updated: 2022/04/06 11:15:15 by paboutel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL = all

NAME = cub3D

QWERTY ?= $(shell setxkbmap -print | grep -c qwerty)

ifneq ($(QWERTY), 0)
ifneq ($(QWERTY), 1)
	override QWERTY = 0
endif
endif

DEFINE_FLAG = -D QWERTY=${QWERTY}

CC = clang
CFLAGS = -Wall -Wextra -Werror

VPATH = ./src/calculation:./src/main:./src/parsing:./src/utils
DIR_SRC = src
DIR_OBJ = .obj

LIB = -lm -Lmlx_linux -lmlx_Linux -lXext -lX11
INCLUDE = -Iinclude -Imlx_linux

SRC = math_utils.c next_intersection.c player_access.c put_texture.c raycast.c \
raycast_clean.c raycast_init.c raycast_utils.c update_player.c \
wall_distance.c key_hook.c main.c get_map.c parse_info.c parse_map.c parse_map_utils.c \
parse_rgb.c parse_texture.c parsing.c parsing_utils.c str_tab_utils1.c \
str_tab_utils2.c str_utils.c utils.c
OBJ = $(addprefix $(DIR_OBJ)/, $(notdir $(SRC:.c=.o)))
GNL_OBJ = $(DIR_OBJ)/get_next_line.o $(DIR_OBJ)/get_next_line_utils.o

mkdir_DIR_OBJ:
	mkdir -p $(DIR_OBJ)

$(DIR_OBJ)/%.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDE) $(DEFINE_FLAG)

$(NAME):
	make -C mlx_linux
	make -C Get-Next-Line DIR_OBJ=$(addprefix $(PWD)/, $(DIR_OBJ))
	$(CC) $(CFLAGS) $(OBJ) $(GNL_OBJ) -o $(NAME) $(LIB)

all: mkdir_DIR_OBJ $(OBJ) $(NAME)

clean:
	make $@ -C mlx_linux
	make $@ -C Get-Next-Line DIR_OBJ=$(addprefix $(PWD)/, $(DIR_OBJ))
	rm -f $(OBJ)

fclean: clean
	make $@ -C Get-Next-Line DIR_OBJ=$(addprefix $(PWD)/, $(DIR_OBJ))
	rm -f $(NAME)
	rm -rf $(DIR_OBJ)

re: fclean all

.PHONY: all clean fclean re
