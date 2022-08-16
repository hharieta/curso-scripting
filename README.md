# Scripting en Bash y Python 


> El profesor: Aprendan Linux, les servirá en la vida
 
> \*Me asaltan\*
 
> Yo:


![Kuroneko](assets/kuro.jpg)


```bash
#!/bin/bash
# Author: Gatovsky

if [[ -f asaltante.sh ]]; then
        echo $GATO_PASS | sudo -S mv asaltante.sh /dev/null && echo "done"
else
        echo "pass" && exit 0
fi

```
