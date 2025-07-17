#source("analise.r")

#==================== boxplot vnedas x tipo cliente ====================#

boxplot(
  Net.Sales ~ Type.of.Customer,
  data = dados_trabalho,
  main = "Net Sales por tipo de cliente",
  ylab = "Vendas líquidas",
  xlab = "Tipo de clientes",
  col = c("#ff7fff", "#d64eff")
)