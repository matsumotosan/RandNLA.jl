using LinearAlgebra

function power_iterations(
    A,
    Y,
    q::Int
)
    return Y
end


function sub_iterations(
    A,
    Y,
    q::Int
)
    for i in 1:q
        Q = qr(Y).Q
        Q = qr(A' * Q).Q
        Y = A * Q
    end
end


function norm_iterations(
    A,
    Y,
    q::Int
)
    return Y
end