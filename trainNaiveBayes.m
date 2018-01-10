
function [p0Vec, p1Vec, pSpam] = trainNaiveBayes(X, y)
    numTrainDocs = size(X, 1);
    numWords = size(X, 2);
    pSpam = 1.0 * sum(y) / numTrainDocs;
    p0Num = ones(1, numWords);
    p1Num = ones(1, numWords);
    p0 = 2.0;
    p1 = 2.0;

    for i = 1 : numTrainDocs
        vec_temp = X(i, :);
        if y(i) == 1
            p1Num = p1Num + vec_temp;
            p1 = p1 + sum(vec_temp);
        else
            p0Num = p0Num + vec_temp;
            p0 = p0 + sum(vec_temp);
        end
    end

    p0Vec = log(p0Num / p0);
    p1Vec = log(p1Num / p1);

end
