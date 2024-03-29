NAME = libasm.a

SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s	\
		ft_read.s	\
		ft_strdup.s

OBJS = $(SRCS:.s=.o)

%.o	: %.s
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS) 
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	@rm -f $(OBJS)

test: all
	@gcc -Wall -Wextra -Werror -I./libasm.h libasm.a main.c -o test_libasm
	@./test_libasm

fclean: clean
	@rm -f $(NAME)
	@rm -f test_libasm
	@rm -f test

re: fclean all