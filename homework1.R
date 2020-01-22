#Homework Assignment 1
#by Haley Carter

#I am not very good at shuffling cards generally and I wanted to see if it made a difference
#which hand I used to initiate the shuffle. The subject is my shuffling, the treatments are
#starting with my right hand or my left hand. Treatment assignment was done randomly 
#(see code below). And the response was a successful shuffle (all cards could be pushed together)
#or an unsuccessfull shuffle (cards could not be combined after shuffling attempt).

#make dataframe
trial <- c(1:50) #there will be 50 trials
trial <- sample(trial, 50) #random assigment requires randomly selecting from trial number
assignment <- rep(T:F, each = 25) #first 25 randomly sampled trial numbers assigned treatment 1
#treatment 1 is starting the shuffle with my right hand
df <- data.frame(trial = trial, assignment = assignment) #combine them
df <- df[order(df$trial),] #sort in order of trial number

#record data, 1 means successfull shuffle
results <- c(
  0,
  0,
  1,
  0,
  1,
  0,
  0,
  1,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  1,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  1,
  1,
  1,
  1,
  0,
  1,
  0,
  1,
  1,
  0,
  1,
  1,
  0,
  1,
  1,
  1,
  1,
  1,
  1,
  0,
  1
)
#add results to the dataframe
df$results <- results
#save the data
write.csv(df, "hw1_data.csv") #I'm working from a git repo so also saves online

#read this data in remotely from github
hw1_data <- read.csv("https://raw.githubusercontent.com/hscarter/QMECgitrepo/master/hw1_data.csv")
#how did I do?
table(df$assignment, df$results)
