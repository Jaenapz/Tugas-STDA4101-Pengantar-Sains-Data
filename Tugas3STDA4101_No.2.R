library(readxl)

data <- read_excel("Data Tugas Tuton STDA4101-2025.2.xlsx", sheet = "2024.2")

# Multiple
model_simultan <- lm(Y ~ AGE + LDL + HDL, data = data)
summary(model_simultan)

# Parsial
model_AGE  <- lm(Y ~ AGE, data = data)
model_LDL  <- lm(Y ~ LDL, data = data)
model_HDL  <- lm(Y ~ HDL, data = data)

summary(model_AGE)
summary(model_LDL)
summary(model_HDL)
