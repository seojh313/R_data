a <- 7
b <- 10
arr <- 1:1000
sum(arr)
mean(arr)

pkg=installed.packages()
pkg

#패키지 설치 경로
.libPaths()
#데이터셋 종류 확인
data(package="datasets")

#직사각형 면적
getRectangleArea = function(w,h){
  area = w*h
  return(area)
}

w =20
h =35

#함수 호출
getRectangleArea(w,h)


y = 0

#3장 데이터 구조
#벡터 : 선형으로 1개이상의 숫자 또는 문자열을 저장가능
#인덱스는 1부터 시작

score = 80
score

score=c(95,78,92)
score

score[2] = 88
score[4] = 100
score

name = c("장발장","팡틴","코제트")
name

name[4] = "서지환"
name


x1 = seq(1,100,b=10)
x1
#연속값 seq로 저장
x1_1 = seq(10,100,by=10)
x1_1

#1씩 증가
x2=1:10
seq(1,10,by=1)
x2

#1씩 감소
x3=10:1
#seq(1,10,by=-1)
x3

x4 = seq(0,10,length.out=5)
x4

x5=c(1,2,3)
y1 =rep(x5,times = 3)
y1

x6=c(1,2,3)
y2 =rep(x6,each=3)
y2

##연산자

#산술 연산자

10^3

a=5
b=5

r1 = a^b
r1

x =c(10,20,30,40)
y=c(1,6,11,16)
w=c(100,200)

x+5
x+y
# 벡터 갯수가 다를때는 갯수가 작은쪽의 인덱스를 반복해서 연산한다
x+w

# 비교연산자 : 비교연산의 결과는 논리값인 true,false
a = 7
b=10

a>b

x=c(10,20,30)
x <= 10
# 벡터 요소중 하나라도 비교연산 결과에 참이 있으면 참
any(x<10)
# 벡터 요소 모두 참이면 참
all(x<=10)

# 벡터에서 20인 요소를 반환
x[x>=20]

# 논리연산자: 참,거짓 반환
x= c(TRUE,TRUE,FALSE,FALSE)
y= c(TRUE,FALSE,TRUE,FALSE)

x|y
x&y
xor(x,y)

!x
#NA(결측치: 누락된 경우)
#Null(변수선언후 초기화 x )
#NaN(0을 0으로 나눈경우)

z=null
z
is.null(z)

k
is.null(k)

y=c(1,2,3,NA,5)
y

z=5/0
z

t= 0/0
t

#요인(factor)
#벡터에 저장된 동일한 값들을 요이능로 찾아 대표값을 
#분류해서 반환 원래 벡터값도 같이 반환함

gender = c("여","남","남","여","여","남")
gender

gender.factor = factor(gender)
gender.factor
