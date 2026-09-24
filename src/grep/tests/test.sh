#!/bin/bash

echo "Компиляция программы"
gcc -std=c11 -Wall -Wextra -Werror ../s21_grep.c -o s21_grep
echo "Запуск программы"

# ---------- без флагов ----------

# Test 1: ./s21_grep "the" ../tests/test2.txt
result1=$(./s21_grep "the" ../tests/test2.txt > test_result1.txt)
result2=$(grep "the" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 1: PASS"
else
    echo "Test 1: FAIL"
fi

# Test 2: ./s21_grep "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 2: PASS"
else
    echo "Test 2: FAIL"
fi

# Test 3: ./s21_grep "Have" ../tests/test4.txt
result1=$(./s21_grep "Have" ../tests/test4.txt > test_result1.txt)
result2=$(grep "Have" ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 3: PASS"
else
    echo "Test 3: FAIL"
fi

# Test 4: ./s21_grep "have" ../tests/test2.txt
result1=$(./s21_grep "have" ../tests/test2.txt > test_result1.txt)
result2=$(grep "have" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 4: PASS"
else
    echo "Test 4: FAIL"
fi

# Test 5: ./s21_grep "wave" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep "wave" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep "wave" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 5: PASS"
else
    echo "Test 5: FAIL"
fi

# Test 6: ./s21_grep "zzzzqqqq" ../tests/test2.txt
result1=$(./s21_grep "zzzzqqqq" ../tests/test2.txt > test_result1.txt)
result2=$(grep "zzzzqqqq" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 6: PASS"
else
    echo "Test 6: FAIL"
fi

# Test 7: ./s21_grep "a" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep "a" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep "a" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 7: PASS"
else
    echo "Test 7: FAIL"
fi

# Test 8: ./s21_grep "^T" ../tests/test2.txt
result1=$(./s21_grep "^T" ../tests/test2.txt > test_result1.txt)
result2=$(grep "^T" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 8: PASS"
else
    echo "Test 8: FAIL"
fi

# Test 9: ./s21_grep 'e$' ../tests/test2.txt
result1=$(./s21_grep 'e$' ../tests/test2.txt > test_result1.txt)
result2=$(grep 'e$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 9: PASS"
else
    echo "Test 9: FAIL"
fi

# Test 10: ./s21_grep '^$' ../tests/test2.txt
result1=$(./s21_grep '^$' ../tests/test2.txt > test_result1.txt)
result2=$(grep '^$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 10: PASS"
else
    echo "Test 10: FAIL"
fi

# Test 11: ./s21_grep "." ../tests/test2.txt
result1=$(./s21_grep "." ../tests/test2.txt > test_result1.txt)
result2=$(grep "." ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 11: PASS"
else
    echo "Test 11: FAIL"
fi

# Test 12: ./s21_grep "^." ../tests/test4.txt
result1=$(./s21_grep "^." ../tests/test4.txt > test_result1.txt)
result2=$(grep "^." ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 12: PASS"
else
    echo "Test 12: FAIL"
fi

# Test 13: ./s21_grep "th." ../tests/test2.txt
result1=$(./s21_grep "th." ../tests/test2.txt > test_result1.txt)
result2=$(grep "th." ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 13: PASS"
else
    echo "Test 13: FAIL"
fi

# Test 14: ./s21_grep "a.e" ../tests/test4.txt
result1=$(./s21_grep "a.e" ../tests/test4.txt > test_result1.txt)
result2=$(grep "a.e" ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 14: PASS"
else
    echo "Test 14: FAIL"
fi

# Test 15: ./s21_grep '[0-9]' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 15: PASS"
else
    echo "Test 15: FAIL"
fi

# Test 16: ./s21_grep '[A-Z]' ../tests/test2.txt
result1=$(./s21_grep '[A-Z]' ../tests/test2.txt > test_result1.txt)
result2=$(grep '[A-Z]' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 16: PASS"
else
    echo "Test 16: FAIL"
fi

# Test 17: ./s21_grep '[^a-z]' ../tests/test4.txt
result1=$(./s21_grep '[^a-z]' ../tests/test4.txt > test_result1.txt)
result2=$(grep '[^a-z]' ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 17: PASS"
else
    echo "Test 17: FAIL"
fi

# Test 18: ./s21_grep '[[:digit:]]' ../tests/test2.txt
result1=$(./s21_grep '[[:digit:]]' ../tests/test2.txt > test_result1.txt)
result2=$(grep '[[:digit:]]' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 18: PASS"
else
    echo "Test 18: FAIL"
fi

# Test 19: ./s21_grep '[[:upper:]]' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep '[[:upper:]]' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep '[[:upper:]]' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 19: PASS"
else
    echo "Test 19: FAIL"
fi

# Test 20: ./s21_grep '[[:space:]]' ../tests/test4.txt
result1=$(./s21_grep '[[:space:]]' ../tests/test4.txt > test_result1.txt)
result2=$(grep '[[:space:]]' ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 20: PASS"
else
    echo "Test 20: FAIL"
fi

# Test 21: ./s21_grep '[[:punct:]]' ../tests/test2.txt
result1=$(./s21_grep '[[:punct:]]' ../tests/test2.txt > test_result1.txt)
result2=$(grep '[[:punct:]]' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 21: PASS"
else
    echo "Test 21: FAIL"
fi

# Test 22: ./s21_grep "th*e" ../tests/test2.txt
result1=$(./s21_grep "th*e" ../tests/test2.txt > test_result1.txt)
result2=$(grep "th*e" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 22: PASS"
else
    echo "Test 22: FAIL"
fi

# Test 23: ./s21_grep '\.' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep '\.' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep '\.' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 23: PASS"
else
    echo "Test 23: FAIL"
fi

# Test 24: ./s21_grep "," ../tests/test2.txt
result1=$(./s21_grep "," ../tests/test2.txt > test_result1.txt)
result2=$(grep "," ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 24: PASS"
else
    echo "Test 24: FAIL"
fi

# Test 25: ./s21_grep '.$' ../tests/test4.txt
result1=$(./s21_grep '.$' ../tests/test4.txt > test_result1.txt)
result2=$(grep '.$' ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 25: PASS"
else
    echo "Test 25: FAIL"
fi

# Test 26: ./s21_grep 'e.*e' ../tests/test2.txt
result1=$(./s21_grep 'e.*e' ../tests/test2.txt > test_result1.txt)
result2=$(grep 'e.*e' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 26: PASS"
else
    echo "Test 26: FAIL"
fi

# Test 27: ./s21_grep "" ../tests/test2.txt
result1=$(./s21_grep "" ../tests/test2.txt > test_result1.txt)
result2=$(grep "" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 27: PASS"
else
    echo "Test 27: FAIL"
fi

# Test 28: ./s21_grep "the" ../tests/test2.txt ../tests/test2.txt
result1=$(./s21_grep "the" ../tests/test2.txt ../tests/test2.txt > test_result1.txt)
result2=$(grep "the" ../tests/test2.txt ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 28: PASS"
else
    echo "Test 28: FAIL"
fi

# Test 29: result1=$(./s21_grep "the" ../tests/no_such_file.txt ../tests/test2.txt > test_result1.txt 2> /dev/null)
result1=$(./s21_grep "the" ../tests/no_such_file.txt ../tests/test2.txt > test_result1.txt 2> /dev/null)
result2=$(grep "the" ../tests/no_such_file.txt ../tests/test2.txt > test_result2.txt 2> /dev/null)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 29: PASS"
else
    echo "Test 29: FAIL"
fi

# Test 30: ./s21_grep "is" ../tests/test4.txt
result1=$(./s21_grep "is" ../tests/test4.txt > test_result1.txt)
result2=$(grep "is" ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 30: PASS"
else
    echo "Test 30: FAIL"
fi

# ---------- -e ----------

# Test 31: ./s21_grep -e "the" ../tests/test2.txt
result1=$(./s21_grep -e "the" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "the" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 31: PASS"
else
    echo "Test 31: FAIL"
fi

# Test 32: ./s21_grep -e "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -e "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -e "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 32: PASS"
else
    echo "Test 32: FAIL"
fi

# Test 33: ./s21_grep -e "Have" ../tests/test4.txt
result1=$(./s21_grep -e "Have" ../tests/test4.txt > test_result1.txt)
result2=$(grep -e "Have" ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 33: PASS"
else
    echo "Test 33: FAIL"
fi

# Test 34: ./s21_grep -e "the" -e "a" ../tests/test2.txt
result1=$(./s21_grep -e "the" -e "a" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "the" -e "a" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 34: PASS"
else
    echo "Test 34: FAIL"
fi

# Test 35: ./s21_grep -e "the" -e "a" -e "e" ../tests/test2.txt
result1=$(./s21_grep -e "the" -e "a" -e "e" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "the" -e "a" -e "e" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 35: PASS"
else
    echo "Test 35: FAIL"
fi

# Test 36: ./s21_grep -e "^T" -e 'e$' ../tests/test2.txt
result1=$(./s21_grep -e "^T" -e 'e$' ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "^T" -e 'e$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 36: PASS"
else
    echo "Test 36: FAIL"
fi

# Test 37: ./s21_grep -e '[0-9]' -e '[A-Z]' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -e '[0-9]' -e '[A-Z]' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -e '[0-9]' -e '[A-Z]' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 37: PASS"
else
    echo "Test 37: FAIL"
fi

# Test 38: ./s21_grep -e "zzzz" -e "qqqq" ../tests/test2.txt
result1=$(./s21_grep -e "zzzz" -e "qqqq" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "zzzz" -e "qqqq" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 38: PASS"
else
    echo "Test 38: FAIL"
fi

# Test 39: ./s21_grep -e "the" -e "zzzz" ../tests/test2.txt
result1=$(./s21_grep -e "the" -e "zzzz" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "the" -e "zzzz" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 39: PASS"
else
    echo "Test 39: FAIL"
fi

# Test 40: ./s21_grep -e "" ../tests/test2.txt
result1=$(./s21_grep -e "" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 40: PASS"
else
    echo "Test 40: FAIL"
fi

# Test 41: ./s21_grep -e '^$' ../tests/test2.txt
result1=$(./s21_grep -e '^$' ../tests/test2.txt > test_result1.txt)
result2=$(grep -e '^$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 41: PASS"
else
    echo "Test 41: FAIL"
fi

# Test 42: ./s21_grep -e "Have" -e "have" -e "HAVE" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -e "Have" -e "have" -e "HAVE" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -e "Have" -e "have" -e "HAVE" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 42: PASS"
else
    echo "Test 42: FAIL"
fi

# Test 43: ./s21_grep -e "the" ../tests/test2.txt ../tests/test2.txt
result1=$(./s21_grep -e "the" ../tests/test2.txt ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "the" ../tests/test2.txt ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 43: PASS"
else
    echo "Test 43: FAIL"
fi

# Test 44: ./s21_grep -e '\.' -e ',' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -e '\.' -e ',' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -e '\.' -e ',' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 44: PASS"
else
    echo "Test 44: FAIL"
fi

# Test 45: ./s21_grep -e "wave" -e "Have" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -e "wave" -e "Have" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -e "wave" -e "Have" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 45: PASS"
else
    echo "Test 45: FAIL"
fi

# Test 46: ./s21_grep -e "the" -e "he" -e "e" ../tests/test2.txt
result1=$(./s21_grep -e "the" -e "he" -e "e" ../tests/test2.txt > test_result1.txt)
result2=$(grep -e "the" -e "he" -e "e" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 46: PASS"
else
    echo "Test 46: FAIL"
fi

# Test 47: ./s21_grep -e "e" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -e "e" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -e "e" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 47: PASS"
else
    echo "Test 47: FAIL"
fi

# Test 48: result1=$(./s21_grep -e "the" -e "wave" ../tests/no_such_file.txt ../tests/test2.txt > test_result1.txt 2> /dev/null)
result1=$(./s21_grep -e "the" -e "wave" ../tests/no_such_file.txt ../tests/test2.txt > test_result1.txt 2> /dev/null)
result2=$(grep -e "the" -e "wave" ../tests/no_such_file.txt ../tests/test2.txt > test_result2.txt 2> /dev/null)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 48: PASS"
else
    echo "Test 48: FAIL"
fi

# ---------- -n ----------

# Test 49: ./s21_grep -n "Have" ../tests/test2.txt
result1=$(./s21_grep -n "Have" ../tests/test2.txt > test_result1.txt)
result2=$(grep -n "Have" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 49: PASS"
else
    echo "Test 49: FAIL"
fi

# Test 50: ./s21_grep -n "the" ../tests/test2.txt
result1=$(./s21_grep -n "the" ../tests/test2.txt > test_result1.txt)
result2=$(grep -n "the" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 50: PASS"
else
    echo "Test 50: FAIL"
fi

# Test 51: ./s21_grep -n "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -n "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -n "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 51: PASS"
else
    echo "Test 51: FAIL"
fi

# Test 52: ./s21_grep -n "zzzzqqqq" ../tests/test2.txt
result1=$(./s21_grep -n "zzzzqqqq" ../tests/test2.txt > test_result1.txt)
result2=$(grep -n "zzzzqqqq" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 52: PASS"
else
    echo "Test 52: FAIL"
fi

# Test 53: ./s21_grep -n '^$' ../tests/test2.txt
result1=$(./s21_grep -n '^$' ../tests/test2.txt > test_result1.txt)
result2=$(grep -n '^$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 53: PASS"
else
    echo "Test 53: FAIL"
fi

# Test 54: ./s21_grep -n "." ../tests/test4.txt
result1=$(./s21_grep -n "." ../tests/test4.txt > test_result1.txt)
result2=$(grep -n "." ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 54: PASS"
else
    echo "Test 54: FAIL"
fi

# Test 55: ./s21_grep -n 'e$' ../tests/test4.txt
result1=$(./s21_grep -n 'e$' ../tests/test4.txt > test_result1.txt)
result2=$(grep -n 'e$' ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 55: PASS"
else
    echo "Test 55: FAIL"
fi

# Test 56: ./s21_grep -n "have" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -n "have" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -n "have" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 56: PASS"
else
    echo "Test 56: FAIL"
fi

# Test 57: ./s21_grep -n '[0-9]' ../tests/test2.txt
result1=$(./s21_grep -n '[0-9]' ../tests/test2.txt > test_result1.txt)
result2=$(grep -n '[0-9]' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 57: PASS"
else
    echo "Test 57: FAIL"
fi

# Test 58: ./s21_grep -n "a" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -n "a" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -n "a" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 58: PASS"
else
    echo "Test 58: FAIL"
fi

# ---------- -i ----------

# Test 59: ./s21_grep -i "have" ../tests/test2.txt
result1=$(./s21_grep -i "have" ../tests/test2.txt > test_result1.txt)
result2=$(grep -i "have" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 59: PASS"
else
    echo "Test 59: FAIL"
fi

# Test 60: ./s21_grep -i "THE" ../tests/test2.txt
result1=$(./s21_grep -i "THE" ../tests/test2.txt > test_result1.txt)
result2=$(grep -i "THE" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 60: PASS"
else
    echo "Test 60: FAIL"
fi

# Test 61: ./s21_grep -i "HAVE" ../tests/test4.txt
result1=$(./s21_grep -i "HAVE" ../tests/test4.txt > test_result1.txt)
result2=$(grep -i "HAVE" ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 61: PASS"
else
    echo "Test 61: FAIL"
fi

# Test 62: ./s21_grep -i "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -i "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -i "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 62: PASS"
else
    echo "Test 62: FAIL"
fi

# Test 63: ./s21_grep -i "wAvE" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -i "wAvE" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -i "wAvE" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 63: PASS"
else
    echo "Test 63: FAIL"
fi

# Test 64: ./s21_grep -i "zzzzqqqq" ../tests/test2.txt
result1=$(./s21_grep -i "zzzzqqqq" ../tests/test2.txt > test_result1.txt)
result2=$(grep -i "zzzzqqqq" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 64: PASS"
else
    echo "Test 64: FAIL"
fi

# Test 65: ./s21_grep -i '^t' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -i '^t' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -i '^t' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 65: PASS"
else
    echo "Test 65: FAIL"
fi

# Test 66: ./s21_grep -i 'E$' ../tests/test2.txt
result1=$(./s21_grep -i 'E$' ../tests/test2.txt > test_result1.txt)
result2=$(grep -i 'E$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 66: PASS"
else
    echo "Test 66: FAIL"
fi

# Test 67: ./s21_grep -i '[a-c]' ../tests/test4.txt
result1=$(./s21_grep -i '[a-c]' ../tests/test4.txt > test_result1.txt)
result2=$(grep -i '[a-c]' ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 67: PASS"
else
    echo "Test 67: FAIL"
fi

# Test 68: ./s21_grep -i "" ../tests/test2.txt
result1=$(./s21_grep -i "" ../tests/test2.txt > test_result1.txt)
result2=$(grep -i "" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 68: PASS"
else
    echo "Test 68: FAIL"
fi

# ---------- -c ----------

# Test 69: ./s21_grep -c "Have" ../tests/test2.txt
result1=$(./s21_grep -c "Have" ../tests/test2.txt > test_result1.txt)
result2=$(grep -c "Have" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 69: PASS"
else
    echo "Test 69: FAIL"
fi

# Test 70: ./s21_grep -c "the" ../tests/test2.txt
result1=$(./s21_grep -c "the" ../tests/test2.txt > test_result1.txt)
result2=$(grep -c "the" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 70: PASS"
else
    echo "Test 70: FAIL"
fi

# Test 71: ./s21_grep -c "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -c "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -c "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 71: PASS"
else
    echo "Test 71: FAIL"
fi

# Test 72: ./s21_grep -c "zzzzqqqq" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -c "zzzzqqqq" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -c "zzzzqqqq" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 72: PASS"
else
    echo "Test 72: FAIL"
fi

# Test 73: ./s21_grep -c '^$' ../tests/test2.txt
result1=$(./s21_grep -c '^$' ../tests/test2.txt > test_result1.txt)
result2=$(grep -c '^$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 73: PASS"
else
    echo "Test 73: FAIL"
fi

# Test 74: ./s21_grep -c "." ../tests/test4.txt
result1=$(./s21_grep -c "." ../tests/test4.txt > test_result1.txt)
result2=$(grep -c "." ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 74: PASS"
else
    echo "Test 74: FAIL"
fi

# Test 75: ./s21_grep -c "a" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -c "a" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -c "a" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 75: PASS"
else
    echo "Test 75: FAIL"
fi

# Test 76: ./s21_grep -c '[0-9]' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -c '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -c '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 76: PASS"
else
    echo "Test 76: FAIL"
fi

# Test 77: ./s21_grep -c "" ../tests/test2.txt
result1=$(./s21_grep -c "" ../tests/test2.txt > test_result1.txt)
result2=$(grep -c "" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 77: PASS"
else
    echo "Test 77: FAIL"
fi

# Test 78: ./s21_grep -c "the" ../tests/test2.txt ../tests/test2.txt
result1=$(./s21_grep -c "the" ../tests/test2.txt ../tests/test2.txt > test_result1.txt)
result2=$(grep -c "the" ../tests/test2.txt ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 78: PASS"
else
    echo "Test 78: FAIL"
fi

# ---------- -v ----------

# Test 79: ./s21_grep -v "the" ../tests/test2.txt
result1=$(./s21_grep -v "the" ../tests/test2.txt > test_result1.txt)
result2=$(grep -v "the" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 79: PASS"
else
    echo "Test 79: FAIL"
fi

# Test 80: ./s21_grep -v "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -v "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -v "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 80: PASS"
else
    echo "Test 80: FAIL"
fi

# Test 81: ./s21_grep -v "Have" ../tests/test2.txt
result1=$(./s21_grep -v "Have" ../tests/test2.txt > test_result1.txt)
result2=$(grep -v "Have" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 81: PASS"
else
    echo "Test 81: FAIL"
fi

# Test 82: ./s21_grep -v "." ../tests/test2.txt
result1=$(./s21_grep -v "." ../tests/test2.txt > test_result1.txt)
result2=$(grep -v "." ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 82: PASS"
else
    echo "Test 82: FAIL"
fi

# Test 83: ./s21_grep -v "zzzzqqqq" ../tests/test2.txt
result1=$(./s21_grep -v "zzzzqqqq" ../tests/test2.txt > test_result1.txt)
result2=$(grep -v "zzzzqqqq" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 83: PASS"
else
    echo "Test 83: FAIL"
fi

# Test 84: ./s21_grep -v '^T' ../tests/test4.txt
result1=$(./s21_grep -v '^T' ../tests/test4.txt > test_result1.txt)
result2=$(grep -v '^T' ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 84: PASS"
else
    echo "Test 84: FAIL"
fi

# Test 85: ./s21_grep -v '[0-9]' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -v '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -v '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 85: PASS"
else
    echo "Test 85: FAIL"
fi

# Test 86: ./s21_grep -v 'e$' ../tests/test2.txt
result1=$(./s21_grep -v 'e$' ../tests/test2.txt > test_result1.txt)
result2=$(grep -v 'e$' ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 86: PASS"
else
    echo "Test 86: FAIL"
fi

# Test 87: ./s21_grep -v "" ../tests/test2.txt
result1=$(./s21_grep -v "" ../tests/test2.txt > test_result1.txt)
result2=$(grep -v "" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 87: PASS"
else
    echo "Test 87: FAIL"
fi

# Test 88: ./s21_grep -v "a" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -v "a" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -v "a" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 88: PASS"
else
    echo "Test 88: FAIL"
fi

# ---------- -l ----------

# Test 89: ./s21_grep -l "Have" ../tests/test2.txt
result1=$(./s21_grep -l "Have" ../tests/test2.txt > test_result1.txt)
result2=$(grep -l "Have" ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 89: PASS"
else
    echo "Test 89: FAIL"
fi

# Test 90: ./s21_grep -l "the" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -l "the" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -l "the" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 90: PASS"
else
    echo "Test 90: FAIL"
fi

# Test 91: ./s21_grep -l "zzzzqqqq" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -l "zzzzqqqq" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -l "zzzzqqqq" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 91: PASS"
else
    echo "Test 91: FAIL"
fi

# Test 92: ./s21_grep -l "Have" ../tests/test4.txt ../tests/test2.txt
result1=$(./s21_grep -l "Have" ../tests/test4.txt ../tests/test2.txt > test_result1.txt)
result2=$(grep -l "Have" ../tests/test4.txt ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 92: PASS"
else
    echo "Test 92: FAIL"
fi

# Test 93: ./s21_grep -l "wave" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -l "wave" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -l "wave" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 93: PASS"
else
    echo "Test 93: FAIL"
fi

# Test 94: ./s21_grep -l "." ../tests/test2.txt
result1=$(./s21_grep -l "." ../tests/test2.txt > test_result1.txt)
result2=$(grep -l "." ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 94: PASS"
else
    echo "Test 94: FAIL"
fi

# Test 95: ./s21_grep -l '[0-9]' ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -l '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -l '[0-9]' ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 95: PASS"
else
    echo "Test 95: FAIL"
fi

# Test 96: ./s21_grep -l "" ../tests/test2.txt ../tests/test4.txt
result1=$(./s21_grep -l "" ../tests/test2.txt ../tests/test4.txt > test_result1.txt)
result2=$(grep -l "" ../tests/test2.txt ../tests/test4.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 96: PASS"
else
    echo "Test 96: FAIL"
fi

# Test 97: ./s21_grep -l "the" ../tests/test2.txt ../tests/test2.txt
result1=$(./s21_grep -l "the" ../tests/test2.txt ../tests/test2.txt > test_result1.txt)
result2=$(grep -l "the" ../tests/test2.txt ../tests/test2.txt > test_result2.txt)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 97: PASS"
else
    echo "Test 97: FAIL"
fi

# Test 98: result1=$(./s21_grep -l "Have" ../tests/no_such_file.txt ../tests/test2.txt > test_result1.txt 2> /dev/null)
result1=$(./s21_grep -l "Have" ../tests/no_such_file.txt ../tests/test2.txt > test_result1.txt 2> /dev/null)
result2=$(grep -l "Have" ../tests/no_such_file.txt ../tests/test2.txt > test_result2.txt 2> /dev/null)
if diff test_result1.txt test_result2.txt > /dev/null; then
    echo "Test 98: PASS"
else
    echo "Test 98: FAIL"
fi

