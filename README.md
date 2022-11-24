[![Build Status](https://travis-ci.org/quantecon/Gensys.jl.svg?branch=master)](https://travis-ci.org/quantecon/Gensys.jl)
[![Coverage Status](https://coveralls.io/repos/quantecon/Gensys.jl/badge.svg?branch=master)](https://coveralls.io/r/quantecon/Gensys.jl?branch=master)
# Install
```julia
Pkg.add(url="https://github.com/gavinecon/gensys")
```

# Example
Solve simple 3 equation model with autocorrelated shocks and white noise forecast errors.

F1 = y - (Ey +(1/a)*(Epi - int) + epsy);
F2 = int - (phipi*pi + phiy*y + epsint);
F3 = pi - (beta*Epi + kappa*y + epspi);
F4 = epsint - (rhoint*Lepsint + eint);
F5 = epsy - (rhoy*Lepsy + ey);
F6 = epspi - (rhopi*Lepspi + epi);
F7 = y - LEy - etay;
F8 = pi - LEpi - etapi;


```julia
import Pkg
Pkg.add(url="https://github.com/gavinecon/gensys")
using Gensys

Γ0 = [
1.0000    1.0000         0   -1.0000         0         0   -1.0000   -1.0000
-1.5000    1.0000   -1.5000         0   -1.0000         0         0         0
-0.5000         0    1.0000         0         0   -1.0000   -0.9800         0
     0         0         0         0    1.0000         0         0         0
     0         0         0    1.0000         0         0         0         0
     0         0         0         0         0    1.0000         0         0
1.0000         0         0         0         0         0         0         0
     0         0    1.0000         0         0         0         0         0
]

Γ1 = [
0         0         0         0         0         0         0         0
0         0         0         0         0         0         0         0
0         0         0         0         0         0         0         0
0         0         0         0    0.8000         0         0         0
0         0         0    0.8000         0         0         0         0
0         0         0         0         0    0.8000         0         0
0         0         0         0         0         0         0    1.0000
0         0         0         0         0         0    1.0000         0
]

Ψ = [
0     0     0
0     0     0
0     0     0
0     0     1
1     0     0
0     1     0
0     0     0
0     0     0
]

Π = [
0     0
0     0
0     0
0     0
0     0
0     0
0     1
1     0
]

c = zeros(size(Γ0)[1], 1)

G1, C, impact, qt, a, b, z, eu = Gensys.gensysdt(Γ0, Γ1, c, Ψ, Π)
```
