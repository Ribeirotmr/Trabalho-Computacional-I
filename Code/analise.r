source("C:/Users/Thierry/Documents/Computacional I/Trabalho/dados.r")
dados_trabalho <- carregar_dados()

library(ggplot2)
library(dplyr)

#==========================================================================
# Dicionário das Variáveis                                                |           
#==========================================================================
# Customer            = Cliente                  (Quantitativa Discreta)  |
# Type of customer    = Tipo de cliente          (Qualitativa Nominal)    |
# Items               = Itens                    (Quantitativa Discreta)  |
# Net sales           = Vendas líquidas          (Quantitativa Contínua)  |
# Method of payment   = Método de pagamento      (Qualitativa Nominal)    |
# Gender              = Gênero                   (Qualitativa Nominal)    |
# Marital status      = Estado civil             (Qualitativa Nominal)    |
# Age                 = Idade                    (Quantitativa Contínua)  |
#==========================================================================


#==============================================================
# Inspecionar dados                                           |
#==============================================================
str(dados_trabalho)                                           # 
summary(dados_trabalho)                                       # 
head(dados_trabalho)                                          # 
tail(dados_trabalho)                                          # 
#==============================================================



#==============================================================
# Dados gerais                                                |
#==============================================================
qtd_observacoes <- nrow(dados_trabalho)
print(qtd_observacoes)

# Regra de Sturges para número de classes
k <- 1 + 3.322 * log10(qtd_observacoes)
arredonda <- ceiling(k)

#==============================================================
# Analise da varivel idade                                    |
#==============================================================
idade_minima <- min(dados_trabalho$Age)
idade_maxima <- max(dados_trabalho$Age)

amplitude_total <- idade_maxima - idade_minima
amplitude_classe <- ceiling(amplitude_total / arredonda)

# Definir classes
classes_idade <- seq(idade_minima, idade_maxima + arredonda, by = amplitude_classe)
idade_classes <- cut(dados_trabalho$Age, breaks = classes_idade, right = FALSE)

# Tabela de frequência para idade
tabela_frequencia_idade <- data.frame(
  Classe = levels(idade_classes),
  Frequencia_Absoluta = as.numeric(table(idade_classes)),
  Frequencia_Relativa = as.numeric(prop.table(table(idade_classes))),
  Frequencia_Relativa_Porcentagem = as.numeric(prop.table(table(idade_classes))) * 100,
  Frequencia_Relativa_Acumulada = cumsum(as.numeric(prop.table(table(idade_classes))))
)

total_frequencia <- data.frame(
  Classe = "Total",
  Frequencia_Absoluta = sum(tabela_frequencia_idade$Frequencia_Absoluta),
  Frequencia_Relativa = 1,
  Frequencia_Relativa_Porcentagem = 100,
  Frequencia_Relativa_Acumulada = NA
)

tabela_idade <- rbind(tabela_frequencia_idade, total_frequencia)



#=============================================================
# Análise de Frequências e Estatísticas Descritivas          |
#=============================================================
criar_tabela_frequencia <- function(dados, variavel) {
  abs <- table(dados[[variavel]])
  rel <- prop.table(abs)
  rel_perc <- rel * 100
  data.frame(
    Categoria = names(abs),
    Frequencia_Absoluta = as.numeric(abs),
    Frequencia_Relativa = round(as.numeric(rel), 4),
    Frequencia_Relativa_Porcentagem = round(as.numeric(rel_perc), 2)
  )
}

adicionar_total <- function(tabela) {
  total <- data.frame(
    Categoria = "Total",
    Frequencia_Absoluta = sum(tabela$Frequencia_Absoluta),
    Frequencia_Relativa = sum(tabela$Frequencia_Relativa),
    Frequencia_Relativa_Porcentagem = 100
  )
  rbind(tabela, total)
}

# Type of Customer
tabela_customer <- criar_tabela_frequencia(dados_trabalho, "Type.of.Customer")
tabela_customer <- adicionar_total(tabela_customer)

# Method of Payment
tabela_payment <- criar_tabela_frequencia(dados_trabalho, "Method.of.Payment")
tabela_payment <- adicionar_total(tabela_payment)

# Gender
tabela_gender <- criar_tabela_frequencia(dados_trabalho, "Gender")
tabela_gender <- adicionar_total(tabela_gender)

# Marital Status
tabela_marital <- criar_tabela_frequencia(dados_trabalho, "Marital.Status")
tabela_marital <- adicionar_total(tabela_marital)



#==================== Estatísticas Descritivas ====================
# Type of customer x Net sales                                    |
# Média, mediana e desvio padrão                                  |
#==================================================================
dados_trabalho$Type.of.Customer <- as.factor(dados_trabalho$Type.of.Customer)
dados_trabalho$Net.Sales <- as.character(dados_trabalho$Net.Sales)
dados_trabalho$Net.Sales <- gsub(",", ".", dados_trabalho$Net.Sales)
dados_trabalho$Net.Sales <- as.numeric(dados_trabalho$Net.Sales)

str(dados_trabalho)

# Estatísticas descritivas por grupo
media_cada_grupo <- aggregate(Net.Sales ~ Type.of.Customer, data = dados_trabalho, FUN = mean)
mediana_por_grupo <- aggregate(Net.Sales ~ Type.of.Customer, data = dados_trabalho, FUN = median)
desvio_padrao_por_grupo <- aggregate(Net.Sales ~ Type.of.Customer, data = dados_trabalho, FUN = sd)

# Teste t
teste <- t.test(Net.Sales ~ Type.of.Customer, data = dados_trabalho)
cat("Teste entre grupos:\n")
print(teste)


