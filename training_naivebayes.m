load('train.mat');
fprintf('Training Naive Bayes... \n')
[p0Vec, p1Vec, pSpam] = trainNaiveBayes(train{10}, label{10});
load('test.mat');
label = classifyNaiveBayes(test, p0Vec, p1Vec, pSpam);
fprintf('Cross Validation Accuracy: %f\n', mean(double(label == tlabel)) * 100);