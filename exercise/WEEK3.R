getwd()
ex <- read.csv("example_g1e.csv")
ex.naomit <- na.omit(ex)
ex1 <- ex.naomit
ex1.2012 <- ex1[ex1$EXMD_BZ_YYYY >= 2012, ]
table(ex1.2012$EXMD_BZ_YYYY)

aggregate(ex1[,c("WSTC", "BMI")], list(ex1$Q_PHX_DX_HTN), mean)


aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN, data = ex1, mean)
aggregate(cbind(WSTC, BMI) ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data = ex1, max)
aggregate(ex1[, c("WSTC", "BMI")], list(ex1$Q_PHX_DX_HTN, ex1$Q_PHX_DX_DM), mean)

aggregate(names(ex1) ~ Q_PHX_DX_HTN + Q_PHX_DX_DM, data=ex1, function(x){c(mean = mean(x), sd = sd(x))})
          
help("cbind")
class(WSTC)

ord <- order(ex1$HGHT)
head(ord)
ex1$HGHT[ord]

ord.desc <- order(-ex1$HGHT)
ex1$HGHT[ord.desc]
ex1$Q_PHX_DX_STK[ord.desc]

ex1.sort <- ex1[ord, ]
head(ex1.sort)


library(reshape2)
library(reshape2)
long <- melt(ex1, id = c("EXMD_BZ_YYYY", "RN_INDI"), measure.vars = c("BP_SYS", "BP_DIA"), variable.name = "BP_type", value.name = "BP")
long

melt(ex1, id = c("EXMD_BZ_YYYY", "RN_INDI"), measure.vars = c("BP_SYS", "BP_DIA"), variable.name = "BP_type", value.name = "BP")


ex1[,c("EXMD_BZ_YYYY", "RN_INDI", "BP_SYS", "BP_DIA") ]

result <- melt(ex1, id = c("EXMD_BZ_YYYY", "RN_INDI"), measure.vars = c("BP_SYS", "BP_DIA"), variable.name = "BP_type", value.name = "BP")

wide <- dcast(result, EXMD_BZ_YYYY + RN_INDI ~ BP_type,value.var = "BP" )

ex1.Q <- ex1[,c(1:3, 4:12)]
ex1.measure <- ex1[,c(1:3, 13:ncol(ex1))]
head(ex1.measure)
ex1
head(ex1)

head(ex1)

ex1.merge <- merge(ex1.Q, ex1.measure, by = names(ex1[,1:3]), all = T)

names(ex1[,1:3])
c(names(ex1)[1:3])
c("EXMD_BZ_YYYY", "RN_INDI", "HME_YYYYMM")
