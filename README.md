[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/MagnusDahlquist/PhD403/master)
[![Build Status](https://travis-ci.org/MagnusDahlquist/PhD403.svg?branch=master)](https://travis-ci.org/MagnusDahlquist/PhD403)
# PhD403: Empirical Asset Pricing
This repository contains Julia code for course PhD403 at the Stockholm School
of Economics, with emphasis on illustrating applied econometrics in Julia. For
help with getting up to speed with Julia, look at the resources section below.

## Getting started
The examples are organized in Jupyter notebooks, with some extended code
examples in the `src` folder.

The notebooks may be viewed in your browser, run interactively online with
Binder (click the [launch binder](https://mybinder.org/v2/gh/MagnusDahlquist/PhD403/master) button above - may take a while to load), or
on your local machine by downloading this repository.

If you have `git` installed, all you need to do is to run

`$ git clone https://github.com/MagnusDahlquist/PhD403.git`

To install the required packages used in the examples, run (only needed once)

`$ julia install_packages.jl`

## The notebooks
Each notebook covers a main section with examples, with each subsection
containing all the explicit imports and declarations needed to run that
specific part.

* [Data processing](https://github.com/MagnusDahlquist/PhD403/blob/master/data%20processing.ipynb)

* [Maximum likelihood](https://github.com/MagnusDahlquist/PhD403/blob/master/maximum%20likelihood.ipynb)

* [Bootstrap](https://github.com/MagnusDahlquist/PhD403/blob/master/bootstrap.ipynb)

* [GMM](https://github.com/MagnusDahlquist/PhD403/blob/master/gmm.ipynb)

## Resources
Some links to get started with Julia:

* [The Official Documentation](https://docs.julialang.org/en/)

* [Quant Econ Julia Intro](https://lectures.quantecon.org/jl/index_learning_julia.html)

* [Setting up Jupyter for Julia](https://github.com/JuliaLang/IJulia.jl)

* [Learn Julia the hard way (work in progress)](https://scls.gitbooks.io/ljthw/_chapters/03-ex0.html)

* [Julia overview for MIT courses](https://github.com/stevengj/julia-mit)

Misc.

* [Github introduction](https://guides.github.com/activities/hello-world/)

* [Bruce Hansen's Econometrics textbook](https://www.ssc.wisc.edu/~bhansen/econometrics/)
