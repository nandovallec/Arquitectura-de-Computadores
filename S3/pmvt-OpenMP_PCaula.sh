#!/bin/bash
export OMP_DYNAMIC="false"
export OMP_SCHEDULE="static"
./pmtv-OpenMP 21504
export OMP_SCHEDULE="static, 1"
./pmtv-OpenMP 21504
export OMP_SCHEDULE="static, 64"
./pmtv-OpenMP 21504

export OMP_SCHEDULE="dynamic"
./pmtv-OpenMP 21504
export OMP_SCHEDULE="dynamic, 1"
./pmtv-OpenMP 21504
export OMP_SCHEDULE="dynamic, 64"
./pmtv-OpenMP 21504

export OMP_SCHEDULE="guided"
./pmtv-OpenMP 21504
export OMP_SCHEDULE="guided, 1"
./pmtv-OpenMP 21504
export OMP_SCHEDULE="guided, 64"
./pmtv-OpenMP 21504

