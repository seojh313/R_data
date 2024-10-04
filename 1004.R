install.packages("dplyr")
install.packages("gapminder")

library(dplyr)
library(gapminder)

gapminder

df = gapminder %>% filter(country == "Finland"|country == "Korea, Rep."|country=="Vietnam")

df
install.packages("gganimate")
library(gganimate)
install.packages("ggplot2")  # ggplot2 패키지 설치 (한 번만 실행)
library(ggplot2)  # ggplot2 패키지 로드

anim=ggplot(df,aes(x=gdpPercap,y=lifeExp,size=pop,colour=country))+
  geom_point(alpha=0.5)+
  scale_size(range=c(5,15))+
  labs(title="연도:frame_time",x="1인당 GDP",y="기대수명")+
  transition_time(year)+
  shadow_wake(0.5)

animate(anim,width=500,height=400,duration=10,renderer=gifski_renderer(loop=FALSE))

install.packages("magick")
library(magick)

bg =image_read("C:/R_data/background.png")
target = image_read("C:/R_data/target.png")
arrow = image_read("C:/R_data/arrow.png")

print(bg)

arrow = image_rotate(image_background(arrow,"none"),-11)
print(arrow)

# 이미지 크기 조정

bg = image_scale(bg, "600x300!")

target = image_scale(target, "80x170!")

arrow = image_scale(arrow, "100x25!")


#이미지 합성 
bg2 = image_composite(bg,target,offset=geometry_point(450,80))
print(bg2)

#화살위치
x=0
y=200
         
while(TRUE){
  position=geometry_point(x,y)
  
  img=image_composite(bg2,arrow,offset=position)
  
  print(img)
  
  Sys.sleep(0.1)
  #x축 값 400이 되면 반복문 종료
  if(x==400)
    break
  
  x=x+20
  y=y-4
}

# 초기 설정
x = 0
y = 190
y_min = 100  # y축 최소값 (최저점)
x_max = 400  # x축 최대값
x_mid = x_max / 2  # 포물선의 중간 지점

while(TRUE) {
  # x가 중간 지점(x_mid)까지는 y를 감소시키고, 그 이후로는 증가시킴
  if(x <= x_mid) {
    y = y - 10  # 중간 지점까지 y값 감소
  } else {
    y = y + 10  # 중간 지점 이후 y값 증가
  }
  
  position = geometry_point(x, y)  # x, y 포인트 위치 계산
  
  img = image_composite(bg2, arrow, offset = position)  # 화살 이미지 배치
  
  print(img)  # 현재 이미지 출력
  
  Sys.sleep(0.1)  # 일정 시간 대기
  
  # x축 값이 400이 되면 반복문 종료
  if(x == 400)
    break
  
  # x 값을 20씩 증가시키며 이동
  x = x + 20
}

