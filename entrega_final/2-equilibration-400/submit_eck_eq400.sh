#!/bin/bash
#
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno09/modelado_molecular/entrega_final/2-equilibration-400
#SBATCH -J equilibrado-400
#SBATCH --cpus-per-task=1

date
gmx mdrun -deffnm arv-400 -c arv-400.g96 -nt 1
date



