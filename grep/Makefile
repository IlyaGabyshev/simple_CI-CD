all: s21_grep
CC = gcc -Wall -Wextra -Werror

$(s21_grep ): s21_grep.o
	$(CC) s21_grep.o -o $(s21_grep )

s21_grep.o:
	clang-format -style=Google -i *.c *.h
	$(CC) -c s21_grep.c -o s21_grep.o

clean:
	rm -rf $(s21_grep ) *.o s21_grep *.txt

rebuild:
	$(MAKE) clean
	$(MAKE) all
	
