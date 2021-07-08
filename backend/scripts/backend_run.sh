#!/bin/bash
julia -e 'using Pkg; Pkg.activate("backend"); include("backend/mathAPI.jl")'
