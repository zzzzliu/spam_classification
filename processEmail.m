function word_indices = processEmail(email_contents)

% Load Vocabulary
vocabList = getVocabList();
word_indices = [];

% Lower case
email_contents = lower(email_contents);

% Strip all HTML
email_contents = regexprep(email_contents, '<[^<>]+>', ' ');

% Look for one or more characters between 0-9
email_contents = regexprep(email_contents, '[0-9]+', 'number');

% Handle URLS
email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');

% Handle Email Addresses
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

% Handle $ sign
email_contents = regexprep(email_contents, '[$]+', 'dollar');


% ========================== Tokenize Email ===========================

% Output the email to screen as well
fprintf('\n==== Processed Email ====\n\n');

% Process file
l = 0;

while ~isempty(email_contents)

    % Tokenize and also get rid of any punctuation
    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    % Remove any non alphanumeric characters
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word 
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = Stemmer(strtrim(str)); 
    catch ''; 
        continue;
    end;

    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end
    % Look up the word in the dictionary and add to word_indices if
    % found
  
    for i=1:1899
         if strcmp(str,vocabList{i})==1;
            word_indices=[word_indices;i];
            break;
         end
    end       
    % Print to screen, ensuring that the output lines are not too long
    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;
    
    
end
    fprintf('\n')
end
