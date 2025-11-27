library(readxl)
library(tidyverse)

data <- read_excel("Data Tugas Tuton STDA4101-2025.2.xlsx", sheet = "2024.2")

df <- data %>% 
  select(Y, AGE, LDL, HDL)

df_long <- df %>%
  pivot_longer(cols = c(AGE, LDL, HDL),
               names_to = "Variabel",
               values_to = "Nilai")

ggplot(df_long, aes(x = Nilai, y = Y, color = Variabel)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE) +
  facet_wrap(~ Variabel, scales = "free_x") +
  theme_minimal(base_size = 13) +
  labs(
    title = "Scatter Plot Multivariat: AGE, LDL, HDL terhadap Y",
    x = "Nilai Variabel",
    y = "Variable Y"
  )
