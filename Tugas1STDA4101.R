# ==========================================================
# Tugas 1 STDA4101 Pengantar Data Science
# ==========================================================

#Panggil Library
library(readxl)
library(moments)
library(ggplot2)

# Membaca data dari Excel
data <- read_excel("Data Tugas Tuton STDA4101-2025.2.xlsx", sheet = "2024.2")

# Hanya Mengambil kolom numerik yang relevan
data <- data[, c("Y", "AGE", "LDL", "HDL", "TCH", "LTG", "GLU")]

# Menghitung Ukuran Pemusatan Data
nilai_mean <- sapply(data, mean, na.rm = TRUE)
nilai_median <- sapply(data, median, na.rm = TRUE)
nilai_mode <- sapply(data, function(x) {
  uniqx <- unique(x)
  uniqx[which.max(tabulate(match(x, uniqx)))]
})

# Menghitung Ukuran Penyebaran Data
nilai_range<- sapply(data, function(x) max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
nilai_var <- sapply(data, var, na.rm = TRUE)
nilai_sd <- sapply(data, sd, na.rm = TRUE)

# Menentukan Bentuk Distribusi Data (Skewness dan Kurtosis)
nilai_skewness <- sapply(data, skewness, na.rm = TRUE)
nilai_kurtosis <- sapply(data, kurtosis, na.rm = TRUE)

# Menentukan bentuk distribusi (Symmetry)
bentuk_distribusi <- ifelse(nilai_skewness > 0, "Miring ke kanan (positif)",
                            ifelse(nilai_skewness < 0, "Miring ke kiri (negatif)", "Simetris"))

# Menampilkan hasil
hasil <- data.frame(
  Mean = nilai_mean,
  Median = nilai_median,
  Mode = nilai_mode,
  Range = nilai_range,
  Variance = nilai_var,
  SD = nilai_sd,
  Skewness = nilai_skewness,
  Kurtosis = nilai_kurtosis,
  Bentuk_Distribusi = bentuk_distribusi
)

hasil_round[, 1:8] <- round(hasil_round[, 1:8], 3)
print(hasil_round)

# Visualisasi Quartile Plot (Boxplot)
data_long <- reshape2::melt(data)
ggplot(data_long, aes(x = variable, y = value, fill = variable)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Boxplot Data Univariat Tugas 1", x = "Variabel", y = "Nilai") +
  theme(legend.position = "none")
