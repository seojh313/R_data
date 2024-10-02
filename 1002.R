library(ggplot2)

# 데이터 불러오기
url <- "https://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv"
data <- read.csv(url, header = T)

head(data)

#quantity 설정
quantity <- data$cds
k <- nclass.Sturges(quantity)  #bin 수

ggplot(data = data, aes(x = cds)) +
  geom_histogram(col = "red", fill = "purple", bins = k) +
  labs(title = "CD 거래량의 분포", x = "CD 거래량", y = "빈도수")
