

#ifndef S21_CAT_H
#define S21_CAT_H

#include <errno.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int b, e, n, s, t, v;
} flagz;

void open_file(char** argv, flagz vimpel);
void read_file(flagz vimpel, FILE* file);

#endif
