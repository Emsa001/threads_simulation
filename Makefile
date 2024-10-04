# Variables
CC = gcc
CFLAGS = -Iincludes -Wall -Wextra -Werror
CFLAGS += -g -pthread -Ofast
LDFLAGS = -Lincludes/mlx -lmlx -framework OpenGL -framework AppKit
CFLAGS += -Iincludes
NAME = simulation
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)

all: mlx $(NAME)

# Rules
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) -o $(NAME)

# Build mlx library
mlx:
	$(MAKE) -C includes/mlx

# Clean rule
clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C includes/mlx clean

re: fclean $(NAME)

run: all
	time ./$(NAME) 6

.PHONY: clean fclean re run all mlx