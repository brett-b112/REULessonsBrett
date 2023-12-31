#Computes 1 + 1 and prints the output to the console when highlighted.
1+1
#Computes the mean of built-in Nile River data
mean(Nile)
#Another way of typing it
print(mean(Nile))
#Prints out all the Nile data
Nile
#Prints out the length of the Nile dataset
length(Nile)
#Creates a histogram of the nile data in the plots tab
hist(Nile)
#Again creates a histogram with breaks of 20 though
hist(Nile,breaks=20)
#This prints the data from a specific year
Nile[2]
#This concatenates the dates and builds a single vector that includes indicie 2, 5, and 6
Nile[c(2,5,6)]
#This creates a vector of indices 2 - 4
Nile[2:4]
#This creates a vector of indices 81 - 100
Nile[81:100]
# This stores the variables inside n81100
n81100 <- Nile[81:100]
#Takes the mean of the object
mean(n81100)
#Takes the stadnard deviation of the object that we created
sd(n81100)

#This generates the mean from 1945-1960
mean((Nile[74:89]))

#This indexes the newly created variable making 81 the new index 1
n81100[1]
Nile[81]

# This is the beginning of the Hands on R section

56+2
## 58
58*3
## 174
174-6
## 168
168/3
##56

# Prints out numbers 1 - 6 inclusively
1:6

a <- 1 #A stores the value 1
a # Prints the a value
a+2 # 1 + 2 = 3
a # A remains the same value unless otherwise assigned

#R is case sensitive 'Name' and 'name' are different variables

die <- 1:6

my_number <- 1
my_number 
## 1

my_number <- 999
my_number
## 999

#Lists the names of the variables
ls()

die-1
# 0 1 2 3 4 5
#R replaces die with the values that it stores
die/2
# 0.5 1.0 1.5 2.0 2.5 3.0
die*die
#1  4  9 16 25 36

1:2
# This prints 1 - 2
1:4
# this prints 1-4
die
die + 1:9 # This throws an error cannot be longer than the shorter object.
die + 1:3
#VECTOR RECYCLING
# This takes the vector and then adds those values to the existing array

#Inner (Typical) matrix multiplication
die %*% die
#Outer matrix multiplicaton
die %o% die

## 2.3 Functions

#Rounding the number
round(3.9235)

#Factorial of a number
factorial(3)

#Mean of a number
mean(1:6)

mean(die)#Takes the mean of a die
round(mean(die)) #Rounds the mean of the die
#Operates inner to outer


#Sample
sample(x=1:4, size=2)
#This takes in a vector (x) and returns size # of elements from the vector

sample(x=die,size=1)
#This rolls the die! Woo :D
# or written as
sample(die,size=1)

args(round)#This determines the arguments that a function takes
round(3.14125)
round(3.14125, digits = 2)

sample(die,size=2)
#This always provides unique values. Each number is different from the other. It removes it from selection choices

sample(die, size=2, replace=TRUE)
#Replace ensures that there can be duplicates.

dice <- sample(die, size=2, replace=TRUE)
#Saves the sample to dice but ONLY ONE random option. Have to rerun to regenerate.
dice

sum(dice)


## FUNCTIONS
#This is how you build functions that can execute multiple lines of code in a single call.
roll <- function(){
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
  #Last line of code is what the function returns.
  #If no return type is given the function will return nothing.
}
roll()
# This code below doesn't return anyhing because values are being saved to objects.
# dice <- sample(die, size = 2, replace = TRUE)
# two <- 1 + 1
# a <- sqrt(2)

#This throws an error because bones is not defined HOWVER passing it as a parameter will fix this.
# roll2 <- function() {
#   dice <- sample(bones, size = 2, replace = TRUE)
#   sum(dice)
# }

#Passing 1:6 into the argument sets a default value so that no error will occur. otherwise.
roll2 <- function(bones = 1:6){
  dice <- sample(bones, size=2, replace=TRUE)
  sum(dice)
}
roll2(bones = 1:4)
#This calls the function assigning the vector 1:4 to bones which is used in the declaration.

## SECTION 3.2
?sqrt
?log10
?sample
#Typing ?function will provide a detailed descirption of the funciton at hand
# This will incldue the Description, Usage, Arguments, and other sections
# VALUE ---> Shows what the function returns adn if it is a plot it describes what the plot means.
roll <- function(){
  die <- 1:6
  dice <- sample(die, size = 2, replace  = TRUE, prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice)
}

#This takes qplot and makes a quick scatterplot of the values using ggplot2s qplot library
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
## -1.0 -0.8 -0.6 -0.4 -0.2  0.0  0.2  0.4  0.6  0.8  1.0

y <- x^3
y
## -1.000 -0.512 -0.216 -0.064 -0.008  0.000  0.008
##  0.064  0.216  0.512  1.000

qplot(x, y)



# prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
#This takes a weighted probability of each item in the vector
#Additonally, This is a list concatination that can allow you to make a vector from a list of numbers
# install.packages("ggplot2")
#This installes packages from the internet for R
library("ggplot2")
#This utilizes the library and gives access to it.
roll()
rolls <- replicate(10000,roll())
qplot(rolls,binwidth=1)


#is.vector can test wheather an object is a vector or not and return a boolean value

### Reference these as you go they are valuable tools

#Hands on with R section 11

rolls <- expand.grid(die,die)
rolls
#expand grid prints all of hte possibilites of these two combinations.
rolls$value <- rolls$Var1 + rolls$Var2
head(rolls, 3)
#This is the sum of the two dice stored in clumn value

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
prob
#ths is the probability table
rolls$Var1
prob[rolls$Var1]
#This keys rolls to the table
rolls$prob2 <- prob[rolls$Var2]
head(rolls,3)
rolls$prob1 <- prob[rolls$Var1]
head(rolls, 3)
rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls,3)

sum(rolls$value * rolls$prob)
#This takes the sum of them

wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
#This makes sure that when we expand.grid it saves the combinations as factors
combos

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
#Next make a lookup table
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, 
          "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]
head(combos, 3)
#This generates the columns with the probabilities.
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
head(combos,3) #head of combos with 3 rows
sum(combos$prob)
#This shows that the probabilities sum to one so our math is correct
symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
score(symbols)

#New section for loops

#for (valie in that){
 # do this
#}

for (value in c("My", "first", "for", "loop")) {
  print("one run")
}
#Prints one run number of timesi n array 
#value can be changed for word, string, i, or anything etc..

words <- c("My", "fourth", "for", "loop")
chars <- vector(length = 4)
for (i in 1:4) {
  chars[i] <- words[i]
}
chars

#Now make a for loop for prize in combos
combos$prize <- NA
head(combos, 3)

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
#This builds a for loob that goes throguh all of the rows and computes score on each entry

sum(combos$prize * combos$prob)
## 0.538014

#11.4 While Loops 
# while (condition) {
#   code
# }
#This takes the code and says while this condition is TRUE then it runs the code

plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  while (cash > 0) {
    cash <- cash - 1 + play()
    n <- n + 1
  }
  n
}
#this simulates a slot machien and returns the number of times the user gto to play

plays_till_broke(100)

#Repeat loops 
#repeat loops are even more basic than while loops. They will repeat a chunk of code until you tell them to stop (by hitting Escape) or until they encounter the command break, which will stop the loop.
plays_till_broke <- function(start_with) {
  cash <- start_with
  n <- 0
  repeat {
    cash <- cash - 1 + play()
    n <- n + 1
    if (cash <= 0) {
      break
    }
  }
  n
}

plays_till_broke(100)
## 237

##260