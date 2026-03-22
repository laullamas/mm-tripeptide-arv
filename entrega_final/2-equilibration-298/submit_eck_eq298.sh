#!/bin/bash
#
#SBATCH -p eck-q
#SBATCH --chdir=/home/alumno09/modelado_molecular/entrega_final/2-equilibration-298
#SBATCH -J equilibrado-298
#SBATCH --cpus-per-task=1

date
gmx mdrun -deffnm arv-298 -c arv-298.g96 -nt 1
date



