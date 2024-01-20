#!/bin/bash

# Копирование  s21_cat
cd ../cat/
scp s21_cat il@10.0.0.3:/usr/local/bin/

# Проверка s21_cat
if [ $? -eq 0 ]; then
  echo "File s21_cat copied successfully"
else
  echo "Error copying s21_cat"
  exit 1
fi

# Копирование s21_grep
cd ../grep/
scp s21_grep il@10.0.0.3:/usr/local/bin/

# Проверка s21_grep
if [ $? -eq 0 ]; then
  echo "File s21_grep copied successfully"
  exit 0
else
  echo "Error copying s21_grep"
  exit 1
fi
