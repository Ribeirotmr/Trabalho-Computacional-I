source("analise.r")

#==================== tabela frequencia por estado civil ====================#

barplot(
  tabela_marital$Frequencia_Absoluta[-nrow(tabela_marital)],
  names.arg = tabela_marital$Categoria[-nrow(tabela_marital)],
  main = "Estado Civil",
  col = "green",
  las = 2,
  ylab = "Frequência",
  xlab = "Estado Civil"
)
