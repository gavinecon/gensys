module Gensys
using LinearAlgebra: LinearAlgebra as LinAlg
include("gensysdt.jl")
include("gensysct.jl")
export gensysdt,
gensysct
end
