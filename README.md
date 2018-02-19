# spam_classification
SVM based spam email classifier, written in MATLAB

In this project, a practical spam classifier was built with support vector machine (SVM). For a typical email, we first conduct preprocessing and map the content into a critical feature space. Then the training and cross-validating of support vector machine is performed. 

In this project, 4000 training samples and 500 testing samples are introduced. We collate three kinds of kernel function (Gaussian, Polynomial, and Linear) accordingly, and explore best parameter for each function, i.e. order of polynomial and variance of gaussian function. We find that, for this spam classification problem, linear kernel has best performance since the feature space is exactly high-dimensional. Besides, we change the penalty parameter exponentially and find reasonable values. Finally, we build another classifier with Naïve Bayes Model. Result shows that the SVM has better performance in this case.

## Acknowledgement
Some helper functions and data sets are provided by [Machine Learning course by Andrew Ng](https://www.coursera.org/learn/machine-learning).

## main.m
To start the project, just type 

```
main
```
in MATLAB console.

The program will automatically train and cross-validate the SVM and Naive Bayes models based on the training set and cross validation set.

The user can also test their own emails. To do that, please copy & paste the content of the email into `Testing_Email.txt`.

## Example
Here is a typical example output:
```
Please Choose The Kernel Function for SVM: 
1. Gaussian
2. Linear
3. Polynomial
3
Training Naive Bayes... 
Cross Validation Accuracy: 96.600000

Training SVM...
Use Polynomial Kernel
Cross Validation Accuracy: 81.800000

Top 10 predictors of spam: 
 nbsp       (0.028449) 
 pleas      (0.018605) 
 da         (0.018280) 
 your       (0.017790) 
 mail       (0.017212) 
 visit      (0.015025) 
 hat        (0.014705) 
 plai       (0.014629) 
 un         (0.014508) 
 will       (0.014031) 

Preprocessing testing email......

==== Processed Email ====

the first of it kind googl it support profession certif hand on tech train at 
a breakthrough price it support is a rapidli grow career field and both googl 
and coursera believ that everyon deserv access to train and job opportun with 
the googl it support profession certif you can train to becom an it support 
specialist in just number to number month the total cost of thi self pace 
learn program is just dollarnumb per month enrol now why the googl it support 
profession certif is first of it kind launch your career when you earn the 
certif you have the option to share your inform with compani like bank of 
america walmart sprint ge digit pnc bank infosi teksystem univers of 
pittsburgh medic center and of cours googl get hand on experi learn from hand 
on lab and widget so that you can gain troubleshoot experi just like you 
would on the job learn from real world pro everi cours is design by googler 
who ar expert in the field of it support excel in ani organ learn best 
practic for custom user interact problem solv and troubleshoot explor cours 
in the googl it support profession certif number cours averag total time 
number number hour per week over number to number month technic support 
fundament learn more the bit and byte of comput network learn more oper 
system and you becom a power user learn more system administr and it 
infrastructur servic learn more it autom it s not that scari learn more it 
secur defens against the digit dark art learn more explor all cours 

Word Indices:
1666 652 1162 883 912 725 883 1623 1316 748 1171 1645 1720 124 1299 883 1623 877 736 248 636 74 204 725 74 173 1665 576 435 11 1699 1720 74 891 1178 1860 1666 725 883 1623 1316 1893 238 1720 1699 166 71 883 1623 825 902 1120 1699 1120 1062 1666 1713 370 1162 1676 1474 938 1319 877 902 479 1231 1062 1117 1847 1666 725 883 1623 1316 877 652 1162 883 912 932 1895 248 1837 1893 504 1666 1893 756 1666 1181 1699 1503 1895 840 1860 321 956 153 1162 66 454 153 1751 1162 1023 263 74 1162 376 725 708 748 1171 594 938 688 748 1171 74 1538 1665 1893 238 700 594 902 956 1893 1876 1171 1666 891 938 688 1369 1871 1307 575 376 877 436 227 1844 103 595 825 1666 636 1162 883 1623 582 825 75 1185 938 176 1286 666 388 1773 859 1309 1544 74 598 376 825 1666 725 883 1623 1316 1120 376 140 1713 1694 1120 1120 792 1231 1827 1196 1120 1699 1120 1062 1646 1623 938 1064 1666 186 74 228 1162 330 1097 938 1064 1176 1631 74 1893 166 1284 1773 938 1064 1631 26 74 883 1493 938 1064 883 137 883 1113 1665 938 1064 883 1467 419 42 1666 454 397 113 938 1064 598 53 376 

Length of feature vector: 1899
Number of word indices: 115

Press enter to continue.

Spam Classification by SVM: 0

Spam Classification by Naive Bayes: 1
```

First the user has to specify the kernel function of SVM, then the program indicates the cross-validation accuracy for SVM and Bayes model.

```
Please Choose The Kernel Function for SVM: 
1. Gaussian
2. Linear
3. Polynomial
3
Training Naive Bayes... 
Cross Validation Accuracy: 96.600000

Training SVM...
Use Polynomial Kernel
Cross Validation Accuracy: 81.800000
```

As we can see, the Naive Bayes is better than polynomial SVM in this case. If users want change the kernal function, we can just change the input to 1/2 at the very begining.

Then the program gives us the top 10 spam words:

```
Top 10 predictors of spam: 
 nbsp       (0.028449) 
 pleas      (0.018605) 
 da         (0.018280) 
 your       (0.017790) 
 mail       (0.017212) 
 visit      (0.015025) 
 hat        (0.014705) 
 plai       (0.014629) 
 un         (0.014508) 
 will       (0.014031) 
```

After that, the program will process the user's email with NLP pipeline - to lower case, stemming, handle URL and numbers, etc. This process will map the email content into a 1899-dimensional feature space, so we can apply our SVM and Bayes models.

```
==== Processed Email ====

the first of it kind googl it support profession certif hand on tech train at 
a breakthrough price it support is a rapidli grow career field and both googl 
and coursera believ that everyon deserv access to train and job opportun with 
the googl it support profession certif you can train to becom an it support 
specialist in just number to number month the total cost of thi self pace 
learn program is just dollarnumb per month enrol now why the googl it support 
profession certif is first of it kind launch your career when you earn the 
certif you have the option to share your inform with compani like bank of 
america walmart sprint ge digit pnc bank infosi teksystem univers of 
pittsburgh medic center and of cours googl get hand on experi learn from hand 
on lab and widget so that you can gain troubleshoot experi just like you 
would on the job learn from real world pro everi cours is design by googler 
who ar expert in the field of it support excel in ani organ learn best 
practic for custom user interact problem solv and troubleshoot explor cours 
in the googl it support profession certif number cours averag total time 
number number hour per week over number to number month technic support 
fundament learn more the bit and byte of comput network learn more oper 
system and you becom a power user learn more system administr and it 
infrastructur servic learn more it autom it s not that scari learn more it 
secur defens against the digit dark art learn more explor all cours 

Word Indices:
1666 652 1162 883 912 725 883 1623 1316 748 1171 1645 1720 124 1299 883 1623 877 736 248 636 74 204 725 74 173 1665 576 435 11 1699 1720 74 891 1178 1860 1666 725 883 1623 1316 1893 238 1720 1699 166 71 883 1623 825 902 1120 1699 1120 1062 1666 1713 370 1162 1676 1474 938 1319 877 902 479 1231 1062 1117 1847 1666 725 883 1623 1316 877 652 1162 883 912 932 1895 248 1837 1893 504 1666 1893 756 1666 1181 1699 1503 1895 840 1860 321 956 153 1162 66 454 153 1751 1162 1023 263 74 1162 376 725 708 748 1171 594 938 688 748 1171 74 1538 1665 1893 238 700 594 902 956 1893 1876 1171 1666 891 938 688 1369 1871 1307 575 376 877 436 227 1844 103 595 825 1666 636 1162 883 1623 582 825 75 1185 938 176 1286 666 388 1773 859 1309 1544 74 598 376 825 1666 725 883 1623 1316 1120 376 140 1713 1694 1120 1120 792 1231 1827 1196 1120 1699 1120 1062 1646 1623 938 1064 1666 186 74 228 1162 330 1097 938 1064 1176 1631 74 1893 166 1284 1773 938 1064 1631 26 74 883 1493 938 1064 883 137 883 1113 1665 938 1064 883 1467 419 42 1666 454 397 113 938 1064 598 53 376 
```

In the example, the content had been text-processed so they can find corresponding Indices in the wordlist. `Word Indices` shows the position where the 1899-dimensional vector will have elements equal to 1, all other elements will equal to 0.

```
Length of feature vector: 1899
Number of word indices: 115

Press enter to continue.

Spam Classification by SVM: 0

Spam Classification by Naive Bayes: 1
```

Finally, our two classifier give us two different prediction: the SVM thinks this email is not a spam while the Naive Bayes doesn't. Since the cross-validation results told us the Naive Bayes is more reliable, we will label this email as spam.