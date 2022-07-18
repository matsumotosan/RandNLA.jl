using Random
import power_iterations, sub_iterations, norm_iterations

export rqb

function rqb(
    A,
    k::Int,
    p::Int,
    q::Int
)
    _, n = size(A)
    l = k + p                   # calculate oversampling parameter
    Ω = rnorm(n, l)             # generate random test matrix
    Y = A * Ω                   # compute sketch
    Y = sub_iterations(A, Y, q) # computer power scheme
    Q = qr(Y).Q                 # form orthnormal basis for Y
    B = Q' * A                  # project to low-dimensional space
    return Q, B
end