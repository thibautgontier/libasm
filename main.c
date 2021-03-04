#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include "libasm.h"

# define STRCMP(a, b)		printf("`%s`:`%s` = %d \n", a, b, ft_strcmp(a, b));
# define WRITE(s, x)		printf("^%ld\n", ft_write(1, s, x));
# define READ(b, x, c)		r = ft_read(c, buffer, x); printf("`%s`:%ld\n", buffer, r); ft_strclr(buffer); printf("\n");
# define DUP(s)				tmp = ft_strdup(s); printf("`%s` (`%s`)\n", tmp, s); free(tmp); tmp = NULL;


void	ft_strclr(char *s)
{
	while (s != NULL && *s)
		*s++ = '\0';
}

int		main(void)
{
	int		i;
	long	r;
	char	buffer[100];
	char	*tmp;
	char	*tmp2;
    int     fd;

    fd = open("test.txt", O_RDONLY);
	r = 0;
	i = 0;
	while (i < 100)
		buffer[i++] = 0;

	printf("--strlen\n");
	printf("`%s` = %zu (%d)\n", "", ft_strlen(""), (int)strlen(""));
	printf("`%s` = %zu (%d)\n", "hello", ft_strlen("hello"), (int)strlen("hello"));
	printf("`%s` = %zu (%d)\n", "hellohello", ft_strlen("hellohello"), (int)strlen("hellohello"));
	printf("`%s` = %zu (%d)\n", "0123456789abcdef", ft_strlen("0123456789abcdef"), (int)strlen("0123456789abcdef"));
	printf("`%s` = %zu (%d)\n", "42", ft_strlen("42"), (int)strlen("42"));
	printf("`%s` = %zu (%d)\n", "1", ft_strlen("1"), (int)strlen("1"));
	printf("-done\n");

	printf("\n--strcmp\n");
	STRCMP("", "")
	STRCMP("hello", "hello")
	STRCMP("", "hello")
	STRCMP("hello", "")
	STRCMP("hello", "hellothere")
	printf("`%s`:`%s` = %d\n", "hello", NULL, ft_strcmp("hello", NULL));
	printf("`%s`:`%s` = %d\n", NULL, "hello", ft_strcmp(NULL, "hello"));
	printf("`%s`:`%s` = %d\n", NULL, NULL, ft_strcmp(NULL, NULL));
	printf("-done\n");

	printf("\n--strcpy\n");
	printf("`%s` (`hello`)\n", ft_strcpy(buffer, "hello"));
	printf("`%s` (empty)\n", ft_strcpy(buffer, ""));
	printf("`%s` (`long message`)\n", ft_strcpy(buffer, "long message"));
	printf("`%s` (NULL > not modified)\n", ft_strcpy(buffer, NULL));
	printf("-done\n");

	printf("\n--write\n");
	WRITE("hello", 4)
	WRITE("hellohello", 4)
	WRITE("hellohello", 8)
	WRITE("hello", 2)
	printf("-done\n");

	printf("\n--read test.txt\n");
	READ(buffer, 50, fd)
	READ(buffer, 25, fd)
	READ(buffer, 4, fd)
	READ(buffer, 26, fd)
	READ(buffer, 14, fd)
	READ(buffer, 0, fd)
	printf("-done\n");

	printf("\n--ft_strdup\n");
	tmp2 = ft_strdup("hello");
	DUP(tmp2)
	free(tmp2);
	DUP("hellothere")
	DUP("long message")
	DUP("")
	DUP(NULL)
	printf("-done\n");

	return (0);
}