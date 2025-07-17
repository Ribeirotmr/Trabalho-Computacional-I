source("analise.r")


#==================== Itens x método de pagamento ====================#

print(ggplot(dados_trabalho, aes(x = Method.of.Payment, y = Items)) +
  geom_boxplot() +
  labs(title = "Relação entre método de pagamento e número de itens"))