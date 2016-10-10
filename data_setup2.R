setwd("C:/Users/scott.ziemke/Documents/Coursera/Capstone")
library(R.utils)
library(tm)
library(qdap)
library(ggplot2)
library(RWeka)

#the purpose of this documenet is to provide a high level summary of the en_US files: blogs, twitter, and news. This will be done in the foll

#read in files
source.blogs <- readLines("en_US.blogs.txt", encoding="UTF-8")
source.twitter <- readLines("en_US.twitter.txt", encoding="UTF-8")
source.news <- readLines("en_US.news.txt", encoding="UTF-8")

#subset files

subset.blogs <- source.blogs[sample(1:length(source.blogs), 3000,replace=FALSE)]
subset.twitter <- source.twitter[sample(1:length(source.twitter), 3000,replace=FALSE)]
subset.news <- source.news[sample(1:length(source.news), 3000,replace=FALSE)]

#remove source
rm(source.blogs,source.twitter,source.news)

#create corpus
Files <- paste(subset.blogs, subset.twitter, subset.news)
File_Corpus <- Corpus(VectorSource(Files))
#rm(subset.blogs, subset.news, subset.twitter)
#rm(Files)

nonAscIDX<- grep("File_Corpus", iconv(File_Corpus, "latin1", "ASCII", sub="File_Corpus"))

# subset original vector of words to exclude words with non-ACCII characters
ascVec<- File_Corpus[ - nonAscIDX]


#clean Data - lowercase, remove punctutions and numbers, stopwords from SMART (571 words that are not relevant), remove whitespace
File_Corpus <- tm_map(File_Corpus, removePunctuation)
File_Corpus <- tm_map(File_Corpus, removeNumbers)
File_Corpus <- tm_map(File_Corpus, removeWords, stopwords("SMART"))
File_Corpus <- tm_map(File_Corpus, stripWhitespace)
File_Corpus <- tm_map(File_Corpus, content_transformer(tolower))


