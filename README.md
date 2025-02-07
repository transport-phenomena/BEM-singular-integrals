# A module to calculate singular integrals arising in BEM

Singular integration for Laplace and Stokes kernels
for BEM using linear interpolation of function and constant interpolation
of flux using triangular or quadrilateral boundary elements

Module provides 4 subroutines calculating singular integrals for boundary element

Needed  : - coordinates of element vertices
          - source point location (vertex or center of element)

Module is free to use, provided that the following publication is cited:

Ravnik, Jure. “Analytical Expressions for Singular Integrals Arising from the 3D Laplace and Stokes Kernels When Using Constant or Linear Triangular and Quadrilateral Boundary Elements.” Engineering Analysis with Boundary Elements 154 (September 2023): 47–53. https://doi.org/10.1016/j.enganabound.2023.02.057.
