source("analise.r")

#==================== analise da variavel age ====================#
hist(
  dados_trabalho$Age,
  main = "Idades dos clientes",
  xlab = "Idade",
  ylab = "Frequências",
  breaks = classes_idade,
  col = "violet"
)
