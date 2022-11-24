[![Build Status](https://travis-ci.org/quantecon/Gensys.jl.svg?branch=master)](https://travis-ci.org/quantecon/Gensys.jl)
[![Coverage Status](https://coveralls.io/repos/quantecon/Gensys.jl/badge.svg?branch=master)](https://coveralls.io/r/quantecon/Gensys.jl?branch=master)
# Install
```julia
Pkg.add(url="https://github.com/gavinecon/gensys")
```

# Example
Solve

$$
\begin{pmatrix}
a*y(t) = a*\mathbb{E}[y(t+1)|I(t)] - i_t + \mathbb{E}[\pi (t+1) | I(t)] + e^{\pi}(t) \\
i(t) = \phi_{\pi} \pi(t) + \phi_y y(t) + e^{i}(t) \\
\pi (t) = \beta \mathbb{E}[\pi (t+1)|I(t)] + \kappa y(t) + e^{y}(t)\\
e^{y}(t) = \rho_\pi e^{y}(t-1) + \varepsilon^{y} (t) \\
e^{i}_t = \rho_\pi e^{i}_{t-1} + \varepsilon^{i} (t) \\
e^{\pi}_t = \rho_\pi e^{\pi}_{t-1} + \varepsilon^{\pi} (t) \\
y (t) - \mathbb{E}[y_t|I(t-1)] = \eta^{y} (t) \\
\pi (t) - \mathbb{E}[\pi (t)|(I(t-1)] = \eta^{\pi} (t)
\end{pmatrix}
$$

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
