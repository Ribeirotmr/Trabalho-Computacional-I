carregar_dados <- function() {
  dados_trabalho <- read.csv("C:/Users/Thierry/Documents/Computacional I/Trabalho/PelicanStores - Data.csv")
  return(dados_trabalho)
}
dados_trabalho <- carregar_dados()
#View(dados_trabalho)
print(dados_trabalho)



