# 3E.3: Locality price trend chart generator

args <- commandArgs(trailingOnly = TRUE)
output_path <- args[1]
years <- c(2022, 2023, 2024)
prices <- as.numeric(args[2:4])

png(filename = output_path, width = 800, height = 500)
plot(
  years,
  prices,
  type = "o",
  col = "blue",
  xlab = "Year",
  ylab = "Average Price",
  main = "Locality Price Trend"
)
dev.off()
