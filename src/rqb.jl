using Random

export rqb

function rqb(
    A,
    k::Int,
    p::Int,
    q::Int
)
    m, n = size(A)
    l = k + p
    Ω = rnorm(n, l)
    Y = A * Ω
    Y = sub_iterations(A, Y, q)
    Q, ~ = qr(Y)
    B = Q.T * A
    return Q, B
end