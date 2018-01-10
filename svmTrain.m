function [model] = svmTrain(X, Y, C, kernelFunction)
% This function trains an SVM using SMO algorithm. 
% Imput:   X is the matrix of training samples where row represents individual 
%            training sample, and the column represents feature.
%          Y is a column vector representing the label of samples in matrix X.
%          C is parameter controls the penalty of misclassication
% Output:  model is a structure including all the parameters of this SVM

%%%%%%%%%%%%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%%%%%%%%%%%%
thre = 1e-3;           % threshold to determine whether the value is small enough
iteration = 5;         % the max limit of the numbers of iterations
m = size(X, 1);        % numbers of samples.
Y(Y==0) = -1;
alpha = zeros(m, 1);   % initialize lagrange multipier, this number should be equal to the number of samples.
b = 0;                 % margin of hyperplane
E = zeros(m, 1);       % initialize the error function which represent the different between predict and actual label
G = zeros(m, 1);       % initialize the predict label
run = 0;               % initialize the number of iteration

%%%%%%%%%%%%%%%%%%%%%%%%%% Kernel Function %%%%%%%%%%%%%%%%%%%%%%%%%%
% rather than double loop, we use vecterization and implement matrix
% calculation, so as to fast the procress.
if strcmp(func2str(kernelFunction), 'linearKernel')
    K = X*X';
elseif strcmp(func2str(kernelFunction), 'gaussianKernel')
    K = bsxfun(@plus, sum(X.^2, 2), bsxfun(@plus, sum(X.^2, 2)', - 2 * (X * X')));
    K = kernelFunction(1, 0) .^ K;
elseif strcmp(func2str(kernelFunction), 'polynomialKernel')
    K = X*X'+1;
    K = K.^2;  % 2 order polynomial kernel
end
% each element K(i,j) in matrix K represent the result of kerner function between
% two samples X(i) and X(j)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Training %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(run < iteration)
    changes = 0;
    for i = 1:m,
        G(i) = b + sum (alpha.*Y.*K(:,i)); % the predict label using this SVM
        E(i) = G(i) - Y(i);  
        if ((Y(i)*E(i)<-thre&&alpha(i)< C)||(Y(i)*E(i)>thre&&alpha(i)>0)) % determine whether this sample maintain the KKT condition
            j = ceil(m * rand());
            while j == i,  % Make sure i \neq j
                j = ceil(m * rand());
            end
            E(j) = b + sum (alpha.*Y.*K(:,j)) - Y(j);
            alpha_i_old = alpha(i);
            alpha_j_old = alpha(j);
            if (Y(i) == Y(j)) % determine the boundary of the new alpha_j
                Low = max(0, alpha(j) + alpha(i) - C);
                High = min(C, alpha(j) + alpha(i));
            else
                Low = max(0, alpha(j) - alpha(i));
                High = min(C, C + alpha(j) - alpha(i));
            end
            
            if (Low == High),
                continue;
            end
            eta = K(i,i)+K(j,j)-2*K(i,j);
            if (eta < 0),
                continue;
            end
            
            alpha(j) = alpha_j_old + (Y(j) * (E(i) - E(j))) / eta; % Compute uncliped new alpha j
            alpha(j) = min (High, alpha(j)); % Clip
            alpha(j) = max (Low, alpha(j));  % Clip
            
            if (abs(alpha(j) - alpha_j_old) < thre) % check this change is useful or not, if not, jump to next case, restore the old alpha
                alpha(j) = alpha_j_old;
                continue;
            end
     
            alpha(i) = alpha(i) + Y(i)*Y(j)*(alpha_j_old - alpha(j)); % calculate the corresponding alpha_i
            %%%%% update the margin %%%%%
            b1 = b - E(i) ...
                 - Y(i) * (alpha(i) - alpha_i_old) *  K(i,j)' ...
                 - Y(j) * (alpha(j) - alpha_j_old) *  K(i,j)';
            b2 = b - E(j) ...
                 - Y(i) * (alpha(i) - alpha_i_old) *  K(i,j)' ...
                 - Y(j) * (alpha(j) - alpha_j_old) *  K(j,j)';
            if (0 < alpha(i) && alpha(i) < C) % determine to use which b with KKT condition
                b = b1;
            elseif (0 < alpha(j) && alpha(j) < C)
                b = b2;
            else
                b = (b1+b2)/2; % if the both case maintian the KKT condition, use the average as the updated b
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            changes = changes + 1;
        end  
    end
    if (changes == 0),
        run = run + 1;
    else
        run = 0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
idx = alpha > 0;
model.X= X(idx,:);
model.y= Y(idx);
model.kernelFunction = kernelFunction;
model.b= b;
model.alphas= alpha(idx);
model.w = ((alpha.*Y)'*X)';
end
