# Unjamming and emergent nonreciprocity in active ploughing through a compressible viscoelastic fluid

Here we provide the main codes and data used in the work **Active ploughing through a compressible viscoelastic fluid: Unjamming and emergent nonreciprocity** ([arXiv link](https://doi.org/10.48550/arXiv.2109.10438)). These codes are written in FORTRAN90 language and tested in Linux. Commands to generate raw data using the codes were passed using shell scripting ('script_sim', provided with the codes). A few basic analysis codes have also been provided. The folder named 'codes' consists of the simulation codes for (a) a given state-point in the phase diagram, (b) single active particle scenario, (c) two active particle case (front and back), and (d) 1-d nonlinear hydrodynamics for a single active particle.  Inside each of the folders named 'fig_X' (fig_01, fig_02, fig_S01, etc.) there are subfolders for each panel of that figure (XA, XB, etc.). Inside each of them there is a folder named 'data' and a .gnu file. One only needs to run the .gnu files in order to generate the respective figure.
