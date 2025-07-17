source("analise.r")


#==================== items x gênero ====================#

print(
  ggplot(dados_trabalho, aes(x = Gender, y = Items, fill = Gender)) +
    geom_boxplot() +
    labs(title = "Distribuição de Items por Gênero", x = "Gênero", y = "Número de Items") +
    theme_minimal()
)