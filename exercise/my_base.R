x <- c(1, 2, 3, 4, 5, 6)
y <- c(7, 8, 9, 10, 11, 12)
x + y
x * y
sqrt(x)
diff(x)
mean(x)
var(x)
sd(x)
median(x)
IQR(x)
IQR(y)
max(x)
which.max(x)
x <- c(1, 23,54, 123, 2)
which.max(x)
x <- c(1, 2, 3, 4, 5, 6)
max(x, y)
length(x)

x[2]
x[-2]
pmax(x,y)
pmin(x,y)
c(1, 2, 3, 4) -> z
x[1:3]
x[-2:3]
x[c(1,2,3)]
x[c(1,3,4,5,6)]
x>=4
sum(x>4)
sum(x>=3)
x %in% c(1,3,5)
x[x %in% c(1, 3, 5)]
v1 <- seq(-5, 5,by = .2)
v2 <- rep(1,3)
v3 <- rep(c(1,2,3), 2)
v4 <- rep(c(1,2,3), each =2)
v5 <- rep(1:4, 3, each = 2)
v5 <- 1:4
for (i in 1:3){
  print(i)
}
i <- 0
for (j in c(1,2,4,5,6)){
  print(i)
  i <- i + j
}
i

x <- 5

if (x >= 5){
  print('High')
  
} else if (x >= 2){
  print('low')

} else{
  print('Hmm')
}


x <- 1:6
y <- ifelse(x >= 4, "Yes", "No")
x <- c(1:10, 12, 13, NA, NA, 15, 17)
mean(x)
mean0 <- function(x){
  mean(x, na.rm = T)
}
mean0(x)

mean0(c(NA, NA, 1))

twomean <- function(x1, x2){
  a <- (x1 + x2) / 2
  return(a)
}

twomean(4,6)

mat <- matrix(1:20, nrow = 4, byrow = T)
mat
out <- NULL

for (i in 1:nrow(mat)){
  out <- c(out, mean(mat[i, ]))
}
out
 
out <- NULL

for (j in 1:ncol(mat)){
  out <- c(out, mean(mat[,j]))
}
out

sapply(1:nrow(mat), function(x){mean(mat[x, ])})
ll <- lapply(1:nrow(mat), function(x){mean(mat[x, ])})
ll[[1]] <- x
ll
print(ll)

apply(mat, 1, mean)
apply(mat, 2, mean)

rowMeans(mat)
colMeans(mat)
apply(mat, 2, mean)

x <- 1:6
y <- 7:12
max(x)
max(y)

sapply(list(x,y), max)
