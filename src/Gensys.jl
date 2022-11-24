module Gensys

using LinearAlgebra

export gensysdt, gensysct

include("extrafunctions.jl")
include("gensysdt.jl")
include("gensysct.jl")

end



