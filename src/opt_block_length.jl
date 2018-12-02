# Brute force Julia translation of Andrew Patton's Matlab implementation of the
# optimal block length as in Politis, White, and Patton (2009).
# ('opt_block_length_REV_dec07.m')
import Statistics

"""
data: nxk matrix

Returns [BstarSB BstarCB]
BstarSB: Optimal Stationary Boostrap block length (does not need to be an int)
BstarCB: Optimal Circular Boostrap block length (recommended rounded up to
nearest int)
"""
function opt_block_length(data)
    if length(size(data)) == 1
        n = length(data)
        k = 1
    else
        n, k = size(data)
    end

    KN = max(5, sqrt(log10(n)))
    KN = Int(KN)
    mmax = ceil(sqrt(n)) + KN
    mmax = Int(mmax)
    round = 0
    Bmax = ceil(min(3 * sqrt(n), n/3))

    c = 2
    origdata = copy(data)
    Bstar_final = zeros(k, 2)
    for i in 1:k
        data = origdata[:, i]
        data = hcat(data...)'

        temp = mlag(data, mmax)
        temp = temp[mmax+1:end, :]
        temp = Statistics.cor([data[mmax+1:end] temp])
        temp = temp[2:end, 1]
        temp = hcat(temp...)'

        temp2 = [mlag(temp, KN)' temp[end-KN+1:end]]
        temp2 = temp2[:, KN+1:end]
        temp2 = (abs.(temp2) .<
        (c * sqrt.(log10(n) / n) * ones(KN, mmax-KN+1)))
        temp2 = sum(temp2, dims=1)'

        temp3 = [(1:1:length(temp2)) temp2]
        cidx = findall(temp2 .== KN)
        idx = map(v -> v[1], cidx)
        temp3 = temp3[idx, :]

        if isempty(temp3)
            cidx = findall(abs.(temp) .> (c*sqrt(log10(n)/ n)))
            idx = map(v -> v[1], cidx)
            mhat = maximum(idx)
        else
            mhat = temp3[1, 1]
        end
        if 2*mhat > mmax
            M = mmax
            trunc1 = 1
        else
            M = 2*mhat
        end

        kk = (-M:1:M)'

        if M > 0
            temp = mlag(data, M)
            temp = temp[M+1:end, :]
            temp = Statistics.cov([data[M+1:end] temp], corrected=true)
            acv = temp[:, 1]
            acv2 = [-(1:1:M) acv[2:end]]
            if size(acv2, 1) > 1
                acv2 = acv2[sortperm(acv2[:, 1]), :]
            end
            acv = [acv2[:, 2]; acv]
            Ghat = sum(lam(kk/M)' .* abs.(kk)' .* acv)
            DCBhat = 4/3 * sum(lam(kk/M)' .* acv).^2

            DSBhat = 2*(sum(lam(kk/M)' .* acv).^2)
            Bstar = ((2*(Ghat^2) / DSBhat)^(1/3)) * (n^(1/3))
            if Bstar > Bmax
                Bstar = Bmax
            end
            BstarCB = ((2*(Ghat^2) / DCBhat)^(1/3)) * (n^(1/3))

            if BstarCB > Bmax
                BstarCB = Bmax
            end
            Bstar = [Bstar ; BstarCB]
        else
            Ghat = 0
            Bstar = [1; 1]
        end
        Bstar_final[i, :] = Bstar
    end

    Bstar_final
end

function mlag(x, n=1)
    if n == 1
        init = 0
    else
        n = Int(n)
        init = 0
    end

    nobs, nvar = size(x)
    xlag = ones(nobs, nvar * n) * init;
    icnt = 0
    for i in 1:nvar
        for j in 1:n
            xlag[j+1:nobs, icnt+j] = x[1:nobs-j, i]
        end
        icnt += n
    end
    xlag
end

function lam(kk)
    (abs.(kk) .>= 0) .*
    (abs.(kk) .< 0.5) .+
    2*(1 .- abs.(kk)) .* (abs.(kk) .>= 0.5) .* (abs.(kk) .<= 1)
end
