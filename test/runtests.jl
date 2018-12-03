tests = ["opt_block_length.jl"]

println("Running tests:")

for t in tests
    println(" * $(t) ...")
    include(t)
end
