#!/bin/bash


for ((N=1;N<5;N=N+1))
do
	./pmm-OpenMP 1000 $N
done


