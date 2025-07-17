source("analise.r")

#==================== items x tipo de cliente ====================#
print(ggplot(dados_trabalho, aes(x = Type.of.Customer, y = Items, fill = Type.of.Customer)) +
  geom_boxplot() +
  labs(title = "Distribuição de Items por Tipo de cliente", x = "Tipo de cliente", y = "Número de Items") +
  theme_minimal())