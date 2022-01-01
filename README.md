# Flex Bison Arithmetic Calculator 

---

**Flex** - Flex is a tool that helps break the input into *tokens*.

**Bison** - Bison is a tool that helps build the parser using the *tokens*  from the flex program

A C- program that takes  an arithmetic expression and returns the calculated value using a parser.

Flex file will contain regular expressions that match the supported arithmetic operations (listed below) and the bison file will contain the grammar.

Operations supported on calculator 

* Addition
* Subtraction
* Multiplication
* Division
* Logical left shift
* Arithmetic left shift
* Logical right shift
* Arithmetic right shift
* Exponents (eg. 2^3 = 8)

#### Windows

##### Initial Environment Setup 

```bash 
git clone https://github.com/Anurag-Nagpal/Flex-Bison-Arithmetic-Calculator.git
cd Flex-Bison-Arithmetic-Calculator
```

##### Build 

```bash
make calc 
```

The make file contains the following commands 

```bash
lexer.l parser.y
bison -d parser.y
flex lexer.l
gcc main.c lex.yy.c parser.tab.c -w
./a
```

##### Output 

![Output Image](https://github.com/Anurag-Nagpal/Flex-Bison-Arithmetic-Calculator/blob/master/output.png)
