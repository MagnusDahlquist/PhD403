import Statistics
function NW(F,M)                                # Newey and West (1987)
    T = size(F,1)                               # number of observations
    F = F .- Statistics.mean(F,dims=1)          # demean
    S = F'F/T                                   # lag zero
    for j = 1:M                                 # lags -j to +j
        Gamma_j = F[j+1:T,:]'F[1:T-j,:]/T
        S = S  +  ( 1 - j/(M+1) )*(Gamma_j + Gamma_j')
    end

    return S
end
