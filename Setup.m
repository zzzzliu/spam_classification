 close all; clc

fprintf('\nPreprocessing sample email......\n');

% Extract Features
file_contents = readFile('Sample2.txt');
word_indices = processEmail(file_contents);

fprintf('Word Indices: \n');
fprintf(' %d', word_indices);
fprintf('\n\n');

features= emailFeatures(word_indices);
fprintf('Length of feature vector: %d\n', length(features));
fprintf('Number of word indices: %d\n', sum(features > 0));

fprintf('\nPress enter to continue.\n');
pause;

filename = 'Sample2.txt';
features= emailFeatures(word_indices);

p = svmclassify(model, features);
fprintf('\nSpam Classification by SVM: %d\n',p);

label = classifyNaiveBayes(features', p0Vec, p1Vec, pSpam);
fprintf('\nSpam Classification by Naive Bayes: %d\n',label);
