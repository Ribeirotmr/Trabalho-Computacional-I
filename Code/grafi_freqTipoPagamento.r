#source("analise.r")

#==================== tabela frequencia por metodo de pagamento ====================#

barplot(
  tabela_payment$Frequencia_Absoluta[-nrow(tabela_payment)],
  names.arg = tabela_payment$Categoria[-nrow(tabela_payment)],
  main = "Método de Pagamento",
  col = "red",
  las = 2,
  ylab = "Frequência",
  xlab = "Método"
)