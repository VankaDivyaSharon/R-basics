#VECTOR
remain1
remain1["heart"]
remain2 <- c("heart"=11,"diamonds"=12,"spades"-11,"clubs"13)
remain2
remain2["heart"]
remain2 <- c(1=3, 3=12, 4=11, 5=13)
remain2[1]
remain2["1"]
#MATRIX
m <- matrix(sample(1:15, 12), nrow =3)
m
m[1,3]
m[,1]
m[1,]
m[4]
m[9]
m[1:2,2:3]
m [1:4,3:4]
m <- matrix(c(1:11,'k'),nrow = 3)
m
#LIST
list1 <- list(c(2,5,3),21,3,sin)
list1
n <- c(2,3,4)
s <- c("aa","bb","cc","dd")
b <-c(T,T,F,F)
class(n)
class(s)
class(b)
class(x)
#memory referinsing
x[[2]]
x[2][1]
#update  a pirticular value 
x[[2]][1] <-"ta"
x
x[[4]] <-3
x
#naming the list as user defined
fil <-c("First","second","third","forth")
names(x) <-fil
#assign names to the list
v <-list(Sam=c(2,3,4))
#matrix in a list
list_data <-list("jan","feb","mar"),matrix(c(3,5,7,8,,4), nrow=2),list("green",12,3))
print(list_data[1])
#dataframe
name = c("anne","peet","Cath","Cath","Cath")
age =c(28,30,45,29,55)
child <- c(FALSE,TRUE,FALSE,TRUE,TRUE)
df <- data,fam(name,age,child)
df
class(df)
typeof(df)
#structure of df
str (df)
#name df
names(df) <- c("Name","Age","Child")
#loops
v <- c("HELLO","LOOP")
cnt <- 1
repeat{
   print(v)
   cnt = cnt+1
   if (cnt >5){
    break
  }
}
##WHILE LOOP
V <- c("Hello","while loop")
cnt <- 2
while (cnt < 7){
  print(V)
  cnt = cnt + 1
}
#for loop
V <- LETTERS[1:4]
for (a in V) {
  print(a)
}
for (i in 1:10){
  print(i)
}
#nested for loop
Nested_for <- matrix(nrow = 10,ncol = 5)
for(i in 1:dim(Nested_for)[1]) {
   for(j in 1:dim(Nested_for)[2]) {
    Nested_for[i,j] = i*j
   }
}
Nested_for


#Brek/next
x <- 1:5

for (val in x) {
   if (val ==3) {
     next
     #break
     }
  print(val)
}

#PAckages
library()
install.packages("dplyr")
library(dplyr)
data()
data(mtcars)
head(mtcars)
str(mtcars)
View(mtcars)
#base package
#filter or subset
mtcars[mtcars$cyl==8 & mtcars$gear==5,]
#dplyr approach
#1.filter
filter(mtcars,cyl==8&gear==5)

filter(mtcars,cyl==8&gear==5)
# we caan use in operator
filter(mtcars,cyl %in%c(6,8))
#converting the rows in to columns
temp <- mtcars
temp$myNames <- rownames(temp)
filter(temp,cyl==8,gear==5)
#picking by using the car names
mtcars[,c("mpg","cyl","gear")]

#2.sececting the pirticular package
mtcars[,c("mpg","cyl","gear")]
#Use: to select multiple columns that match columns by name
select(mtcars,mpg:disp,"gear","carb")

select(mtcars,mpg:disp,contains("ge"),contains("carb"))

#to exclude a pirticular column
select(mtcars,c(-gear,-carb))

select(mtcars,-contains("ge"))

filter(select(mtcars,gear,carb,cyl),cyl==8|cyl==6)


#starts with pirticular letter or name 
head(select(mtcars,starts_with("c")))

#ENDS WITH
head(select(mtcars,ends_with("t")))
3.#Arranging the order
mtcars[order (mtcars$cyl),c("cyl","disp","gear")]

#DECENDING ORDER
mtcars[order(mtcars$cyl,decreasing = T),c("cyl","gear")]

mtcars[order(mtcars$cyl,mtcars$gear,decreasing = T),c("cyl","gear")]

#TO DO ASSENDING AND DECENDING ORDER(to reverse )
mtcars[order(mtcars$cyl,rev(mtcars$gear),decreasing = F),c("cyl","gear")]
#by using the decrese ==T
mtcars[order(mtcars$cyl,rev(mtcars$gear),decreasing = T),c("cyl","gear")]

#3.ARRANGING
arrange(mtcars,cyl)
arrange(select(mtcars,"cyl","gear"),cyl)
arrange(select(mtcars,"cyl","gear"),cyl,gear)
arrange(select(mtcars,"cyl","gear"),desc(cyl))
arrange(select(mtcars,"cyl","gear"),desc(gear))

#4.mutate:adda new vriable
#base R approach
temp <- mtcars
temp$new_variable <-temp$hp + tem$wt
str(temp)
temp$new_variable <- NULL
str(temp)

#dplyr Approach
temp <- mutate(temp,mutate_new = temp$hp + temp$wt)
str(temp)

#fetch the unique values in data frame
#base package approach -uniquefunction
#unique()

unique(mtcars$cyl)
unique(mtcars[["cyl"]])
unique(mtcars["cyl"])
unique(mtcars[c("cyl","gear")])

#dplyr approach

distinct(mtcars["cyl"])
distinct(mtcars[c("cyl","gear")])

#aggregate()
#base appoach

aggregate(mtcars$mpg, by=list(mtcars$cyl),FUN=mean,na.rm=TRUE)

c(1,2,3,NA,NULL)
sum(10,20)
sum(10,20,NA)
sum(10,20,NA,na.rm = T)

aggregate(mtcars[c("mpg","disp","hp")],by=list(mtcars$cyl,mtcars$gear),FUN=mean,na.rm=TRUE)


#summarise:reduse the variable to the values

summarise(mtcars,avg_mpg = mean(mpg))
summarise(mtcars,avg_mpg = mean(mpg),avg_disp=mean(disp))

group_by(mtcars,cyl)
summarise(group_by(mtcars,cyl),avg_mpg = mean(mpg))
summarise(group_by(mtcars,cyl,gear),avg_mpg = mean(mpg))

#table 
#base approach
table(mtcars$cyl)
library(dplyr)
#merge twodata frames
#creating the data frames
name = c("Anne1","pete","cath","cath1","cath2")
age = c(28,30,25,29,35)
child <- c(FALSE,TRUE,FALSE,TRUE,TRUE)
df <- data.frame(name,age,child)
#SECOND PATH
name = c("Anne1","pete","cath","cath1","cath2")
occupation = c("lawer","doc","CA","Forces","Engg")
df1 <- data.frame(name,occupation)

#merging
merge(df,df1)

#join
#dplyr approach
 inner_join(df,df1)
 inner_join(df,df1,by ="name")
 left_join(df,df2,by = c("name" = "name1"))
 left_join(df,df2,by = c("name"= "name1","age","age1"))
 
 
 #pipe
 
 head(select(mtcars,cyl,gear))
 
 mtcars 
   select(cyl,gear)
   head
 
 mtcars 
   arrange(cyl)
   head(20)
   
#ASSIGNMENT 2
  mtcars %>%
   select(mpg:drat,gear,carb)%>%
   arrange(desc(gear))%>%
   filter(cyl == 8)
  library(dplyr)
  #ASSIGNMENT 3
  mtcars %>%
    summarise(standard_deviation =sd(disp),Minimum = min(disp),Maximum =max(disp),Mean = mean(disp),Median = median(disp))
  #ASSIGNMNT 4
  mtcars %>%
    group_by(cyl)%>%
    summarise(standard_deviation =sd(disp),Minimum = min(disp),Maximum =max(disp),Mean = mean(disp),Median = median(disp))

  
  
  # installing the sequl ackage
install.packages("sqldf")
    library(sqldf)
sqldf("SELECT * FROM mtcars WHERE gear = 4 ")
  

install.packages("xlsx")
library(RSQLServer)
head(select(mtcars, cyl, gear))
install.packages("dplyr")
library(dplyr)
mtcars %>% 
  select(cyl, gear) %>% 
  head


mtcars %>%
  arrange(cyl) %>%
  head(20)


mtcars %>%
  select(cyl,gear,disp) %>%
  arrange(cyl) %>%
  head(20)

install.packages("xlsx")
library(xlsx)
input_excel <- read.xlsx("Mushroom Subset.xlsx",sheetIndex = 1)


#1. READ THE FILE
  setwd("C:\\Users\\DIVYA V.SHARON\\Downloads\\R exercise data")
read.csv("train.csv")

#1
table(train$stay_In_Current_City_Years)
train$stay_In_Current_City_Years1=as.character(train$stay_In_Curent_City_years)
train$stay_In_Current_City_Years1=ifelse(train$stay_In_Current_City_Years1=="4+",4, train$stay_In_Current_City_Years1)

#2
nrow(train[train$maritalStatus== 0,])

#7
a==data.frame(table(train$Product_Id))
names(a=c("product_id","freq"))
b=a[order(a$freq,decreasing = T),b[1,1]]

#9
aggregate(trin$purchase,list(train$Gender),mean)

setwd("C:\\Users\\DIVYA V.SHARON\\Downloads\\R exercise data")
read.csv("test.csv")

nrow(test[test$Age == 26-35,])
library(RSQLServer)
install.packages("RSQLServer")

install.packages("reshape")
library(reshape)

install.packages("titanic")
library(titanic)

class(titanic_train)

str(Titanic)

names(titanic_train)

head(titanic_test)

train=read.csv("train.csv")
read.csv("C:\\Users\\DIVYA V.SHARON\\Downloads\\R exercise data")

train$Stay_In_Current_City_Years=as.character(train$Stay_In_Current_City_Years)
train$Stay_In_Current_City_Years=ifelse(train$Stay_In_Current_City_Years=="4+",4,train$Stay_In_Current_City_Years)

#18-07-18
#hypohesis testing
#two sample one sided test
#cpmparision o means
 
boys = c(6,8,9,4,7,5,7,8,5,6,7,,8,9,1,4,3,4,,1)
length(boys)
girls = c(4,9,7,3,6,4,8,9,2,4,9,4,2,8,4,1,5,9)
length(girls)


