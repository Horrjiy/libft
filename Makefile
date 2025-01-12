# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpoplow <mpoplow@student.42heilbronn.de    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 20:46:28 by mpoplow           #+#    #+#              #
#    Updated: 2025/01/03 15:27:22 by mpoplow          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SILENT:

NAME = libft.a

# *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*	#
# 	FILES																		#
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*	#

CFILES = ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c \
			ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c \
			ft_toupper.c ft_tolower.c \
			ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c \
			ft_calloc.c ft_strdup.c ft_strstrdup.c\
			ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strjoin_free.c\
			ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
			ft_printf.c \
			ft_pf_putstrchar_sc_perc.c \
			ft_pf_putnbr_di.c ft_pf_putunbr_u.c \
			ft_pf_puthex_lowx.c ft_pf_puthex_capx.c ft_pf_puthexaddress_p.c \
			get_next_line.c get_next_line_utils.c \
			get_next_text.c \

OFILES = $(CFILES:.c=.o)
DFILES = $(CFILES:.c=.d)
CFLAGS = -Wall -Wextra -Werror

%.o: %.c
	@$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

# *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*	#
# 	RULES																		#
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*	#

all: $(NAME)

$(NAME): $(OFILES)
	@echo "\033[1;32mlibft: create libft.a\033[0m"
	@ar rcs $(NAME) $(OFILES)
	@mkdir -p OandD_FILES_LIBFT
	@mv $(OFILES) $(DFILES) OandD_FILES_LIBFT

clean:
	@echo "\033[1;33mlibft: rm .o files\033[0m"
	@ [ -d OandD_FILES_LIBFT ] && rm -rf OandD_FILES_LIBFT || true

fclean: clean
	@echo "\033[1;33mlibft: remove libft.a\033[0m"
	@rm -f $(NAME)
	

re: fclean all

.PHONY:  all clean fclean re