function label = classifyNaiveBayes(X, p0Vec, p1Vec, pSpam)
    m = size(X, 1);
    for i = 1 : m
        p1(i, 1) = p1Vec * X(i, :)' + log(pSpam);
        p0(i, 1) = p0Vec * X(i, :)' + log(1.0 - pSpam);
    end
    label = (p1 > p0);
end

