library(tidyverse)
install.packages("tzdb")
install.packages("timechange")

dados <- readr::read_csv("/home/est/gfp24/Downloads/Mental Health Dataset.csv")
class(dados)
head(dados)
dados
glimpse(dados)
poland <- subset(dados, Country == "Poland")
dados[, c("Country", "Gender")]


x <- seq(1:10)
y <- sqrt(x)
z <- log(y)

tan(cos(sin(x)))

x %>%
  sqrt() %>%
  log() %>%
  cos() %>%
  tan() 

require(magrittr)

set.seed(123)

rnorm(10)    %>%
  multiply_by(5) %>%
  add(5)     

#####



require(dplyr)
## Atribuição explicita
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))

meu_data_frame = meu_data_frame %>%
  mutate(idade_25 = idade > 25)

glimpse(meu_data_frame)


## Atribuição implicita
meu_data_frame %<>% 
  mutate(idade_50 = idade > 50)%>%
  mutate(idade_30 = idade > 30)
glimpse(meu_data_frame)

##########################

require(data.table)
require(dplyr)
require(tidyr)

car_crash = fread("/home/est/gfp24/Downloads/Brazil Total highway crashes 2010 - 2023.csv.gz")
# Dados extraídos de https://www.kaggle.com/datasets/liamarguedas/brazil-total-highway-crashes-2010-2023

glimpse(car_crash)
