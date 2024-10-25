install.packages("rvest")
library(rvest)

# 영화목록 추출
url="C:/R_data/영화1.html"
html= read_html(url,encoding="utf-8")
html

movie=html_nodes(html,"table tr td")%>%
      html_text()

movie

# 영화2에 있는 2개의 테이블중 table태그에 설정된 id값에 따라 필요한 데이터만 추출
url="C:/R_data/영화2.html"
html=read_html(url,encoding="utf-8")
html

movie=html_nodes(html,"#movie1 tr td")%>%
      html_text()

movie

#제목,예매율(1,2데이터)부분만 삭제해서 데이터를 추출
movie1=html_nodes(html,"#movie1 tr td")[c(-1,-2)]%>%
  html_text()

movie1

# 영화 3 데이터 중 ㅈ클래스가 title1인것만 추출
url="C:/R_data/영화3.html"
html=read_html(url,encoding="utf-8")
html

#현재 상영중 클래스가 title1인 영화 제목만 출출
movie3=html_nodes(html,".title1")%>%
  html_text()

movie3
# '' 클래스가 rate1 추출
movie4=html_nodes(html,".rate1")%>%
  html_text()

movie4