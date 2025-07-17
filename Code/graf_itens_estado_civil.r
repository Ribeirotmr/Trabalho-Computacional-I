source("analise.r")



#==================== items x estado civil ====================#
print(ggplot(dados_trabalho, aes(x = Marital.Status, y = Items, fill = Marital.Status)) +
  geom_boxplot() +
  labs(title = "Distribuição de Items por Estado Civil", x = "Estado Civil", y = "Número de Items") +
  theme_minimal())