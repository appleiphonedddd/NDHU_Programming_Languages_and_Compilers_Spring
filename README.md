# NDHU_Programming_Languages_and_Compilers_Spring

`NDHU_Programming_Languages_and_Compilers_Spring` project belongs to the Digital Learning Technology at National Dong Hwa University. The purpose of this project is to help you understand the structure of complier and programming language

## Contents

- [Getting Started](#Getting-Started)
  - [Requirements](#Requirements)
  - [Installation](#Installation)
- [Directory Structure](#Directory-Structure)
- [Deployment](#Deployment)
- [Frameworks Used](#Frameworks-Used)
- [Author](#Author)

### Getting Started

###### Requirements
1. Ubuntu 22.04
2. Latex 3.14

###### **Installation**

1. Install Latex, flex and bison in Ubuntu

```sh
chmod +x Building.sh
sudo ./Building.sh
```

### Directory Structure

```
filetree 
.
├── Building.sh
├── LICENSE
├── Programming_Assignment
│   ├── Assignment1
│   │   ├── Makefile
│   │   ├── Programming Assignment #1.pdf
│   │   ├── report.pdf
│   │   ├── t2c.c
│   │   ├── t2c.h
│   │   ├── test1.t
│   │   ├── test2.t
│   │   ├── test3.t
│   │   ├── test4.t
│   │   ├── test5.t
│   │   ├── test7.t
│   │   ├── test.t
│   │   ├── t_lex.l
│   │   └── t_parse.y
│   └── Assignment2
│       ├── Compiler_Track
│       │   ├── Makefile
│       │   ├── t2c.c
│       │   ├── t2c.h
│       │   ├── t2c_tree.c
│       │   ├── t2c_tree.h
│       │   ├── test1.t
│       │   ├── test2.t
│       │   ├── test3.t
│       │   ├── test.t
│       │   ├── t_lex.l
│       │   └── t_parse.y
│       ├── PL_Track
│       │   ├── Exercise1
│       │   │   ├── FamilyRelations.java
│       │   │   └── family_relations.pl
│       │   ├── Exercise2
│       │   │   ├── StudentPayment.R
│       │   │   └── Students_not_paid.R
│       │   └── Programming Assignment #2.pdf
│       └── t2cHW2.zip
├── Quiz
│   ├── Final.pdf
│   ├── Quiz #1.pdf
│   ├── Quiz #2.pdf
│   ├── Quiz #3.pdf
│   ├── Quiz #4.pdf
│   ├── Quiz #5.pdf
│   ├── Quiz #6.pdf
│   ├── Quiz #7.pdf
│   ├── Quiz #8.pdf
│   └── Quiz #9.pdf
└── README.md
```

### Deployment

1. Compile it by Makefile

```sh
make
```

2. Build parse and run

```sh
./parse test.t
```

2. clear compiled object files

```sh
make clean
```

### Frameworks Used

- [Latex](https://www.latex-project.org/)

- [Bison](https://www.gnu.org/software/bison/)

- [Flex](https://manpages.ubuntu.com/manpages/focal/man1/flex.1.html)

### Author

611221201@gms.ndhu.edu.tw

Name:Egor Lee
