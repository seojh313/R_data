x=1:10
arr=array(x,dim=c(2,5))
# 설정된 행,열의 갯수로만 저장공간 제공
arr

#2차원 배열 : 행과 열에 이름 설정
names=list(c("김판석","홍길동","김철수"),c("수학","영어"))
scores = c(88,92,95,100,97,91)
arr = array(scores,dim=c(3,2),dimnames = names)
arr

#특정위치 저장된 값을 변경
arr[3,2]=100
arr

# 1행 데이터 출력
arr[1,]
# 1열 데이터 출력
arr[,1]

arr[3,1]

# 행렬(matrix)
# 행의 갯수만 설정하면 열의 갯수는 자동으로 저장
x =1:12
mtx = matrix(x,nrow=3)
mtx

mtx= matrix(x,nrow=2)
mtx

#행과 열의 이름 지정 데이터가 저장되는 순서를 행 우선으로 설정하는 방법
x = 1:6
names= list(c("가나다","이름"),c("수학","영어","국어"))
mtx=matrix(x,nrow=2,dimnames = names,byrow =TRUE)
mtx

#기존 행렬에 행 추가하는 방법
y=c(7,8,9)
mtx=rbind(mtx,y)
rownames(mtx)[3]="이름임"
mtx

# 기존 행렬에 열 추가
y=c(10,11,12)
mtx=cbind(mtx,y)
colnames(mtx)[4]="수학"
mtx






# ====
# 리스트(list)

lst1 = list(성명="김철수",나이="11",성적=c(70,80))
lst1

lst1.gender=list(성별="성별없음")
lst1 =append(lst,lst.gender,after=1)
lst1


lst2 = list(성명="deb",성별="여",나이=20,성적=c(99,98))

# 두 리스트 merge
listTotal=list(lst1,lst2)
listTotal
#deb 이름만 출력하고자 할때
listTotal[[2]][1]
listTotal[[2]][[1]]
listTotal[[2]]$성명
#deb에 대한 리스트 출력
listTotal[2]
listTotal[[2]]







#========
#데이터프레임 2차원 형태의 테이블 구조에 데이터 저장

df = data.frame(성명=c("김철수","김장수"),성별=c("남","남"),나이=c(11,12),수학=c(93,23))
df
#데이터 프레임 구조
str(df)
#데이터 프레임에 열단위 데이터추가
df= cbind(df,음악=c(30,34))
df

#데이터 프레임에 행단위로 데이터추가
df=rbind(df, data.frame(성명="김가나다",성별="남",나이=21,수학=122,음악=50))
df

#ㄷ데이터프레임에 저장된 요소의 값을 출력          
df[2,3]
#행데이터
df[1,]
#열데이터
df[,4]

#1,3행 데이터
df[-2,]

df[,-3]

#값 변경
df[2,2]="여"
df
