#!/bin/bash

# VARIABLES
temp1="temp1.txt"
temp2="temp2.txt"
file_path="./s21_cat.h"

echo "  =START="
echo "TEST 1 cat -b "
cat -b -n "$file_path" > "$temp1"
./s21_cat -b -n "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "TEST 2 cat -e "
cat -e "$file_path" > "$temp1"
./s21_cat -e "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "TEST 3 cat -n "
cat -n "$file_path" > "$temp1"
./s21_cat -n "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "TEST 4 cat -s "
cat -s "$file_path" > "$temp1"
./s21_cat -s "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "TEST 5 cat -t "
cat -t -n "$file_path" > "$temp1"
./s21_cat -t -n "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "TEST 6 cat -v "
cat -v "$file_path" > "$temp1"
./s21_cat -v "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "TEST 7 cat_without flag "
cat "$file_path" > "$temp1"
./s21_cat "$file_path" > "$temp2"
diff -u "$temp1" "$temp2" -s || exit 1

echo "  =END="

# Remove temporary files
rm "$temp1"
rm "$temp2"

# If the script reaches this point, there were no differences
exit 0
