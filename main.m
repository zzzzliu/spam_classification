close all; clc
% Training SVM and Naive Bayes
training_naivebayes;
training_SVM;

% Extract Features
fprintf('\nPreprocessing testing email......\n');
filename = 'Testing_Email.txt';
file_contents = readFile(filename);
word_indices = processEmail(file_contents);

fprintf('\nWord Indices:\n');
fprintf('%d ', word_indices);
fprintf('\n\n');

features= emailFeatures(word_indices);
fprintf('Length of feature vector: %d\n', length(features));
fprintf('Number of word indices: %d\n', sum(features > 0));

fprintf('\nPress enter to continue.\n');
pause;

p = svmclassify(model, features);
fprintf('\nSpam Classification by SVM: %d\n',p);

label = classifyNaiveBayes(features', p0Vec, p1Vec, pSpam);
fprintf('\nSpam Classification by Naive Bayes: %d\n',label);
