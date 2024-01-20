# VARIABLES
test_grep_sh=test_grep.sh;
s21_grep_c=s21_grep.c;
s21_grep_h=s21_grep.h;
makefile=Makefile;
empty=empty_file;


# Create temporary files
temp1=$(mktemp)
temp2=$(mktemp)
temp3=$(mktemp)
temp4=$(mktemp)
temp5=$(mktemp)
temp6=$(mktemp)
temp7=$(mktemp)
temp8=$(mktemp)
# SOURCE
echo "                      START!"
echo "----------------------TEST 1 without_flag -file-----------------"
grep int "$s21_grep_h"  > "$temp1"
./s21_grep int "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 2 grep -e -file----------------------"
grep -e int "$s21_grep_h"  > "$temp1"
./s21_grep -e int "$s21_grep_h"  > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 3 grep -i -file----------------------"
grep -i int "$s21_grep_c" > "$temp1"
./s21_grep -i int "$s21_grep_c" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 4 grep -v -file----------------------"
grep -v int "$s21_grep_c" > "$temp1"
./s21_grep -v int "$s21_grep_c" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 5 grep -c -file----------------------"
grep -c int "$s21_grep_c" > "$temp1"
./s21_grep -c int "$s21_grep_c" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 6 grep -l -file----------------------"
grep -l int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -l int "$s21_grep_c" "$s21_grep_h"  > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 7 grep -n -file----------------------"
grep -n int "$s21_grep_c" > "$temp1"
./s21_grep -n int "$s21_grep_c" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 8 grep -h -file----------------------"
grep -h int "$s21_grep_c"  > "$temp1"
./s21_grep -h int "$s21_grep_c"  > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 9 grep -s -file----------------------"
grep -s int "$s21_grep_c" "$test_grep_sh_XXX" > "$temp3"
./s21_grep -s int "$s21_grep_c" "$test_grep_sh_XXX" > "$temp4"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 10 without_flag -file -file----------"
grep int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 11 -e -file -file-----------------"
grep -e int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -e int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 12 -i -file -file-----------------"
grep -i int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -i int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 13 -v -file -file-----------------"
grep -v int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -v int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 14 -c -file -file-----------------"
grep -c int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -c int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 15 -l -file -file-----------------"
grep -l int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -l int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 16 -s -file -file-----------------"
grep -n int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -n int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 17 -s -file -file-----------------"
grep -s int "$s21_grep_c" "$s21_grep_h"  > "$temp3"
./s21_grep -s int "$s21_grep_c" "$s21_grep_h" > "$temp4"
diff "$temp1" "$temp2" -s -q
echo "----------------------TEST 18 -h -file -file-----------------"
grep -h int "$s21_grep_c" "$s21_grep_h"  > "$temp1"
./s21_grep -h int "$s21_grep_c" "$s21_grep_h" > "$temp2"
diff "$temp1" "$temp2" -s -q


echo "=============================EMPTY=========================="
echo "----------------------TEST 19 without_flag -file -empty_file-------"
grep int  "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 20 -e -file -empty_file-----------------"
grep -e int "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep -e int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 21 -i -file -empty_file-----------------"
grep -i int "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep -i int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 22 -v -file -empty_file-----------------"
grep -v int "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep -v int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 23 -c -file -empty_file-----------------"
grep -c int "$s21_grep_c" "$empty"  > "$temp7"
./s21_grep -c int "$s21_grep_c" "$empty" > "$temp8"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 24 -l -file -empty_file-----------------"
grep -l int "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep -l int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 25 -s -file -empty_file-----------------"
grep -n int "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep -n int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

echo "----------------------TEST 26 -s -file -empty_file-----------------"
grep -s int "$s21_grep_c" "$empty"  > "$temp3"
./s21_grep -s int "$s21_grep_c" "$empty" > "$temp4"
diff "$temp1" "$temp2" -s -q
echo "----------------------TEST 27  -h -file -empty_file-----------------"
grep -h int "$s21_grep_c" "$empty"  > "$temp1"
./s21_grep -h int "$s21_grep_c" "$empty" > "$temp2"
diff "$temp1" "$temp2" -s -q

#echo "----------------------TEST 28  -e -file -no_such_file!-----------------"
#grep -e int "$s21_grep_c1" "$empty"  > "$temp1"
#./s21_grep -e int "$s21_grep_c1" "$empty" > "$temp2"
#diff "$temp1" "$temp2" -s -q
#ВНИМАНИЕ! вывод эдентичен но differ!


if [ $? -eq 0 ]; then
  echo "Test passed: No differences found."
else
  echo "Test failed: Differences found."
  exit 1
fi

echo "=END="
#"e:ivclnsh"
# Remove temporary files
rm "$temp1"
rm "$temp2"
rm "$temp3"
rm "$temp4"
rm "$temp5"
rm "$temp6"
rm "$temp7"
rm "$temp8"
