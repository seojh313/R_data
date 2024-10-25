install.packages("leaflet")
library(leaflet)

m = leaflet()%>%
  setView(lng=126.996542, lat = 37.5290615,zoom=10)%>%
  addTiles()
m
m = leaflet()%>%
  addTiles()%>%
  addMarkers(lng=126.996542, lat = 37.5290615,label="한국폴리텍대학",popup="서울정수캠퍼스")
m  


m = leaflet() %>%
  setView(lng=127.0974669,lat = 37.2004527,zoom =12)%>%
  addTiles()%>%
  addMarkers(lng=127.1043386,lat=37.1707359,label="ㅇㅇ",popup="dd")
m

m = leaflet() %>%
  setView(lng=127.0974669,lat = 37.2004527,zoom =12)%>%
  addTiles()%>%
  addMarkers(lng=127.1043386,lat=37.8888888,label="ㅇㅇ",popup="dd")%>%
  addMarkers(lng=127.1043386,lat=38.0000000,label="ㅇㅇ2",popup="dd")
m

quakes

m= leaflet(data=quakes)%>%
  addTiles()%>%
  addCircleMarkers(~long,~lat,radius=~mag,stroke=TRUE,weight=1,color="black",fillColor = "red")
m

m= leaflet(data=quakes)%>%
  addTiles()%>%
  addCircleMarkers(~long,~lat,radius=~ifelse(mag>=-6,10,1),stroke=TRUE,weight=1,color="black",fillColor = "red")
m

# 지진규모가 5.5이상이면 반지름 10, 그렇지 않으면 0
# 지진규모 5.5이상이면 테두리선 굵기 1 아니면 0
# 5.5 이상이면 불투명도 0.3아니면0

m <- leaflet(data = quakes) %>%
  addTiles() %>%
  addCircleMarkers(
    ~long, ~lat,
    radius = ~ifelse(mag >= 5.5, 10, 0),  # 지진 규모 5.5 이상이면 반지름 10, 아니면 0
    stroke = TRUE,
    weight = ~ifelse(mag >= 5.5, 1, 0),  # 지진 규모 5.5 이상이면 테두리선 굵기 1, 아니면 0
    color = "black",
    fillColor = "red",
    fillOpacity = ~ifelse(mag >= 5.5, 0.3, 0)  # 지진 규모 5.5 이상이면 불투명도 0.3, 아니면 0
  )
m


m <- leaflet(data = quakes) %>%
  addTiles() %>%
  addCircleMarkers(
    ~long, ~lat,
    radius = ~ifelse(mag >= 5.5, 10, 0),  # 지진 규모 5.5 이상이면 반지름 10, 아니면 0
    stroke = TRUE,
    weight = ~ifelse(mag >= 5.5, 1, 0),  # 지진 규모 5.5 이상이면 테두리선 굵기 1, 아니면 0
    color = "black",
    fillColor = ~ifelse(mag >= 6, "red", ifelse(mag >= 5.5, "green", NA)),  # 규모 6 이상은 빨강, 5.5~6은 초록, 나머지는 없음
    fillOpacity= ~ifelse(mag >= 5.5, 0.3, 0)  # 지진 규모 5.5 이상이면 불투명도 0.3, 아니면 0
  )
m   
install.packages("sf")
library(sf)
library(ggplot2)
df_map = st_read("C:/R_data/Z_NGII_N3A_G0010000.shp")

ggplot(data=df_map)+
  geom_sf(fill="white",color="black")

if(!"id"%in%names(df_map)){
  df_map$id = 1:nrow(df_map)
}

ggplot(data=df_map)+
  geom_sf(aes(fill=id),alpha=0.3,color="black")+
  theme(legend.position="none")
  labs(x="경도",y="위도")
    
  
  
install.packages("openxlsx")
library(openxlsx)  

df = read.xlsx("C:/R_data/국내지진목록.xlsx",sheet=1,startRow=4,colNames = FALSE)
head(df)

#x8열 북한으로 시작하는 데이터 행 번호 추출
idx = grep("^북한",df$X8)
#8열 확인
df[idx,'X8']
#8열 확인 삭제
df=df[-idx,]

#df에 있는 6열과 7열의 데이터중 n과 e삭제
df[,6]=gsub("N","",df[,6])
df[,7]=gsub("E","",df[,7])

df[,6] = as.numeric(df[,6])
df[,7] = as.numeric(df[,7])

df[,6]
print(df)

#행정경계지도 지진분포 출력
map = st_read("C:/R_data/Z_NGII_N3A_G0010000.shp")

map = st_transform(map,crs=4326)

df_sf =df%>%st_as_sf(coords = c("X7","X6"),crs=4326)


ggplot() +
  geom_sf(data=map,fill="white",alpha=0.5,color="black")+
  geom_sf(data=df_sf,aes(size=X3),shape=21,fill="red",alpha=0.3,color="black")
  theme(legend.position="none")+
  labs(title="지진분포",x="경도",y="위도")