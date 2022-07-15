using RandNLA
using Test

@testset "RandNLA.jl" begin
    # 2x + 3y
    @test my_f(2, 1) == 7
    @test my_f(2, 3) == 13
end

include("test_rsvd.jl")