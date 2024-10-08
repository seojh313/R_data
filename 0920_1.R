# 4장 그래프
# 막대그래프
library(ggplot2)
dept = c("영업1팀","영업2팀","영업3팀")
sales = c(12,5,8)
df1 = data.frame(부서=dept,매출=sales,분기="1분기")
df1

# 막대그래프(그래프)
ggplot(data=df1,aes(x=부서,y=매출))+ 
  geom_bar(stat = "identity")+
  labs(title = "팀별 영업실적",x="부서명",y="매출(억원)")


ggplot(data=df1,aes(x=부서))+ 
  geom_bar(stat = "count")+
  labs(title = "팀별 영업실적",x="부서명",y="매출 건수")


ggplot(data=df1,aes(x=부서,y=매출,fill=부서))+ 
  geom_bar(stat = "identity")+
  labs(title = "팀별 영업실적",x="부서명",y="매출(억원)")

install.packages("scales")
library(scales)
hex=hue_pal()(6)
show_col(hex)

library(ggplot2)
ggplot(data=df1,aes(x=부서,y=매출))+ 
  geom_bar(stat = "identity",fill=c("blue"),color="black")+
  labs(title = "팀별 영업실적",x="부서명",y="매출(억원)")

ggplot(data=df1,aes(x=부서,y=매출))+ 
  geom_bar(stat = "identity",fill=rainbow(3),color="black")+
  labs(title = "팀별 영업실적",x="부서명",y="매출(억원)")


x= rep(1,12)
pie(x,labels=seq(1,12),col=rainbow(12))
pie(x,labels=seq(1,12),col=heat.colors(12))
pie(x,labels=seq(1,12),col=terrain.colors(12))
pie(x,labels=seq(1,12),col=topo.colors(12))
pie(x,labels=seq(1,12),col=cm.colors(12))

install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

dept = c("영업1팀","영업2팀","영업3팀")
sales = c(10,8,5)
df2 = data.frame(부서=dept,매출=sales,분기="2분기")

df=rbind(df1,df2)
df

library(ggplot2)
ggplot(df,aes(x=부서,y=매출,fill=분기))+
  geom_bar(stat="identity")

dept = c("영업1팀","영업2팀","영업3팀")
sales = c(7,10,11)
df3 = data.frame(부서=dept,매출=sales,분기="3분기")
df= rbind(df,df3)
df

# 막대그래프(그래프)
ggplot(data=df,aes(x=부서,y=매출,fill=분기))+ 
  geom_bar(stat = "identity",fill=cm.colors(9),color="pink")+
  labs(title = "부서 분기별 영업실적",x="부서명",y="영업매출(억원)")

ggplot(data=df,aes(x=부서,y=매출,fill=분기))+ 
  geom_bar(stat = "identity")+
  scale_fill_manual(values=c("red","black","green"))+
  labs(title = "부서 분기별 영업실적",x="부서명",y="영업매출(억원)")

ggplot(data=df,aes(x=부서,y=매출,fill=분기))+ 
  geom_bar(stat = "identity")+
  scale_fill_manual(values=topo.colors(3))+
  labs(title = "부서 분기별 영업실적",x="부서명",y="영업매출(억원)")

ggplot(data=df,aes(x=부서,y=매출,fill=분기))+ 
  geom_bar(stat = "identity",position="dodge")+
  scale_fill_manual(values=cm.colors(3))+
  labs(title = "부서 분기별 영업실적",x="부서명",y="영업매출(억원)")

ggsave("C:/R_data/graph1.png", width = 10, height = 13, units = "cm")


# 선그래프

month=c(1,2,3,4,5,6)
sales=c(3,3,5,5,7,4)
df1=data.frame(부서="영업1팀",월=month,매출=sales)

sales=c(2,2,4,8,9,6)
df2 =data.frame(부서="영업2팀",월=month,매출=sales)


df= rbind(df1,df2)
df

ggplot(data= df1,aes(x=월,y=매출,group=부서))+
  geom_line()+
  labs(title = "월별매출")

ggplot(data= df2,aes(x=월,y=매출,group=부서))+
  geom_line(color="green",size=2)+
  geom_point(color="red",size=3)+
  labs(title = "월별매출")
  
ggplot(data= df,aes(x=월,y=매출,group=부서,color=부서))+
  geom_line(size=2)+
  geom_point(size=3)+
  labs(title = "월별매출")

ggplot(data= df,aes(x=월,y=매출,group=부서))+
  geom_line(color=cm.colors(12),size=2)+
  geom_point(color=cm.colors(12),size=3)+
  labs(title = "월별매출")

#산포도  
ggplot(data = women,aes(x=height,y=weight))+
  geom_point()+
  labs(title="미국 30~39세 여성의 키,몸무게의 상관관계",x="키(inch)",y="체중(pound)")

ggplot(data = women,aes(x=height,y=weight))+
  geom_point(shape=23,color="tomato",size=2)+
  labs(title="미국 30~39세 여성의 키,몸무게의 상관관계",x="키(inch)",y="체중(pound)")




