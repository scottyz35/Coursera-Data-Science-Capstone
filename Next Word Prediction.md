Next Word Prediction
========================================================
author: Scott Ziemke
date: October 9, 2016
autosize: true


Text Prediction: Why?
========================================================

Have you ever starting typing and just wondered "what the hell am I going to type next?"  Well this app is for you!  At a high level, this app:

- Input a series of words
- runs some magic algorithms (that we will discuss later)
- Outputs the top 3 most likely words that you would be wanting to write!

Text Prediction: How?
========================================================

- Background Data: This app uses 9000 randomly selected lines from twitter, blogs, and news as a training set
- Algorithm: Based upon the frequencies of words in the training data set, probabilities are calculated for the next word
- Output: The top 3 words and their respective probabilies are returned for your viewing pleasure


