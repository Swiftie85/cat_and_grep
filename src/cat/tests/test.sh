#!/bin/bash

echo "Компиляция программы"
gcc -std=c11 -Wall -Wextra -Werror ../s21_cat.c -o s21_cat
echo "Запуск программы"

result1=$(./s21_cat -b ../tests/test2.txt > test_result1.txt)
result2=$(cat -b ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "PASS"
else
    echo "FAIL"
fi

result1=$(./s21_cat -bnt ../tests/test2.txt > test_result1.txt)
result2=$(cat -bnt ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "PASS"
else
    echo "FAIL"
fi

result1=$(./s21_cat -enst ../tests/test2.txt > test_result1.txt)
result2=$(cat -enst ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "PASS"
else
    echo "FAIL"
fi

result1=$(./s21_cat -bn ../tests/test2.txt > test_result1.txt)
result2=$(cat -nb ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "PASS"
else
    echo "FAIL"
fi

result1=$(./s21_cat -net ../tests/test2.txt > test_result1.txt)
result2=$(cat -net ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "PASS"
else
    echo "FAIL"
fi
