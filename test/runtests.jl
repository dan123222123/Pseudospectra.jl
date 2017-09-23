# To run only selected tests:
# $julia -e 'include("test/runtests.jl")' TEST1...

# To run during development (from REPL) include this file INSIDE A MODULE

using Pseudospectra, Base.Test

if VERSION < v"0.6-"
    macro test_warn(msg, expr)
        quote
            $(esc(expr))
        end
    end
end

tests = ["basic","arpack1","medcplx","medrect","smrect","spdirect",
          "projection_and_transient","radius_abscissa","negproj","eigsnoconv",
          "numrange", "linmap", "big", "power_transient", "swmethod", "zoom"
          ]

if length(ARGS) > 0
    tests = ARGS
end

include("testplotter.jl")

for f in tests
    println("Testing $f functionality")
    fnam = f*".jl"
    include(fnam)
end
