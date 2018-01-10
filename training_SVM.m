
load('train.mat');

fprintf('\nTraining... \n')
C = 10;
model = svmTrain(train{10},label{10}, C, @gaussianKernel);

load('test.mat');
p = svmclassify(model, test);

fprintf('Test Accuracy: %f\n', mean(double(p == tlabel)) * 100);

[weight, idx] = sort(model.w, 'descend');
vocabList = getVocabList();

fprintf('\nTop 10 predictors of spam: \n');
for i = 1:10
    fprintf(' %-10s (%f) \n', vocabList{idx(i)}, weight(i));
end

fprintf('\nPress enter to continue.\n');
