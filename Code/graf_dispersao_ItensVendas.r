source("analise.r")
library(ggplot2)

#==================== Gráfico: Itens x Vendas Líquidas ====================#
print(ggplot(dados_trabalho, aes(x = Items, y = Net.Sales, color = Type.of.Customer)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relação entre Número de Itens e Valor Total da Compra",
    x = "Quantidade de Itens",
    y = "Vendas Líquidas (R$)",
    color = "Tipo de Cliente"
  ) +
  scale_color_manual(values = c("Regular" = "#1f77b4", "Promotional" = "#ff7f0e")) +
  theme_minimal())

