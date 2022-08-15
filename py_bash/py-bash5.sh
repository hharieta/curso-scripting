#!/bin/bash
# Author: Gatovsky
# MAYUS con python y bash


function upper { python3 -c "
print('$1'.upper())
";
}

texto=$( upper "HolA GaTo" )
echo -e "\n============= Upper Python =============\n"
echo "$texto"

echo -e "\n============= Upper Bash =============\n"
texto2="HolA GatO"
texto2=${texto2^^} # minus: ${texto,,}
echo "$texto2"
