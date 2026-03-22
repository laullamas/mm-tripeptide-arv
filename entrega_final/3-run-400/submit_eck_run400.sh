#!/bin/bash
#
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno09/modelado_molecular/entrega_final/3-run-400
#SBATCH -J run-400
#SBATCH --cpus-per-task=1

date
gmx mdrun -deffnm arv-run-400 -c arv-run-400.g96 -nt 1
date



