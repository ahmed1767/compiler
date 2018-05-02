flex -o compiler.c compiler.l
g++ compiler.c -lfl -o compiler.out
./compiler.out wordcount.txt
