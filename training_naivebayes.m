load('train.mat');
fprintf('\nTraining... \n')
[p0Vec, p1Vec, pSpam] = trainNaiveBayes(train{10}, label{10});
load('test.mat');
label = classifyNaiveBayes(test, p0Vec, p1Vec, pSpam);
fprintf('Test Accuracy: %f\n', mean(double(label == tlabel)) * 100);
fprintf('\nPress enter to continue.\n');