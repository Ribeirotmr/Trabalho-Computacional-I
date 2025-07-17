#source("analise.r")


#==================== distribuição de items ====================#
print(ggplot(dados_trabalho, aes(y = Items)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Distribuição de Items", y = "Número de Items"))