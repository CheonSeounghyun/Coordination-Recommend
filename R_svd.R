install.packages("svd")
install.packages("lsa")
library(svd)
library(lsa)

movieRating <- matrix(c(
    1,1,1,0,0,
    3,3,3,0,0,
    4,4,4,0,0,
    5,5,5,0,0,
    0,0,0,4,4,
    0,0,0,5,5,
    0,0,0,2,2), byrow = T, nrow=7)

rownames(movieRating) <- c('u1','u2','u3','u4','u5','u6','u7')
colnames(movieRating) <- c('스타워즈','아바타','혹성탈출','사랑과영혼','타이타닉')

movieRating

movieRating_svd <- svd(movieRating)

movieRating_svd

(D <- diag(movieRating_svd$d))

plot(movieRating_svd$d^2/sum(movieRating_svd$d^2), type="l", xlab="Singualar vector",
     ylab = "variance explained")

plot(cumsum(movieRating_svd$d^2/sum(movieRating_svd$d^2)), type="l",
     xlab = "Singular vector", ylab = "Cumulative percent of variance explained")

(U <- movieRating_svd$u[1:7,1:2])

(D <- diag(movieRating_svd$d[1:2]))

(V <- movieRating_svd$v[1:5,1:2])

(movieRating)

(U%*%D%*%t(V))

(movieRating)

cor(t(movieRating))

U

D

V

cor(t(U%*%D%*%t(V)))

# 원본 데이터를 이용한 아이템 간 유사도
cor(movieRating)

# SVD를 수행한 결과 데이터를 이용한 아이템 간 유사도
cor(U%*%D%*%t(V))

# UxD
(U%*%D)

# UxD 유사도
(cor(t(U%*%D)))

# DXVt
(D%*%t(V))

# DXVt 유사도
(cor(D%*%t(V)))

movieRating2 <- matrix(c(
    1,1,1,0,0,
    3,3,3,0,0,
    4,4,4,0,0,
    5,5,5,0,0,
    0,2,0,4,4,
    0,0,0,5,5,
    0,1,0,2,2), byrow = T, nrow=7)

rownames(movieRating2) <- c('u1','u2','u3','u4','u5','u6','u7')
colnames(movieRating2) <- c('스타워즈','아바타','혹성탈출','사랑과영혼','타이타닉')

movieRating2

print("기존의 SVD 결과")
(movieRating_svd)

print("새로운 평점을 추가한 SVD 결과")
(movieRating_svd2 <- svd(movieRating2))

print("기존 SVD 결과")
(diag(movieRating_svd$d))

print("신 SVD 결과")
(diag(movieRating_svd2$d))

movieRating3 <- movieRating
movieRating3 <- rbind(movieRating3, c(4,3,3,3,2))
rownames(movieRating3) <- c('u1','u2','u3','u4','u5','u6','u7','u8')
movieRating3

movieRating_svd3 <- svd(movieRating3)

#U
movieRating_svd3$u

#D
diag(movieRating_svd3$d)

#V
t(movieRating_svd3$v)

# 모든 대각 행렬 사용 시
round(movieRating_svd3$u%*%diag(movieRating_svd3$d)%*%t(movieRating_svd3$v),digits = 2)

# 2개의 대각 행렬 사용 시 
round(movieRating_svd3$u[,1:2]%*%diag(movieRating_svd3$d[1:2])%*%t(movieRating_svd3$v[,1:2]),digits = 2)


#https://leebaro.tistory.com/entry/SVD%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EC%B6%94%EC%B2%9C-%EC%8B%9C%EC%8A%A4%ED%85%9C-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0

