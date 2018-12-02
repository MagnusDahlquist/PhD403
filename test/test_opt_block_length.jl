using Test
using DelimitedFiles

include("../src/opt_block_length.jl")

X = readdlm("test/in_opt_block_length.csv", ',')
correct = readdlm("test/out_opt_block_length.csv", ',')
out = opt_block_length(X)
@test all(isapprox.(correct, out, atol=0.000001))
