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

lst = list(성명="김철수",나이="11",성적=c(70,80))
lst

