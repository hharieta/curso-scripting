#!/bin/bash
# Author: Gatovsky
# Redefinir función sleep de bash


echo "======= sleep de bash ======="
for i in Hola Mundo Bash;
do
    sleep 1
    echo $i
done

echo "===== redefinición de sleep bash ======"
function sleep { python3 -c "
import time
time.sleep($1)
";
}

for i in Hola Mundo Bash; do
    sleep 1
    echo $i
done

