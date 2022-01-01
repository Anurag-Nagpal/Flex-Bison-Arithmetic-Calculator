#include <stdio.h>
#include "parser.tab.h"

int main()
{
  printf("~~~~~OPERATION~~~~~\n");
  printf("Addition: +\n");
  printf("Subtraction: -\n");
  printf("Multiplication: *\n");
  printf("Division: /\n");
  printf("Arithematic Left Shift: l\n");
  printf("Arithematic Right Shift: r\n");
  printf("Logical Left Shift: L\n");
  printf("Logical Right Shift: R\n");
  printf("Exponential: ^\n");
  printf("~~~~~~~~~~~~~~~~~~~~~~~~\n");

  yyparse();
  return 0;
}