# Dinámica Molecular del Tripéptido ACE-ALA-ARG-VAL-NME

Simulaciones de dinámica molecular (DM) del tripéptido **ARV** (Ala-Arg-Val) solvatado en agua, a **298 K** y **400 K**, en el colectivo NVT.

Trabajo realizado para la asignatura **Modelado Molecular** del Máster Universitario en Bioinformática de la Universidad de Murcia (curso 2025/2026).

**Autora:** Laura Llamas López

---

## Estructura del repositorio

```
mm-tripeptide-arv/
│
├── README.md
├── informe_modelado_molecular.pdf      # Informe completo del trabajo
│
├── entrega_final/                      # Ficheros brutos del flujo de trabajo GROMACS
│   ├── 1-build/                        # Construcción del sistema (topología, solvatación)
│   ├── 2-equilibration-298/            # Equilibración NVT a 298 K
│   ├── 2-equilibration-400/            # Equilibración NVT a 400 K
│   ├── 3-run-298/                      # Simulación de producción a 298 K
│   ├── 3-run-400/                      # Simulación de producción a 400 K
│   ├── 3-run-500ps/                    # Simulación extendida de 500 ps a 298 K
│   ├── 4-analysis-298/                 # Datos de análisis extraídos a 298 K
│   ├── 4-analysis-400/                 # Datos de análisis extraídos a 400 K
│   └── 4-analysis-500ps/               # Datos de análisis de la simulación extendida
│
├── analysis/                           # Análisis de las simulaciones a 298 K y 400 K
│   ├── angle/                          # Ángulos de enlace (Cα–C=O, N–Cα–Cβ)
│   ├── dihedral/                       # Ángulos diedros φ/ψ y diagramas de Ramachandran
│   ├── distance/                       # Distancias de enlace (C=O, Cα–Cβ)
│   ├── energy/                         # Energía cinética y total
│   ├── gyrate/                         # Radio de giro
│   ├── hbonds/                         # Puentes de hidrógeno (intra e intermoleculares)
│   ├── temperature/                    # Temperatura instantánea
│   └── velocities/                     # Velocidades atómicas y distribución de Maxwell-Boltzmann
│
└── optional/                           # Análisis extendido: simulación de 500 ps a 298 K
    ├── optional_analysis.ipynb
    ├── *.xvg / *.dat                   # Datos de la simulación extendida
    └── *.png                           # Figuras generadas
```

Cada subcarpeta de `analysis/` contiene:
- **Un notebook Jupyter** (`.ipynb`) con el código Python para el análisis y la generación de figuras.
- **Ficheros de datos** (`.xvg`, `.dat`) extraídos de las trayectorias de GROMACS.
- **Figuras** (`.png`) generadas por los notebooks.

---

## Datos brutos de GROMACS

La carpeta `entrega_final/` incluye los ficheros generados durante el flujo de trabajo completo de GROMACS: topologías (`.top`, `.itp`), ficheros de parámetros (`.mdp`), estructuras (`.gro`, `.g96`), binarios de ejecución (`.tpr`), energías (`.edr`), puntos de reinicio (`.cpt`) y datos de análisis (`.xvg`, `.dat`, `.ndx`).

Se han excluido del repositorio los ficheros de trayectoria completa (`.trr`, `.xtc`) y los ficheros PDB del sistema con solvente (`cartoon-sys-*.pdb`, ~400 MB cada uno), ya que superan el límite de tamaño de archivo permitido por GitHub.

---

## Licencia

Este trabajo se ha realizado con fines académicos en el marco del Máster Universitario en Bioinformática de la Universidad de Murcia.
