#No.1
library(readxl)     
library(ggplot2)    

data <- read_excel("Data Tugas Tuton STDA4101-2025.2.xlsx", sheet = "2024.2")

ggplot(data, aes(x = GLU, y = Y)) +
  geom_point(color = "steelblue", size = 3, alpha = 0.7) +  
  geom_smooth(method = "lm", se = FALSE, color = "red", linetype = "dashed")+ 
  labs(
    title = "Scatter Plot Bivariat : Hubungan antara GLU dan Y",
    subtitle = "Menunjukkan arah dan kekuatan hubungan kadar gula darah (GLU) terhadap,perkembangan penyakit setelah satu tahun (Y)",
    x = "Blood Sugar (GLU)",
    y = "Year (Y)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12)
)
