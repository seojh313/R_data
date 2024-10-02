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


install.packages("gganimate")
install.packages(("gifski"))
library(gganimate)
library(ggplot2)

dept = c("영업1팀","영업2팀","영업3팀")
sales = c(12,5,8)
df1 = data.frame(부서=dept,매출=sales,분기="1분기")

df1

sales = c(10,8,5)
df2=data.frame(부서=dept,매출=sales,분기="2분기")

df2

df = rbind(df1,df2)

df


anim=ggplot(df,aes(x=부서,y=매출,fill= 분기))+
   geom_bar(stat="identity")+
   labs(title="부서별 분기별 영업실적")+
   transition_states(분기)

animate(anim,width=300,height=200,duration=2, renderer=gifski_renderer(loop=FALSE))

anim_save("분기부서 별 영업 실적.gif",path = 'C:/R_data')


iris

ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,fill= Species,color=Species))+
  geom_point(size=3,alpha=0.5)+
  labs(title="꽃 받침 크기와 종의 분포도",x="꽃받침 길이",y="꽃받침 너비")+
  transition_states(Species)

animate(anim, width=400,height=300, duration=3,renderer = gifski_renderer(loop=TRUE))
anim_save("꽃 받침,종 분포.gif",path = 'C:/R_data')


month=c(1,2,3,4,5,6)
sales=c(3,3,5,5,7,4)
df1=data.frame(부서="영업1팀",월=month,매출=sales)

sales=c(2,2,4,8,9,6)
df2 =data.frame(부서="영업2팀",월=month,매출=sales)

df = rbind(df1,df2)

ggplot(data =df ,  aes(x=월,y= 매출,group=부서))+
  geom_line(aes(color=부서),size=2)+
  geom_point(aes(color=부서),size=5,alpha=0.5)+
  labs(title="부서별 월별 매출액",x="월",y="매출액(억)")+
  transition_reveal(월)