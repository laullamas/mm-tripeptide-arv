# Dinámica Molecular del Tripéptido ACE-ALA-ARG-VAL-NME

Simulaciones de dinámica molecular (DM) del tripéptido **ARV** (Ala-Arg-Val) solvatado en agua, a **298 K** y **400 K**, en el colectivo NVT.

Trabajo realizado para la asignatura **Modelado Molecular** del Máster Universitario en Bioinformática de la Universidad de Murcia (curso 2025/2026).

**Autora:** Laura Llamas López

---

## Descripción del proyecto

Se llevaron a cabo dos simulaciones NVT de 2 ps (paso de integración 0.5 fs) del tripéptido ACE-ALA-ARG-VAL-NME en disolución acuosa explícita (modelo TIP3P), empleando el campo de fuerzas CHARMM27 y el software GROMACS 2016.4. El objetivo principal es analizar comparativamente el efecto de la temperatura sobre las propiedades estructurales, energéticas y dinámicas del sistema.

Adicionalmente, se incluye un análisis extendido opcional de una simulación de **500 ps a 298 K** con mayor resolución temporal.

### Sistema molecular

| Propiedad | Valor |
|---|---|
| Secuencia | ACE – ALA – ARG – VAL – NME |
| Campo de fuerzas | CHARMM27 (con correcciones CMAP) |
| Modelo de agua | TIP3P |
| Átomos totales | 2636 (62 soluto + 2574 solvente) |
| Moléculas de agua | 858 |
| Contraión | 1 Cl⁻ (neutralización de carga) |
| Caja de simulación | Cúbica, 3.0 nm de lado |
| Colectivo | NVT (v-rescale) |

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

## Análisis realizados

| Análisis | Carpeta | Propiedad estudiada |
|---|---|---|
| Temperatura | `analysis/temperature/` | Evolución temporal de la temperatura instantánea |
| Energía | `analysis/energy/` | Energía cinética y total; verificación del teorema de equipartición |
| Distancias de enlace | `analysis/distance/` | Distancias C=O (ALA-2) y Cα–Cβ (ARG-3) |
| Ángulos de enlace | `analysis/angle/` | Ángulos Cα–C=O y N–Cα–Cβ; distribuciones angulares |
| Ángulos diedros | `analysis/dihedral/` | Ángulos φ/ψ; diagramas de Ramachandran |
| Radio de giro | `analysis/gyrate/` | Compacidad global del tripéptido |
| Puentes de hidrógeno | `analysis/hbonds/` | Número de H-bonds intra e intermoleculares |
| Velocidades | `analysis/velocities/` | Distribución de velocidades y ajuste de Maxwell-Boltzmann |
| **Opcional** | `optional/` | Simulación de 500 ps: Ramachandran, temperatura y velocidades |

---

## Herramientas utilizadas

- **GROMACS 2016.4** — Simulaciones de dinámica molecular
- **CHARMM27 + TIP3P** — Campo de fuerzas y modelo de agua
- **Python 3** con **Jupyter Notebooks** — Análisis y visualización
  - NumPy, Matplotlib, SciPy
- **PyMOL** — Visualización molecular

---

## Datos brutos de GROMACS

La carpeta `entrega_final/` incluye los ficheros generados durante el flujo de trabajo completo de GROMACS: topologías (`.top`, `.itp`), ficheros de parámetros (`.mdp`), estructuras (`.gro`, `.g96`), binarios de ejecución (`.tpr`), energías (`.edr`), puntos de reinicio (`.cpt`) y datos de análisis (`.xvg`, `.dat`, `.ndx`).

Se han excluido del repositorio los ficheros de trayectoria completa (`.trr`, `.xtc`) y los ficheros PDB con la trayectoria del sistema completo con solvente (`cartoon-sys-298.pdb`, `cartoon-sys-400.pdb`), que superan los 400 MB por archivo y exceden el límite permitido por GitHub.

---

## Cómo reproducir el análisis

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/laullamas/mm-tripeptide-arv.git
   cd mm-tripeptide-arv
   ```

2. Instalar las dependencias de Python:
   ```bash
   pip install numpy matplotlib scipy jupyter
   ```

3. Abrir cualquier notebook de análisis:
   ```bash
   jupyter notebook analysis/energy/energy_analysis.ipynb
   ```

---

## Licencia

Este trabajo se ha realizado con fines académicos en el marco del Máster Universitario en Bioinformática de la Universidad de Murcia.
