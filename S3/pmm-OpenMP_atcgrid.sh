#!/bin/bash


for ((N=1;N<13;N=N+1))
do
	./pmm-OpenMP 1000 $N
done


