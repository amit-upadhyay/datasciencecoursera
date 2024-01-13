library(datasets)
data(iris)
?iris

mean(iris[iris$Species == "virginica",]$Sepal.Length)


data(mtcars)
colnames(mtcars)

hp_4cyl <- tapply(mtcars$hp,mtcars$cyl,mean)[1]
hp_8cyl <- tapply(mtcars$hp,mtcars$cyl,mean)[3]
hp_8cyl - hp_4cyl 
