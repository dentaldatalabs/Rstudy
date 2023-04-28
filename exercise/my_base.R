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

getwd()
setwd('exercise')
setwd('~/R-skku-biohrs/data')
getwd()
ex <- read.csv("example_g1e.csv")
head(ex)

library(readxl)
ex.excel <- read_excel("example_g1e.xlsx", sheet = 1)

library(haven)
ex.sas <- read_sas("example_g1e.sas7bdat")
ex.spss <- read_sav("example_g1e.sav")
head(ex.spss)
write.csv(ex, "example_g1e_ex.csv", row.names = F)


head(ex, 6)
head(ex, 100)
str(ex)

head(ex)

str(ex)
names(ex)
colnames(ex)
dim(ex)

nrow(ex)
ncol(ex)
class(ex)
class(ex.spss)

summary(ex)


ex$EXMD_BZ_YYYY
class(ex$EXMD_BZ_YYYY)
ex[, "EXMD_BZ_YYYY"] 
ex[["EXMD_BZ_YYYY"]]
ex[, 1]
names(ex)
ex$HME_YYYYMM

class(ex[, c("EXMD_BZ_YYYY", "RN_INDI", "BMI")])

ex$EXMD_BZ_YYYY[1:50]
ex[1:50, 1]


mean(ex$BMI)
BMI_cat <- (ex$BMI >= 25)
table(BMI_cat)
rows <- which(ex$BMI >= 25)
rows
values <- ex$BMI[ex$BMI >= 25]
values
BMI_HGHT_and <- (ex$BMI >= 25 & ex$HGHT >= 175)
BMI_HGHT_and
BMI_HGHT_or <- (ex$BMI >= 25 | ex$HGHT >= 175)
BMI_HGHT_or


ex$zero <- 0
ex$zero
ex$BMI_cat <- BMI_cat
ex$BMI_cat
ex$BMI_cat <- as.integer(BMI_cat)
ex$BMI_cat
ex$BMI_cat <- as.character(BMI_cat)
ex$BMI_cat

vars.cat <- c("RN_INDI", "Q_PHX_DX_STK", "Q_PHX_DX_HTDZ", "Q_PHX_DX_HTN", "Q_PHX_DX_DM", "Q_PHX_DX_DLD", "Q_PHX_DX_PTB", 
              "Q_HBV_AG", "Q_SMK_YN", "Q_DRK_FRQ_V09N")

vars.cat
names(ex)[c(2, 4:12)]
vars.cat <- c("RN_INDI", grep("Q_", names(ex), value = T))
vars.cat

vars.conti <- setdiff(names(ex), vars.cat)
vars.conti


for (vn in vars.cat){
  ex[,vn] <- as.factor(ex[,vn])
}

for (vn in vars.conti){
  ex[,vn] <- as.numeric(ex[,vn])
}
summary(ex)
str(ex)

ex$Q_PHX_DX_STK
as.numeric(ex$Q_PHX_DX_STK) 
as.numeric(as.character(ex$Q_PHX_DX_STK))
ll <- list(ex$Q_PHX_DX_STK,
     as.numeric(ex$Q_PHX_DX_STK) ,
     as.numeric(as.character(ex$Q_PHX_DX_STK)))
sapply(ll, class)
ll

ex$HME_YYYYMM
addDate <- paste(ex$HME_YYYYMM, "01", sep = "")
ex$HME_YYYYMM <- as.Date(addDate, format = "%Y%m%d")
ex$HME_YYYYMM
class(ex$HME_YYYYMM)
head(ex$HME_YYYYMM)


tapply(ex$LDL, ex$EXMD_BZ_YYYY, mean)
ex$EXMD_BZ_YYYY
class(ex$EXMD_BZ_YYYY)
tapply(ex$LDL,ex$EXMD_BZ_YYYY, 
       function(x){
         mean(x, na.rm =T)
       })


EDA_rm_NA <- function(data_df){
  # 결측치 개수 확인
  count_NA <- count_NA_column(data_df)
  
  #NA가 적어도 하나 있는 열들만
  least_one_NA <- which(count_NA != 0)
  
  # 있으면 결측치 / ROW 수
  NA_ratio <- least_one_NA / dim(data_df)[1]
  
  # 결측치 ROW가 0.1 미만인 열의 이름 추출
  filtered_names <- names(which(NA_ratio < 0.1))
  
  # NA 10% 미만인열만 추출
  data_df_under_10 <- data_df[filtered_names]
  
  return(data_df_under_10)
  # 아니라면 변수형 확인
    # 연속형이라면 중간값
    # 범주형이라면 최빈값
  

  
}

#column별 결측치
count_NA_column <- function(data_df){
  #각 column별 NA 갯수
  return(colSums(is.na(data_df)))


  
}

#NA 비율 10% 이상인지 확인
is_NA_over_10_per <- function(NA_count, row_count){
  if (NA_count / row_count >= 0.1){
    return(T)
  } else{
    return(F)
  }
  
}

EDA_rm <- function(data_df){
  count_na <- colSums(is.na(data_df))
  row_count <- dim(data_df)[1]
  for (column in count_na){
    select_column <- data_df[names(column)]
      if (column / row_count >= 0.1){
        data_df <- data_df[-names(column)]
    } else{
        if (is.numeric(select_column)){
          
        }
      }
      
    
  }
}


#if na is over 10% -> rm column
# then if type is conti -> median
# if type is cat -> mode

getwd()
setwd("/Rstudy")
setwd("~/Rstudy/R-skku-biohrs/data/")
ex <- read.csv("example_g1e.csv")
head(ex)
summary(ex)
type(ex)
str(ex)
names(ex)
dim(ex)
nrow(ex)
class(ex)
unique(ex)
mean(ex$WGHT)
names(ex)
vars.cat <- names(ex)[c(2,4:12)]

for (vn in vars.cat){
  ex[, vn] <- as.factor(ex[, vn])
}
summary(ex)
class(ex)
class(ex$EXMD_BZ_YYYY)
names(ex)
class(ex[, "EXMD_BZ_YYYY"])
for (name in names(ex)){
  print(class(ex[,name]))
}

lapply(names(ex), function(name){c(name,class(ex[,name]))})

head(ex)
str(ex)
vars.cat <- names(ex)[c(2,4:12)]
vars.cat
vars.conti <- setdiff(names(ex), vars.cat)
vars.conti

sapply(vars.cat, function(name){ex[, name] <- as.factor(ex[, name])})
sapply(vars.conti, function(name){ex[,name] <- as.numeric(ex[,name])})

summary(ex)
str(ex)
for (vn in vars.cat){                                          ## for loop: as.factor
  ex[, vn] <- as.factor(ex[, vn])
}

for (vn in vars.conti){                                        ## for loop: as.numeric
  ex[, vn] <- as.numeric(ex[, vn])
}

#choose table which NA is >= 10%

filter_10 <- function(table){
  length_of_rows <- nrow(table)
  NA_percent <- sapply(names(table), function(name){(sum(is.na(table[,name]))/length_of_rows) >= 0.1})
  names_filterd <- NULL
  return(ex[,names(subset(NA_percent, !NA_percent))])
    
  
}

str(filter_10(ex))

getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(ex$Q_PHX_DX_STK)

fill_na <- function(filtered_table){ 
  print(str(filtered_table))
  for (name in names(filtered_table)){
    if (is.factor(filtered_table[,name])){
      print(class(filtered_table[,name]))
      mode_of_col <- getmode(filtered_table[,name])
      print(class(getmode(filtered_table[,name])))
      print(class(mode_of_col))
      
      
      filtered_table[,name] <- ifelse(is.na(filtered_table[,name]),getmode(filtered_table[,name]),filtered_table[,name] )
      print(class(filtered_table[,name]))
      filtered_table[,name] <- as.factor(filtered_table[,name])
      print(class(filtered_table[,name]))
      
      print(" ")
    } else if (is.numeric(filtered_table[,name])){
      median_of_col <- median(filtered_table[,name], na.rm = T)
      
      filtered_table[,name] <- ifelse(is.na(filtered_table[,name]), median_of_col, filtered_table[,name])
      print(median_of_col)
      print(" ")
      
    } else {
      
      
    }
   
    
    
  }
  return(filtered_table)
}

result <- fill_na(filter_10(ex))
summary(result)
str(result)

tapply(ex$LDL, ex$EXMD_BZ_YYYY, 
       function(x){
         mean(x, na.rm = T)
       })    
summary(lm(LDL ~ HDL, data = ex))
