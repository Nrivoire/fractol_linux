# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: nrivoire <nrivoire@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2019/06/14 18:19:22 by nrivoire     #+#   ##    ##    #+#        #
#    Updated: 2019/09/04 12:20:56 by nrivoire    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#################
##  VARIABLES  ##
#################

#	Output
NAME = fractol

#	Sources
# SRC_SUP = {dossiers dans src qui seront separe par une virgule}
SRC_SUP = my_mlx
SRC_PATH = src
SRC_NAME = main.c ft_error.c map.c ft_cplx.c\
		   my_mlx/ft_create_img.c\
		   my_mlx/ft_pixel_put.c\
		   julia.c mandelbrot.c burning_ship.c\
		   key_event.c mouse_event.c\

#	Objects
OBJ_PATH = .objects
OBJ_NAME = $(SRC_NAME:.c=.o)
OBJ = $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

#	Includes
INC_PATH = includes
INC_NAME = fractol.h keys.h
INC = $(addprefix $(INC_PATH)/,$(INC_NAME))

CPPFLAGS = -I $(INC_PATH)
LDFLAGS = -L libft
LDLIBS = -lft
#MACOS
#MINILIBX = -I includes -I minilibx_macos -L minilibx_macos -lmlx -framework OpenGL -framework AppKit
#LINUX
MLXFLAG = -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz

#	Compiler
CC = clang
#MACOS
#CFLAGS = -Wall -Wextra -Werror -O3 -I. #-g3 -fsanitize=address
#LINUX
CFLAGS = -Wall -Wextra #-g3 -fsanitize=address

#################
##  TARGETS    ##
#################

# $@ -> nom de la règle
# $^ -> représente tout ce qui est apres le :
# $< -> nom de la dependance

# empêche le Makefile de confondre un fichier et une règle en cas de même nom
.PHONY: all clean fclean re

all: libft.a $(NAME)

#$(NAME): $(OBJ)
#	@$(CC) $(LDFLAGS) $(MLXFLAG) $(LDLIBS) $^ -o $@

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) $(MLXFLAG) $(LDLIBS) -o $(NAME)

libft.a:
	@make -C ./libft/

#$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c $(INC)
#	@mkdir -p $(OBJ_PATH)
#	@mkdir -p $(OBJ_PATH)/$(SRC_SUP)
#	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c $(INC)
	@mkdir -p $(OBJ_PATH)
	@mkdir -p $(OBJ_PATH)/$(SRC_SUP)
	$(CC) -Wall -Wextra $(CPPFLAGS) -g -Imlx_linux -O3 -c $< -o $@

clean:
	@make -C libft clean
	@rm -rf $(OBJ_PATH)

fclean: clean
	@make -C libft fclean
	@rm -rf $(NAME)

re: fclean all

norme:
	norminette $(SRC_PATH) $(INC_PATH)
