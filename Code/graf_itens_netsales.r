source("analise.r")


#==================== items x Net sales ====================#
print(ggplot(dados_trabalho, aes(x = Items, y = Net.Sales)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Relação entre Número de Itens e Vendas Líquidas",
       x = "Número de Itens",
       y = "Vendas Líquidas (R$)") +
  theme_minimal())