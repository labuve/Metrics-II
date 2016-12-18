setwd ("C:/Users/Mufatima/Documents/EUI/Econometrics II/Problem Set 2")

# Installing package to handle time series data
# install.packages("xts")
# install.packages("tseries")
require(xts)
require(tseries)

# Reading excel file with the data
data <- read.csv("PS2CPI.csv", skip = 10)
data$X <- NULL
data <- data[-1,]
db <- as.xts(data$CPI, order.by = as.Date(as.character(data$Year), "%Y"))
colnames(db) <- c("CPI")

# Fitting an AR(2) model with mean

db$L1CPI <- lag(db, 1:2)
colnames(db) <- c("CPI", "CPI.1", "CPI.2")

fit <- arma(db$CPI, order=c(2,0))
fit

# Installing package to reate output tables
# install.packages("stargazer")
require(stargazer)
stargazer(fit, title = "Regression results", align = TRUE, 
          dep.var.labels = c("CPI"), covariate.labels = c("CPI_{t-1}", "CPI_{t-2}"))
