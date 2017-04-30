#include "file.h"

int rand_gen(int limit) {
  srand((unsigned) time(0));
  int rand_num = std::rand();
  return rand_num % limit;
}
