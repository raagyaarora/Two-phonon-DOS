This repository contains code for calculating the one-phonon and two-phonon density of states (DOS) in order to explore the possibility of second-order Raman scattering. 
The code utilizes experimental lattice constants to perform these computations. 
This was inspired by the work detailed in the paper: "Temperature-dependent Raman study of CeFeAsO₀.₉F₀.₁ Superconductor: Crystal field excitations, phonons and their coupling."

Overview
Understanding the density of states is crucial for exploring phonon interactions and Raman scattering phenomena. This code is designed to compute:

**One-phonon DOS:**

D(ω)=∑iδ(ω−ωi)

**Two-phonon DOS: **

D(ω)=∑i,jδ(ω−ωi+ωj)

**Features**

Calculates one-phonon and two-phonon density of states using experimental lattice constants.
Provides visualizations of the DOS distributions for analysis.
Easily adaptable to other materials by changing input parameters.
