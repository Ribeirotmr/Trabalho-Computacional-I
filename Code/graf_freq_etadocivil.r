source("analise.r")

#==================== tabela frequencia por estado civil ====================#

barplot(
  tabela_civil$Frequencia_Absoluta[-nrow(tabela_civil)],
  names.arg = tabela_civil$Categoria[-nrow(tabela_civil)],
  main = "Estado Civil",
  col = "green",
  las = 2,
  ylab = "Frequência",
  xlab = "Estado Civil"
)