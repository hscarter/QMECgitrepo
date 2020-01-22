# QMEC 2020 HW2
#Haley Carter

# Save your homework as an R script file named HW2_Smith.R in your dropbox
# folder (if your surname is not Smith, then replace Smith with your surname).
# Note: Your entire assignment should run as a script without errors.

# The following line will enable R to read a dataset of 25 Cakile edulenta
# plants sampled at random from a population that grew on the beach of Lake
# Michigan on the NU campus.

cc <- read.csv("http://echinaceaproject.org/dataQmec1999/Cakile_data.csv")

# The measurements are height (cm), number of branches, internode distance (cm),
# distance to the nearest Cakile (cm), distance to the lake (m), distance to the
# nearest plant (cm), and bogosity (mm Hg/cm2/sec).  In addition, we noted the 
# presence of the distal and basal fruits, the color of each plant, and the 
# species of its nearest neighbor.  In the Cakile_data.csv file, these data can 
# be found in the columns labeled Height, StemCount, InternodeDist, Dist_nr_cak,
# Dist_lake_m, Dist_nr_pla, bogosity, DistalFrPresent, BasalFrPresent, 
# StemColor, and Nr_pla_id respectively. UserName specifies the person who
# measured the plant.

# 1. For the first six columns in the Cakile dataset categorize the type of data
# as discrete or continuous. If the column is discrete, specify the values 
# present. If the column is continuous, show the range of values. Show all of
# the code you used and give your answers as comments. Use complete sentences.

str(cc)
#All but the third and fifth columns (Height and InternodeDist) contain discrete data,
#while those two columns contain continuous numeric values.
levels(cc$UserName) #Column one contains six values: Alona, Becky, Christine, Countney, 
#Diane, and Kenny.
cc$Plant_id #The second column contains integers from 1 to 196200, though most are in the teens.
range(cc$Height) #The range of heights is from 8.0 to 49.7.
table(cc$StemCount) #The fourth column contains integers from 1 to 18 with modes of 3, 8, and 18.
range(cc$InternodeDist) #The range of InternodeDist is from 0 to 19.
levels(cc$DistalFrPresent) #The sixth column contains presence / absence data in the form of "Y"
#"N" or empty.


# 2. Quantify the central tendency of these four columns of measurement data in 
# the Cakile dataset Height, InternodeDist, Dist_nr_cak, StemCount. Show your 
# code. Justify your choice of measurement for central tendency for each column
# in commented full sentences.

summary(cc)
#Because the mean and median values are similar for each of these columns, I've noted
#the mean value for each column.
#The mean value for Height is 25.5.
#The mean value for InternodeDist is 7.624.
#The mean value for Dist_nr_cak is 13.9.
#The mean value for StemCount is 7.64.


# 3. Write code to determine the maximum, minimum, and mean mean height of A)
# all plants that Becky measured, and B) all plants measured by someone other
# than Becky.

#A) The max height of plants measured by Becky was 47.4, the min was 10.5, and the mean was 24.82.
max(cc[cc$UserName == "Becky", 'Height'])
min(cc[cc$UserName == "Becky", 'Height'])
mean(cc[cc$UserName == "Becky", 'Height'])

#B) The max height of plants measured by someone other than Becky was 49.7, the min was 8, and the mean was 25.675.
max(cc[cc$UserName != "Becky", 'Height'])
min(cc[cc$UserName != "Becky", 'Height'])
mean(cc[cc$UserName != "Becky", 'Height'])

# 4. Randomization is very important when taking samples and designing
# experiments. Often it is not done properly. Write a brief description of a
# scientific sampling scheme that sounds pretty good but isn't truly random.
# Draw from your experience or find an example in the scientific literature.
# Then write a brief protocol that describes how to correct the problem and make
# the sampling truly random. Two short paragraphs should suffice.

#Put all the spiders in the closet in your hat. Reach in and draw a spider, measure it's weight.
#Measure 10 of the 30 spiders that live in your closet. This is not truly random because the
#most active spiders may climb to the top of your hat and be more likely to be drawn.

#Capture all the 30 spiders and put each in its own tupperware container. Line up the tupperwares
#Generate numbers from 1 to 30 randomly (maybe using R!) and measure those spiders.

# 5. Explain why the correct randomization scheme you described in problem 4 is
# valuable.

#With the correct randomization scheme (randomization of both sample and assignment) you can 
#make inferences about cause and effect and about the population as a whole.

# 6. Write R code to fulfill the following requests...

# a Calculate the square root of 81.
sqrt(81) #9

# b Make a vector of the following numbers: 1, 5, 6, 7, 8, 18, 21 and assign it 
# the name coolNums.
coolNums <- c(1, 5:8, 18, 21)

# c Calculate the square root of all numbers in coolNums.
sqrt(coolNums) #1.000000 2.236068 2.449490 2.645751 2.828427 4.242641 4.582576

# d Randomly order the numbers in coolNums.
sample(coolNums)

# e Write a sequence of numbers from 1 to 2 that increments by 0.05.
seq(1, 2, 0.05)

# f Sample 10 numbers at random from all integers from 1 to 100.
sample(1:100, 10)

# g Make a subset of the Cakile dataset that includes only plants taller than 12
# cm. The subset should include two columns: the height of the plant in mm and
# the person who measured it.
library(dplyr)
subCakile <- cc %>% 
  subset(Height > 12) %>% 
  select(c(UserName, Height))

# 7. Write R code to read the datafile you generated from your own 
# experiment that you conducted for HW1. Then write code to report the 
# following information for each treatment:
# the number of trials,
# the number of successes,
# the number of failures, and
# the proportion of successes.
HWData <- read.csv("https://raw.githubusercontent.com/hscarter/QMECgitrepo/master/hw1_data.csv")
numtrials <- length(HWData$trial)
numtrials #50

result_db <- HWData %>% 
  group_by(assignment) %>% 
  summarise(results = sum(results))
result_db$proportion <- result_db$results/numtrials
result_db #32% success rate with my left hand (denoted by assignment = 0) and 18% success with my right hand. 

# 8. State the hypothesis that you tested in #7, using both the null &
# alternate versions of the statement.

#There is a difference in my shuffling ability based on the hand with which I initiate the shuffling.
#There is no difference in my shuffling ability based on the hand with which I initiate the shuffling.

