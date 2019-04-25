path = joinpath(@__DIR__(), "..", "notebooks")

for file in filter(x -> endswith(x, ".ipynb"), readdir(path))
    @info "including notebook $file"
    TempMod = Main.eval(:(module __Temp__; using NBInclude; end))
    ex = :(@nbinclude(joinpath($path, $file)))
    @eval(TempMod, $ex)
end
