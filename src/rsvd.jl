import LinearAlgebra: Eigen, SVD
import rqb

export rsvd

function rsvd(
    A,
    k::Int, 
    p::Int,
    q::Int
)
    m, n = size(A)
    Q, B = rqb(A, k, p, q)
    U, S, Vt = svd(B)
    U = Q * U
    return U, S, Vt 
end