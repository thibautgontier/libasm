#ifndef LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

char        *ft_strdup(const char *s1);
size_t      ft_strlen(const char *str);
ssize_t     ft_read(int filedes, void *buf, size_t nbyte);
ssize_t     ft_write(int filedes, void *buf, size_t nbyte);
char        *ft_strcpy(char *dst, const char *src);
int         ft_strcmp(const char *s1, const char *s2);

#endif