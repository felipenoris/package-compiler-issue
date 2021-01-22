
using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()

target_sysimg = joinpath(homedir(), "sysimage.so")

pkglist = [
	:InterestRates
]

import PackageCompiler

precompile_execution_file = joinpath(@__DIR__, "precompile_execution.jl")
@assert isfile(precompile_execution_file)

PackageCompiler.create_sysimage(pkglist;
	sysimage_path=target_sysimg,
	precompile_execution_file=precompile_execution_file
)

@assert isfile(target_sysimg)
@info("Sysimage created at $target_sysimg")
