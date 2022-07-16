using Random, RandNLA

export rid

function rid(
    A,
    k::Int,
    p::Int,
    q::Int
)
    m, n = size(A)
    _, B = rqb(A, k, p, q)

end