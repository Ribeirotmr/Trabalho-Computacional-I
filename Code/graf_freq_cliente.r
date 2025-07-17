#source("analise.r")

#==================== tabela frequencia por tipo de cliente ====================#

tabela_cliente_plot <- tabela_customer[tabela_customer$Categoria != "Total", ]
barplot(
  tabela_cliente_plot$Frequencia_Absoluta,
  names.arg = tabela_cliente_plot$Categoria,
  main = "Frequência por Tipo de Cliente",
  col = "purple",
  las = 2,
  ylab = "Frequência",
  xlab = "Tipo de Cliente"
)