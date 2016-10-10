
unlist <-data.frame(text=unlist(sapply(File_Corpus, `[`, "content")), stringsAsFactors=F)

ngram1 <- NGramTokenizer(unlist, Weka_control(min = 1, max = 1, delimiters = " \\r\\n\\t.,;:\"()?!"))
ngram2 <- NGramTokenizer(unlist, Weka_control(min = 2, max = 2, delimiters = " \\r\\n\\t.,;:\"()?!"))
ngram3 <- NGramTokenizer(unlist, Weka_control(min = 3, max = 3, delimiters = " \\r\\n\\t.,;:\"()?!"))
ngram4 <- NGramTokenizer(unlist, Weka_control(min = 4, max = 4, delimiters = " \\r\\n\\t.,;:\"()?!"))

#creating frequency tables
freq1 <- as.data.frame(table(ngram1))
freq2 <- as.data.frame(table(ngram2))
freq3 <- as.data.frame(table(ngram3))
freq4 <- as.data.frame(table(ngram4))


#spilling up ngrams and adding individual words to the data frame
dummy <- data.frame(do.call('rbind', strsplit(as.character(freq2$ngram2),' ',fixed=TRUE)))
freq2["fw"] <- dummy$X1
freq2["sw"] <- dummy$X2

dummy <- data.frame(do.call('rbind', strsplit(as.character(freq3$ngram3),' ',fixed=TRUE)))
freq3["fw"] <- dummy$X1
freq3["sw"] <- dummy$X2
freq3["tw"] <- dummy$X3

dummy <- data.frame(do.call('rbind', strsplit(as.character(freq4$ngram4),' ',fixed=TRUE)))
freq4["fw"] <- dummy$X1
freq4["sw"] <- dummy$X2
freq4["tw"] <- dummy$X3
freq4["ftw"] <- dummy$X4

save(freq4, file = 'ngram4.RData')
save(freq3, file = 'ngram3.RData')
save(freq2, file = 'ngram2.RData')
save(freq1, file = 'ngram1.RData')