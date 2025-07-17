#source("analise.r")

#==================== distribuição de items ====================#

print(ggplot(dados_trabalho, aes(x = Items)) +
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = "lightblue", color = "black") +
  geom_density(alpha = 0.2, fill = "red") +
  labs(title = "Distribuição de Itens por Compra", x = "Número de Itens", y = "Densidade"))
