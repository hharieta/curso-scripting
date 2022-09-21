#!/bin/bash
#
# Author: Gatovsky

function choro { python3 -c "
if not '$1' :
	print('te gustaría ir a mi casa, prodría enseñarte el Python')
else:
	pass
";
}

choro "" 
