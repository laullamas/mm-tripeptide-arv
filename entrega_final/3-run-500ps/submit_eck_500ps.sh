#!/bin/bash
#
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno09/modelado_molecular/entrega_final/3-run-500ps
#SBATCH -J run-500ps
#SBATCH --cpus-per-task=1

date
gmx mdrun -deffnm arv-500ps -c arv-500ps.g96 -nt 1
date



