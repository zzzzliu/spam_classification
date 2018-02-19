load('train.mat');

fprintf('\nTraining SVM...')
C = 10;

if kernal == 1
    fprintf('\nUse Gaussian Kernel\n');
    model = svmTrain(train{10},label{10}, C, @gaussianKernel);
elseif kernal == 2
    fprintf('\nUse Linear Kernel\n');
    model = svmTrain(train{10},label{10}, C, @linearKernel);
else
    fprintf('\nUse Polynomial Kernel\n');
    model = svmTrain(train{10},label{10}, C, @polynomialKernel);
end 
    
load('test.mat');
p = svmclassify(model, test);

fprintf('Cross Validation Accuracy: %f\n', mean(double(p == tlabel)) * 100);

[weight, idx] = sort(model.w, 'descend');
vocabList = getVocabList();

fprintf('\nTop 10 predictors of spam: \n');
for i = 1:10
    fprintf(' %-10s (%f) \n', vocabList{idx(i)}, weight(i));
end