#include "s21_grep.h"

int main(int argc, char **argv) {
  int check_fail = 0;
  char pattern[size_pattern] = {0};
  flags flag = {0};
  if (argc > 2) {
    find_flag_write_pattern(argc, argv, &check_fail, pattern, &flag);

    open_file(argc, argv, pattern, &flag);
  } else {
    printf(
        "Usage: grep [OPTION]... PATTERNS [FILE]..."
        "\nTry 'grep --help' for more information.\n");
  }

  return 0;
}

void find_flag_write_pattern(int argc, char **argv, int *check_fail,
                             char *pattern, flags *flag) {
  int opt;

  while ((opt = getopt_long(argc, argv, "e:ivclnsh", flagss, 0)) != -1) {
    no_flag = 1;

    switch (opt) {
      case 'e':
        flag->e = 1;
        strncat(pattern, optarg, size_pattern - strlen(pattern) - 1);
        strncat(pattern, "|", size_pattern - strlen(pattern) - 1);
        break;
      case 'i':
        flag->i = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      case 'c':
        flag->c = 1;
        break;
      case 'l':
        flag->l = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 'h':
        flag->h = 1;
        break;

      default:
        printf("Unknown flag \n");
    }
  }

  if (flag->e == 1) strcat(pattern, argv[optind]);
  pattern[strlen(pattern) - 1] = '\0';

  if (flag->e == 0 || no_flag) {
    strcat(pattern, argv[optind]);
    pattern[strlen(pattern)] = '\0';
  }

  if (*check_fail != 0) printf("ERROR!");
}

void open_file(int argc, char **argv, char *pattern, flags *flag) {
  FILE *file_pointer = NULL;
  int num_file_count = 0;

  if (flag->e)
    num_file_count = argc - optind;
  else
    num_file_count = argc - optind - 1;

  int i = 0;
  if (flag->e)
    i = optind;
  else
    i = optind + 1;

  for (; i < argc; i++) {
    if ((file_pointer = fopen(argv[i], "r")) == NULL) {
      if (flag->s == 0)
        printf("grep: %s: No such file or directory \n", argv[i]);

    } else {
      regex_t regex;

      compile(pattern, flag, &regex);

      read_file(file_pointer, &regex, argv, num_file_count, flag, i);
      fclose(file_pointer);
    }
  }
}

void compile(char *pattern, flags *flag, regex_t *regex) {
  if (flag->i) {
    regcomp(regex, pattern, REG_EXTENDED | REG_ICASE);
  } else {
    regcomp(regex, pattern, REG_EXTENDED);
  }
}

void read_file(FILE *file_pointer, regex_t *regex, char **argv,
               int num_file_count, flags *flag, int i) {
  int num_of_string_nFlag = 1;
  int num_comparison_cFlag = 0;
  char string_in_file[bufferSize] = {0};
  int c_f = 0;

  while (!feof(file_pointer)) {
    if (fgets(string_in_file, bufferSize, file_pointer)) {
      char name3[256] = {0};
      if (num_file_count > 1) {
        strcat(name3, argv[i]);
        strcat(name3, ":");
      }
      c_f = comparison_find(string_in_file, regex);

      if (flag->v == 1 && c_f != 0 && !feof(file_pointer))
        printf("%s%s", name3, string_in_file);
      else if (flag->v == 1 && c_f != 0)
        printf("%s%s\n", name3, string_in_file);

      if (c_f != REG_NOMATCH || no_flag == 0) {
        num_comparison_cFlag += 1;

        output(num_of_string_nFlag, string_in_file, flag, num_file_count, argv,
               i, c_f);
      }
      num_of_string_nFlag++;
    }
  }
  char name2[256] = {0};
  if (num_file_count > 1) {
    strcat(name2, argv[i]);
    strcat(name2, ":");
  }

  if (flag->c == 1) printf("%s%d\n", name2, num_comparison_cFlag);
  if (flag->l == 1 && (c_f)) printf("%s\n", argv[i]);
  regfree(regex);
}

int comparison_find(char *string_in_file, regex_t *regex) {
  int comparison = regexec(regex, string_in_file, 0, NULL, 0);

  return comparison;
}

void output(int num_of_string_nFlag, char *string_in_file, flags *flag,
            int num_file_count, char **argv, int i, int c_f) {
  char name[256] = {0};
  if (num_file_count > 1) {
    strcat(name, argv[i]);
    strcat(name, ":");
  }
  if ((flag->e == 1 && c_f == 0) || (no_flag == 0 && c_f == 0)) {
    if (num_file_count > 1)
      printf("%s:%s", argv[i], string_in_file);
    else
      printf("%s", string_in_file);
  }

  if (flag->i == 1) printf("%s%s", name, string_in_file);

  if (flag->n == 1)
    printf("%s%d:%s", name, num_of_string_nFlag, string_in_file);

  if (flag->h == 1) printf("%s", string_in_file);

  if (flag->s == 1) printf("%s:%s", name, string_in_file);
}
