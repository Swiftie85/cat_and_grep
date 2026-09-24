#include <getopt.h>
#include <stdio.h>
#include <unistd.h>

typedef struct {
  int b;
  int e;
  int E;
  int n;
  int s;
  int t;
  int T;
  int v;
} Flags;

const struct option long_options[] = {{"number-nonblank", no_argument, 0, 'b'},
                                      {"number", no_argument, 0, 'n'},
                                      {"squeeze-blank", no_argument, 0, 's'},
                                      {"show-nonprinting", no_argument, 0, 'v'},
                                      {0, 0, 0, 0}};

void parse_flags(Flags* flags, int opt) {
  switch (opt) {
    case 'n':
      flags->n = 1;
      break;

    case 'b':
      flags->b = 1;
      break;

    case 'e':
      flags->v = 1;
      flags->E = 1;
      break;

    case 'E':
      flags->E = 1;
      break;

    case 's':
      flags->s = 1;
      break;

    case 't':
      flags->v = 1;
      flags->T = 1;
      break;

    case 'v':
      flags->v = 1;
      break;

    case 'T':
      flags->T = 1;
      break;
  }

  if (flags->b) {
    flags->n = 0;
  }
}

void new_line_logic(int* new_line, int ch) {
  if (ch == '\n') {
    *new_line = 1;
  } else {
    *new_line = 0;
  }
}

void empty_line_logic(int* new_line, int* empty_line, int ch) {
  if (ch == '\n' && *new_line) {
    *empty_line = 1;
  } else {
    *empty_line = 0;
  }
}

void flag_n(int* line_number, int* new_line) {
  if (*new_line) {
    printf("%6d\t", *line_number);
    (*line_number)++;
  }
}

void flag_b(int* line_number, int* new_line, int ch) {
  if (*new_line && ch != '\n') {
    printf("%6d\t", *line_number);
    (*line_number)++;
  }
}

void flag_E(Flags* flags, int* new_line, int ch) {
  if (flags->b && (ch == '\n') && *new_line) {
    printf("%c", '$');
  } else if ((flags->n) && (ch == '\n') && *new_line) {
    printf("%c", '$');
  } else if (ch == '\n') {
    printf("%c", '$');
  }
}

int flag_T(int ch) {
  int tabFound = 0;

  if (ch == '\t') {
    printf("%c%c", '^', 'I');
    tabFound = 1;
  }

  return tabFound;
}

int flag_s(int* new_line, int* empty_line, int ch) {
  int flag = 0;

  if (ch != '\n') {
    flag = 1;
  }

  if (!*new_line) {
    flag = 1;
  }

  if (!*empty_line) {
    flag = 1;
  }

  return flag;
}

int flag_v(int ch) {
  int result = 0;

  if (ch != '\n' && ch != '\t') {
    if (ch >= 128) {
      fputs("M-", stdout);
      ch -= 128;

      if (ch < 32) {
        printf("^%c", ch + 64);
      } else if (ch == 127) {
        fputs("^?", stdout);
      } else {
        putchar(ch);
      }

      result = 1;
    } else if (ch < 32) {
      printf("^%c", ch + 64);
      result = 1;
    } else if (ch == 127) {
      fputs("^?", stdout);
      result = 1;
    }
  }

  return result;
}

void cat(Flags* flags, int* line_number, int* new_line, int* empty_line,
         int ch) {
  int dont_print_str = 0;

  if (flags->s && !flag_s(new_line, empty_line, ch)) {
    dont_print_str = 1;
  }

  if (!dont_print_str) {
    int dont_print_ch = 0;
    if (flags->n) {
      flag_n(line_number, new_line);
    }

    if (flags->b) {
      flag_b(line_number, new_line, ch);
    }

    if (flags->E) {
      flag_E(flags, new_line, ch);
    }

    if (flags->v && flag_v(ch)) {
      dont_print_ch = 1;
    }

    if (!dont_print_ch && flags->T && flag_T(ch)) {
      dont_print_ch = 1;
    }

    if (!dont_print_ch) {
      putchar(ch);
    }

    empty_line_logic(new_line, empty_line, ch);
    new_line_logic(new_line, ch);
  }
}

int file_open(int argc, char* argv[], int first_file, Flags* flags,
              int* line_number, int* new_line, int* empty_line) {
  int status = 0;
  for (int i = first_file; i < argc; i++) {
    FILE* file = fopen(argv[i], "r");

    if (file == NULL) {
      fprintf(stderr, "ERROR\n");
      status = 1;
    } else {
      int ch = 0;

      while ((ch = fgetc(file)) != EOF) {
        cat(flags, line_number, new_line, empty_line, ch);
      }

      fclose(file);
    }
  }
  return status;
}

int main(int argc, char* argv[]) {
  Flags flags = {0};
  int status;
  int opt = 0;
  int line_number = 1;
  int new_line = 1;
  int empty_line = 0;

  while ((opt = getopt_long(argc, argv, "beEnstTv", long_options, NULL)) !=
         -1) {
    parse_flags(&flags, opt);
  }

  status = file_open(argc, argv, optind, &flags, &line_number, &new_line,
                     &empty_line);

  return status;
}
