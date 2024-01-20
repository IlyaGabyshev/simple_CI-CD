#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <string.h>

#define size_pattern 4096
#define bufferSize 4096
int no_flag = 0;
typedef struct {
  int e, i, v, c, l, h, n, s, f;
} flags;

struct option flagss[] = {
    {"e", 0, NULL, 'e'}, {"i", 0, NULL, 'i'}, {"v", 0, NULL, 'v'},
    {"c", 0, NULL, 'c'}, {"l", 0, NULL, 'l'}, {"n", 0, NULL, 'n'},
    {"h", 0, NULL, 'h'}, {"s", 0, NULL, 's'}, {NULL, 0, NULL, 0}};

void find_flag_write_pattern(int argc, char **argv, int *check_fail,
                             char *pattern, flags *flag);

void open_file(int argc, char **argv, char *pattern, flags *flag);
void compile(char *pattern, flags *flag, regex_t *regex);
void read_file(FILE *file_pointer, regex_t *regex, char **argv,
               int num_file_count, flags *flag, int i);
int comparison_find(char *string_in_file, regex_t *regex);
void output(int num_of_string_nFlag, char *string_in_file, flags *flag,
            int num_file_count, char **argv, int i, int c_f);
#endif