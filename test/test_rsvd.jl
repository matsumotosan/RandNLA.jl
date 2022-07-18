using RandNLA
using Test, LinearAlgebra, Random

@testset "rsvd" begin

    @testset "Small, wide rectangular" begin
        A = [[1, 2, 3, 4]
             [5, 6, 7, 8]]
        s1 = svd(A)
        s2 = rsvd(A, 2, 0)

        @test norm(abs.(s1.U) - abs(s2.U)) <= sqrt(eps())
        @test norm(abs.(s1.Vt) - abs(s2.Vt)) <= sqrt(eps())
        @test norm(s1.S - s2.S) <= sqrt(eps())
    end

    @testset "Small, tall rectangular" begin
        A = [1, 2;
             3, 4; 
             5, 6; 
             7, 8]
        s1 = svd(A)
        s2 = rsvd(A, 2, 0)

        @test norm(abs.(s1.U) - abs(s2.U)) <= sqrt(eps())
        @test norm(abs.(s1.Vt) - abs(s2.Vt)) <= sqrt(eps())
        @test norm(s1.S - s2.S) <= sqrt(eps())
    end

    @testset "Small square" begin
        A = [1, 2, 3;
             4, 5, 6;
             7, 8, 9]
        s1 = svd(A)
        s2 = rsvd(A, 3, 0)

        @test norm(abs.(s1.U) - abs(s2.U)) <= sqrt(eps())
        @test norm(abs.(s1.Vt) - abs(s2.Vt)) <= sqrt(eps())
        @test norm(s1.S - s2.S) <= sqrt(eps())
    end

    @testset "Small, low rank" begin
        A = [1, 2, 3;
             4, 5, 6;
             2, 4, 6]
        s1 = svd(A)
        s2 = rsvd(A, 2, 0)

        @test norm(abs.(s1.U) - abs(s2.U)) <= sqrt(eps())
        @test norm(abs.(s1.Vt) - abs(s2.Vt)) <= sqrt(eps())
        @test norm(s1.S - s2.S) <= sqrt(eps())
    end
end