#ch7. 
# 실습: 파생변수 생성하기 
# 단계 1: 데이터 파일 가져오기 

setwd("C:/Rwork")
user_data <- read.csv("Part-II/user_data.csv", header = T)
head(user_data)
table(user_data$house_type)

# 단계 2: 파생변수 생성
house_type2 <- ifelse(user_data$house_type == 1 |
                        user_data$house_type == 2, 0 , 1)
house_type2[1:10]

# 단계 3: 파생변수 추가 
user_data$house_type2 <- house_type2
head(user_data)


# 실습: 1:N의 관계를 1:1 관계로 파생변수 생성하기 
# 단계 1: 데이터 파일 가져오기 
pay_data <- read.csv("Part-II/pay_data.csv", header = T)
head(pay_data, 10)
table(pay_data$product_type)

# 단계 2: 고객별 상품 유형에 따른 구매금액과 합계를 나타내는 파생변수 생성
library(reshape2)
product_price <- dcast(pay_data, user_id ~ product_type,value.var="price",
                       sum, na.rm = T)
head(product_price, 3)
# 단계 3: 칼럼명 수정
names(product_price) <- c('user_id', '식표품(1)', '생필품(2)',
                          '의류(3)', '잡화(4)', '기타(5)')
head(product_price)


# 실습: 고객식별번호(user_id)에 대한 지불유형(pay_method)의 파생변수 생성하기 
# 단계 1: 고객별 지불유형에 따른 구매상품 개수를 나타내는 팡생변수 생성
pay_price <- dcast(pay_data, user_id ~ pay_method,value.var="product_type", length)
head(pay_price, 3)

# 단계 2: 칼럼명 변경하기 
names(pay_price) <- c('user_id', '현금(1)', '직불카드(2)', 
                      '신용카드(3)', '상품권(4)')
head(pay_price, 3)

# 실습: 고객정보(user_data) 테이블에 파생변수 추가하기 
# 단계 1: 고객정보 테이블과 고객별 상품 유형에 따른
#         구매금액 합계 병합하기 
library(plyr)
user_pay_data <- join(user_data, product_price, by = 'user_id')
head(user_pay_data, 10)

# 단계 2: [단계 1]의 병합 결과를 대상으로 고객별 지불유형에 따른
#         구매상품 개수 병합하기 
user_pay_data <- join(user_pay_data, pay_price, by = 'user_id')
user_pay_data[c(1:10), c(1, 7:15)]



# 실습: 사칙연산으로 총 구매금액 파생변수 생성하기 
# 단계 1: 고객별 구매금액의 합계(총 구매금액) 계산하기 
user_pay_data$총구매금액 <- user_pay_data$`식표품(1)` +
  user_pay_data$`생필품(2)` +
  user_pay_data$`의류(3)` +
  user_pay_data$`잡화(4)` +
  user_pay_data$`기타(5)`

# 단계 2: 고객별 상품 구매 총금액 칼럼 확인하기 
user_pay_data[c(1:10), c(1, 7:11, 16)]


# 실습: 정제된 데이터 저장하기 
print(user_pay_data)

setwd("C:/Rwork")
write.csv(user_pay_data, "Part-II/cleanData.csv", quote = F, row.names = F)

data <- read.csv("Part-II/cleanData.csv", header = TRUE)
data




# 실습: 표본 샘플링
# 단계 1: 표본 추출하기 
nrow(data)
choice1 <- sample(nrow(data), 30)
choice1

# 50 ~ (data 길이) 사이에서 30개 행을 무작위 추출 
#(행번호 50부터 전체행data 중 30개 무작위 )
choice2 <- sample(50:nrow(data), 30)
choice2

# 50~100 사이에서 30개 행을 무작위 추출 
choice3 <- sample(c(50:100), 30)
choice3

# 다양한 범위를 지정하여 무작위 샘플링
choice4 <- sample(c(10:50, 80:150, 160:190), 30)
choice4

# 단계 2: 샘플링 데이터로 표본추출 
data[choice1, ] #sample로 뽑은 choice1 행번호, 모든열 
#행을 sample로 뽑고 모든열을을 검색한다는게 포인트




##교차 검정 샘플링
# 실습: iris 데이터 셋을 대상으로 7:3 비율로 데이터 셋 생성하기 
# 단계 1: iris 데이터 셋의 관측치와 칼럼 수 확인
data("iris")
dim(iris)
iris

#행부터 뽑고!! 간다!
# 단계 2: 학습 데이터*70%), 검정 데이터(30%) 비율로 데이터 셋 구성
idx <-sample(1:nrow(iris), nrow(iris) * 0.7)  #1~전체 중 70프로 추출 (행 정보)
training <- iris[idx, ] #해당 샘플 모든 컬럼 추출
testing <- iris[-idx, ] # 해당 샘플을 제외한 행정보에 대한 모든 컬럼 추출 
dim(training)


# 실습: 데이터 셋을 대상으로 K겹 교차 검정 데이터 셋 생성하기 
# 단계 1: 데이터프레임 생성
name <- c('a', 'b','c', 'd', 'e', 'f')
score <- c(90, 85, 99, 75, 65, 88)
df <- data.frame(Name = name, Score = score)
df
# 단계 2: 교차 검정을 위한 패키지 설치 
install.packages("cvTools")
library(cvTools)

# 단계 3: K겹 교차 검정 데이터 셋 생성
cross <- cvFolds(n = 6, K = 3, R = 1, type = "random")
cross
#3-fold CV:    
#  Fold   Index
#1       6
#2       5
#3       3
#1       1
#2       2
#3       4

# 6개 데이터를 무작위로 3개로 쪼개서 교차검정  반복횟수 R =1회 생성 
# Fold: K=3겹 균등분할 횟수,  Index는 행번호 

# 단계 4: K겹 교차 검정 데이터 셋 구조 보기 
str(cross)
cross$which
#which는 Fold의 결과를 vector형태로 보관. 


# 단계 5: subsets 데이터 참조하기 
cross$subsets[cross$which == 1, 1] # Fold 1,2,3의 K=1일때의 
cross$subsets[cross$which == 2, 1]
cross$subsets[cross$which == 3, 1]
#subsets는 Index의 결과를 matrix형태로 보관. 

# 단계 6: 데이터프레임의 관측치 적용하기 
r = 1
K = 1:3
for(i in K) {
  datas_idx <- cross$subsets[cross$which == i, r]
  cat('K = ', i, '검정데이터 \n')
  print(df[datas_idx, ])
  
  cat('K = ', i, '훈련데이터 \n')
  print(df[-datas_idx, ])
}



