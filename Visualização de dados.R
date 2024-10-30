#CRIANDO VETORES ALEATÓRIOS

runif(5)
set.seed(123)
runif(5)

rnorm(10)
rpois(10, lambda = 2)

x <- c("tiago", "alex", "lucas")

x <- c(1, 2, 3, 4)
b <-  3
for (b in x) {
  d = b + x
  print (d)
  
}
data(iris)
head(iris, n = 10)
tail(iris)
summary(iris)



































#### aula



vetor_a = c(1,2,3,4)
vetor_b = c(5,6,7,8)

matriz_linha = rbind(vetor_a, 
                     vetor_b)
matriz_linha

matriz_coluna = cbind(vetor_a, vetor_b)
matriz_coluna

class(matriz_linha)

is.matrix(matriz_linha)

A <- matrix(c(1:9), 
            ncol = 3,
            byrow = TRUE)
A


B <- matrix(c(1:9), 
            ncol = 3, 
            byrow = FALSE)
B

B[1:3, -3]






