#2
library(readxl)

data <- read_excel("Data Tugas Tuton STDA4101-2025.2.xlsx", sheet = "2024.2")

model <- lm(Y ~ GLU, data = data)

summary(model)
