library(magrittr)
a <- read.csv("smc_example1.csv")
a %>% head

a %>% head

a %>% head(n = 10)
10 %>% head(a, .)
a %>% head(., 10)
a %>% subset(Sex == "M")
a %>% .[.$Sex == "M",]

a %>% .$Sex
a %>% .["Sex"]

a %>% subset(Sex == "M") %>% head

b <- subset(a, Sex == "M")
model <- glm(DM ~ Age + Weight + BMI, data = b, family = binomial)
summ.model <- summary(model)
summ.model$coefficients

a %>% subset(Sex == "M") %>%
  glm(DM ~ Age + Weight + BMI, data = ., family = binomial) %>% 
  summary() %>%
  .$coefficients

a %>% .[.$Age >= 50,] %>% aggregate(. ~ Sex + Smoking, function(x){c(mean = mean(x,), sd = sd(x))})
