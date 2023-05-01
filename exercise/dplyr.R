library(dplyr)
a <- read.csv("smc_example1.csv")
a %>% 
  filter(Age >= 50) %>% 
  select( -STRESS_EXIST) %>% 
  group_by(Sex, Smoking) %>% 
  summarise_all(list(mean = mean, sd = sd))

a %>% arrange(Age)
a %>% .[.$Age,]
a %>% arrange("Age")

a %>% .[order(.$Age),]

a %>% select(Sex, Age, Height)
a %>% select(Sex:Smoking)

a %>% select(ends_with("date"))

a %>% filter(Sex == "M") %>% select(Sex:HTN) %>% arrange(Age)

a %>% subset(Sex == "M") %>% .[,c(1:7)] %>% .[order(.$Age),]

a %>% mutate(old = as.integer(Age >= 65), overweight = as.integer(BMI >= 27))

a %>% transmute(old = as.integer(Age >= 65), overweight = as.integer(BMI >= 27))

a %>% group_by(Sex, Smoking) %>% 
  summarize(count = n(),
            meanBMI = mean(BMI),
            sdBMI = sd(BMI))
b <- group_by(a, Sex, Smoking)
b %>% summarise_all(funs(mean = mean, sd = sd)) %>% select(Sex, Smoking, ends_with("sd"))


a %>% filter(Age >= 50) %>% group_by(Sex, Smoking) %>% summarise_all(funs(mean = mean, sd = sd))


a %>%
  subset(Age >= 50) %>%
  aggregate(. ~ Sex + Smoking, data = ., function(x){c(mean = mean(x), sd = sd(x))})
