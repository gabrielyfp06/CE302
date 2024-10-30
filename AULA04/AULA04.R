#DATA FRAME

# Criando dois arrays
arr1 <- array(1:12, dim = c(3, 2, 2))
arr2 <- array(13:24, dim = c(3, 2, 2))

# Soma de arrays
soma <- arr1 + arr2

# Produto element-wise
produto <- arr1 * arr2

# Média ao longo da terceira dimensão
media <- mean(arr1, dim = 3)

# Exemplo de criação de Data Frame
meu_data_frame <- data.frame(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta')
)

## Nomes de colunas do nosso data.frame não possuem espaço, podem ser separadas por "." ou "_".

meu_data_frame

head(meu_data_frame)

tail(meu_data_frame)

str(meu_data_frame)

# Acessar coluna usando o operador $

meu_data_frame$nome

# Acessar coluna usando colchetes []

meu_data_frame[, "idade"]

meu_data_frame$genero <- c("F", "M", "F", "F", "M", "M", "F", "M")

meu_data_frame$constante = "F"


subconjunto_df <- meu_data_frame[meu_data_frame$idade > 28, ]  # Seleciona pessoas com idade maior que 28
subconjunto_df

# Usando a função subset()
subconjunto_df <- subset(meu_data_frame, idade > 28)
subconjunto_df

subconjunto_combinado <- meu_data_frame[meu_data_frame$idade > 25 & meu_data_frame$idade < 30, ]
subconjunto_combinado


dim(meu_data_frame) ## LINHA E COLUNA

nrow(meu_data_frame) ## LINHA

ncol(meu_data_frame) ## COLUNA

class(meu_data_frame$nome)

class(meu_data_frame$idade)

str(meu_data_frame)

summary(meu_data_frame)

# Exemplo de uso da função by()
resultado <- by(meu_data_frame$salario, meu_data_frame$idade, mean)
resultado

ordenado <- meu_data_frame[order(meu_data_frame$idade), ]

## FATORES

meu_data_frame$estad_doenca <- c("I", "I", "II", "IV", "II", "III", "I", "IV")

meu_data_frame$estad_doenca = factor(meu_data_frame$estad_doenca) 
                            levels = c("I", "II", "III", "IV")
                            
                            
str(meu_data_frame)


## TABELAS DE DUPLA ENTRADA 

# Exemplo de criação de tabela de dupla entrada
sexo <- c("Masculino", "Feminino", "Masculino", "Masculino", "Feminino")
cidade <- c("A", "B", "A", "B", "A")
tabela_contingencia <- table(sexo, cidade)
tabela_contingencia

tabela_contingencia2 <- table(meu_data_frame$meio_de_transporte, meu_data_frame$genero)
tabela_contingencia2

marginais_linhas <- margin.table(tabela_contingencia, 1)  # Somas das linhas
marginais_colunas <- margin.table(tabela_contingencia, 2)  # Somas das colunas

qui_quadrado <- chisq.test(tabela_contingencia)
print(qui_quadrado)

proporcoes_relativas_linha <- prop.table(tabela_contingencia, margin = 1)  # Proporções por linha
proporcoes_relativas_linha

proporcoes_relativas_coluna <- prop.table(tabela_contingencia, margin = 2)  # Proporções por linha
proporcoes_relativas_coluna

## LENDO DADOS

# Lendo os dados de queimadas
Queimadas_Q1 <- read.csv("/home/est/gfp24/Downloads/Dataset_FireWatch_Brazil_Q1_2024.csv")
head(Queimadas_Q1)

Queimadas_Q2 <- read.csv("/home/est/gfp24/Downloads/Dataset_FireWatch_Brazil_Q2_2024.csv")
head(Queimadas_Q2)

Queimadas_Q3 <- read.csv("/home/est/gfp24/Downloads/Dataset_FireWatch_Brazil_Q3_2024.csv")
head(Queimadas_Q3)


# Unindo os três bancos de dados
Queimadas <- rbind(Queimadas_Q1, Queimadas_Q2, Queimadas_Q3)
head(Queimadas)

dim(Queimadas)

write.csv(Queimadas, file = "/home/est/gfp24/Downloads/queimada.csv", row.names = FALSE)


####### EXERCÍCIOS

head(Queimadas, n=9)
tail(Queimadas, n=3)
nrow(Queimadas)
NCOL(Queimadas)
summary(Queimadas)
unique(Queimadas$bioma)
length(unique(Queimadas$bioma))
Queimadas$bioma = factor(Queimadas$bioma)
Queimadas$bioma
nlevels(Queimadas$bioma)
levels(Queimadas$bioma)

SUL = toupper(c("PARANÁ", "SANTA CATARINA", "RIO GRANDE DO SUL"))

SUL = subset(Queimadas, estado %in% SUL)
mean(SUL$avg_numero_dias_sem_chuva)

NORTE = toupper(c("ACRE", "AMAZONAS", "PARÁ", "RONDÔNIA", "RORAIMA"))

NORTE = subset(Queimadas, estado %in% NORTE)
mean(NORTE$avg_numero_dias_sem_chuva)



#########

library(data.table)
# Criar um data.table
meu_data_table <- data.table(
  nome = c("Alice", "Bob", "Carol", "Ana", "João", "Carlos", "Patrícia", "Leonardo"),
  idade = c(25, 30, 28, 20, 27, 50, 60, 45),
  salario = c(5000, 6000, 5500, 8000, 2000, 3500, 10000, 3800 ), 
  meio_de_transporte = c('onibus', 'bicicleta', 'onibus', 'carro', 'carro', 'onibus', 'onibus', 'bicicleta'))
meu_data_table

class(meu_data_table)

# Importar um data.table e comparando o tempo de importação com o read.csv

system.time(Queimadas <- fread("/home/est/gfp24/Downloads/queimada.csv"))

system.time(Queimadas <- read.csv("/home/est/gfp24/Downloads/queimada.csv"))

# Selecionar colunas e filtrar linhas
resultado <- meu_data_table[idade > 25, .(nome, salario)]
resultado

# Agregar dados 
agregado <- meu_data_table[, .(media_salario = mean(salario)),]
agregado

# Agregar dados por idade
agregado_idade <- meu_data_table[, .(media_salario = mean(salario)), by = idade]
agregado_idade

# Agregar dados por meio_de_transporte
agregado_mt <- meu_data_table[, .(media_salario = mean(salario)), by = meio_de_transporte]
agregado_mt

install.packages("tibble")
require(tibble)


### Teste
