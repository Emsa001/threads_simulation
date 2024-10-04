# Variables
CC = gcc
CFLAGS = -Imlx -Wall -Wextra -Werror
CFLAGS += -g -pthread -Ofast
LDFLAGS = -Lmlx -lmlx -framework OpenGL -framework AppKit
NAME = simulation
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

all: mlx $(NAME)

# Rules
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ)
	$(CC) $(OBJ) $(LDFLAGS) -o $(NAME)

# Build mlx library
mlx:
	$(MAKE) -C mlx

# Clean rule
clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C mlx clean

re: fclean $(NAME)

run: all
	time ./$(NAME) 6

.PHONY: clean fclean re run all mlx