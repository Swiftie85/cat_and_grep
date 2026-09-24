#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  char** patterns;
  int pattern_count;
  regex_t* regs;
} Flags;

int add_pattern(Flags* flags, char* pattern) {
  int status = 0;
  char** tmp =
      realloc(flags->patterns, sizeof(char*) * (flags->pattern_count + 1));

  if (tmp == NULL) {
    status = 1;
  } else {
    flags->patterns = tmp;
    flags->patterns[flags->pattern_count] = pattern;
    flags->pattern_count++;
  }
  return status;
}

int parse_flags(Flags* flags, int opt) {
  int status = 0;

  switch (opt) {
    case 'e':
      flags->e = 1;
      status = add_pattern(flags, optarg);
      break;

    case 'i':
      flags->i = 1;
      break;

    case 'v':
      flags->v = 1;
      break;

    case 'c':
      flags->c = 1;
      break;

    case 'l':
      flags->l = 1;
      break;

    case 'n':
      flags->n = 1;
      break;
  }
  return status;
}

void free_regs(Flags* flags, int count) {
  for (int k = 0; k < count; k++) {
    if (flags->patterns[k][0] != '\0') {
      regfree(&flags->regs[k]);
    }
  }
  free(flags->regs);
  flags->regs = NULL;
}

int compile_patterns(Flags* flags) {
  int cflags = REG_EXTENDED;
  int status = 0;
  int k = 0;

  if (flags->i) {
    cflags |= REG_ICASE;
  }
  flags->regs = calloc(flags->pattern_count, sizeof(regex_t));
  if (flags->regs == NULL) {
    status = 1;
  }
  while (status == 0 && k < flags->pattern_count) {
    if (flags->patterns[k][0] != '\0' &&
        regcomp(&flags->regs[k], flags->patterns[k], cflags) != 0) {
      fprintf(stderr, "ERROR: invalid pattern\n");
      status = 1;
    } else {
      k++;
    }
  }
  if (status != 0) {
    free_regs(flags, k);
  }
  return status;
}

int match_any(Flags* flags, const char* line) {
  int matched = 0;
  int k = 0;

  while (!matched && k < flags->pattern_count) {
    if (flags->patterns[k][0] == '\0') {
      matched = 1;
    } else {
      matched = regexec(&flags->regs[k], line, 0, NULL, 0) == 0;
    }
    k++;
  }
  return matched;
}

void print_match(Flags* flags, char* file_name, int show_name, int line_number,
                 char* line) {
  if (show_name) {
    printf("%s:", file_name);
  }
  if (flags->n) {
    printf("%d:", line_number);
  }
  printf("%s\n", line);
}

void print_count(Flags* flags, char* file_name, int show_name, int count) {
  if (flags->c && show_name) {
    printf("%s:%d\n", file_name, count);
  } else if (flags->c) {
    printf("%d\n", count);
  }
}

void handle_line(Flags* flags, char* file_name, int show_name, int line_number,
                 char* line, int matched, int* matches, int* printed_name) {
  int should_show = matched != flags->v;

  if (should_show) {
    (*matches)++;
  }
  if (should_show && flags->l) {
    if (!(*printed_name)) {
      printf("%s\n", file_name);
      *printed_name = 1;
    }
  } else if (should_show && !flags->c && !flags->l) {
    print_match(flags, file_name, show_name, line_number, line);
  }
}

void print_lines(FILE* file, Flags* flags, char* file_name, int show_name,
                 int* matches) {
  size_t len = 0;
  ssize_t read_len = 0;
  int line_number = 0;
  int printed_name = 0;
  char* line = NULL;

  while ((read_len = getline(&line, &len, file)) != -1) {
    if (read_len > 0 && line[read_len - 1] == '\n') {
      line[read_len - 1] = '\0';
    }
    int matched = match_any(flags, line);
    line_number++;
    handle_line(flags, file_name, show_name, line_number, line, matched,
                matches, &printed_name);
  }

  if (!flags->l) {
    print_count(flags, file_name, show_name, *matches);
  }
  free(line);
}

int search_files(int argc, char* argv[], Flags* flags, int* any_match) {
  int had_error = 0;
  int show_name = (argc - optind) > 1;

  for (int i = optind; i < argc; i++) {
    int matches = 0;
    FILE* file = fopen(argv[i], "r");
    if (file == NULL) {
      fprintf(stderr, "ERROR\n");
      had_error = 1;
    } else {
      print_lines(file, flags, argv[i], show_name, &matches);
      *any_match = *any_match || matches > 0;
      fclose(file);
    }
  }
  return had_error;
}

int file_open(int argc, char* argv[], Flags* flags) {
  int opt = 0;
  int had_error = 0;
  int any_match = 0;

  while ((opt = getopt(argc, argv, "e:ivcln")) != -1) {
    had_error = parse_flags(flags, opt) || had_error;
  }

  if (!flags->e && optind >= argc) {
    fprintf(stderr, "ERROR\n");
    had_error = 1;
  }
  if (!had_error && !flags->e) {
    had_error = add_pattern(flags, argv[optind++]);
  }
  if (!had_error) {
    had_error = compile_patterns(flags);
  }
  if (!had_error) {
    had_error = search_files(argc, argv, flags, &any_match);
    free_regs(flags, flags->pattern_count);
  }
  free(flags->patterns);

  int result;
  if (had_error) {
    result = 2;
  } else if (any_match) {
    result = 0;
  } else {
    result = 1;
  }
  return result;
}

int main(int argc, char* argv[]) {
  Flags flags = {0};

  int status = file_open(argc, argv, &flags);

  return status;
}
