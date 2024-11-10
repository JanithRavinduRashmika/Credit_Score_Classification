library(FactoMineR)
library(factoextra)
setwd("E:\\Credit_Score_Classification\\Notebooks")

data <- read.csv("../Data/cleanedNotRecoded.csv")

data$Month <- as.factor(data$Month)
data$Payment_Behaviour <- as.factor(data$Payment_Behaviour)
data$Payment_of_Min_Amount <- as.factor(data$Payment_of_Min_Amount)
data$Credit_Mix <- as.factor(data$Credit_Mix)

str(data)

df <- data[, -c(1,2,4,6,7,28)]

str(df)

res.famd = FAMD(df,graph=FALSE, ncp=15)
res.famd$eig


fviz_eig(res.famd, ncp=15)

library(corrplot)
corrplot(res.famd$var$coord)


fviz_famd_var(res.famd,'quali.var', repel=TRUE)
fviz_famd_var(res.famd,'quanti.var', repel=TRUE)

res.famd$var$coord


