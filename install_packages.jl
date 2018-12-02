using Pkg

for pkg in readlines("REQUIRE")[2:end]
    Pkg.add(pkg)
end
