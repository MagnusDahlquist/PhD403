tests = ["opt_block_length.jl",
         "data processing.jl",
         "maximum likelihood.jl",
         "bootstrap.jl",
         "gmm.jl"]

println("Running tests:")

for t in tests
        println(" * $(t) ...")
        include(t)
end
