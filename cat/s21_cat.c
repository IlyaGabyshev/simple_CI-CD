
#include "s21_cat.h"

flagz read_flags(int argc, char** argv) {
  static struct option long_oprions[] = {

      {"number-nonblank", 0, NULL, 'b'},
      {"number", 0, NULL, 'n'},
      {"squeeze-blank", 0, NULL, 's'},
      {NULL, 0, NULL, 0}};
  flagz vimpel = {0};
  int f = 0;
  while (f != -1) {
    f = getopt_long(argc, argv, "+beEnstTv", long_oprions, NULL);
    if (f == -1) break;
    switch (f) {
      case 'b':
        vimpel.b = 1;
        break;
      case 'e':
        vimpel.e = 1;
        vimpel.v = 1;
        break;
      case 'E':
        vimpel.e = 1;
        break;
      case 'n':
        vimpel.n = 1;
        break;
      case 's':
        vimpel.s = 1;
        break;
      case 't':
        vimpel.t = 1;
        vimpel.v = 1;
        break;
      case 'T':
        vimpel.t = 1;
        break;
      case 'v':
        vimpel.v = 1;
        break;
      default:
        printf("usage: cat [-benstuv] [file ...]\n");
        exit(0);

        break;
    }
  }
  return vimpel;
}

void open_file(char** argv, flagz vimpel) {
  FILE* file = fopen(argv[optind], "r");
  if (!file) {
    printf("cat: %s: %s\n", argv[optind], strerror(errno));
  } else {
    read_file(vimpel, file);
    fclose(file);
  }
}

void read_file(flagz vimpel, FILE* file) {
  int symbol, prev = '\n', duplicate = 0, count = 1, first = 1;
  while ((symbol = fgetc(file)) != EOF) {
    if (vimpel.s) {
      if (symbol == '\n' && first)
        duplicate = duplicate + 2;
      else if (symbol == '\n')
        duplicate++;
      if (symbol != '\n') duplicate = 0;
    }

    if (symbol == '\n' && (!vimpel.s || duplicate < 3)) {
      if (vimpel.n && prev == '\n' && !vimpel.b) printf("%6d\t", count++);
      if (vimpel.e) printf("$");
      printf("%c", symbol);
    }

    if (symbol != '\n') {
      if ((prev == '\n' || first == 1) && (vimpel.n || vimpel.b))
        printf("%6d\t", count++);
      if (symbol < 32 && symbol != 9 && symbol != 10 && vimpel.v)
        printf("^%c", symbol + 64);
      else if (symbol > 127 && symbol < 160 && vimpel.v)
        printf("M-^%c", symbol - 64);
      else if (symbol == 127 && vimpel.v)
        printf("^%c", symbol - 64);
      else if (symbol == '\t' && vimpel.t)
        printf("^I");
      else
        printf("%c", symbol);
    }
    prev = symbol;
    first = 0;
  }
}

int main(int argc, char** argv) {
  flagz flagi = read_flags(argc, argv);
  while (optind < argc) {
    open_file(argv, flagi);
    optind++;
  }
  return 0;
}
