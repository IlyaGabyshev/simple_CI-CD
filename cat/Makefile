all: s21_cat 
CC = gcc -Wall -Wextra -Werror

$(s21_cat ): s21_cat.o
	$(CC) s21_cat.o -o $(s21_cat )

s21_cat.o:
	clang-format -style=Google -i *.c *.h
	$(CC) -c s21_cat.c -o s21_cat.o

clean:
	rm -rf $(s21_cat ) *.o s21_cat

rebuild:
	$(MAKE) clean
	$(MAKE) all
