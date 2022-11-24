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
a*y_t = a*\mathbb{E}_t[y_{t+1}] - i_t + \mathbb{E}_t[\pi_{t+1}] + e^{\pi}_t \\
i_t = \phi_{\pi} \pi + \phi_y y_t + e^{i}_t \\
\pi_t = \beta \mathbb{E}_t[\pi_{t+1}] + \kappa y_t + e^{y}_t \\
e^{y}_t = \rho_\pi e^{y}_{t-1} + \varepsilon_t^{y} \\
e^{i}_t = \rho_\pi e^{i}_{t-1} + \varepsilon_t^{i} \\
e^{\pi}_t = \rho_\pi e^{\pi}_{t-1} + \varepsilon_t^{\pi} \\
y_t - \mathbb{E}_{t-1}[y_t] = \eta_t^{y} \\
\pi_t - \mathbb{E}_{t-1}[\pi_t] = \eta_t^{\pi}
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
