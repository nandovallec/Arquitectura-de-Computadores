#!/bin/csh -vx
echo "" > bench.dat
@ i = 1
while ( $i < 800000 )
./daxpy $i >> bench.dat
@ i += 3000
end
