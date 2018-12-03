using Test
using DelimitedFiles

include("../src/opt_block_length.jl")

X = readdlm("opt_block_length.in", ',')
correct = readdlm("opt_block_length.out", ',')
out = opt_block_length(X)
@test all(isapprox.(correct, out, atol=0.000001))
