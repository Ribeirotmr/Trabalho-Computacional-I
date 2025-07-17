source("analise.r")

#==================== Novas variáveis ====================#
dados_trabalho <- dados_trabalho %>% 
  mutate(
    Age_Group = idade_classes,  
    Ticket_Medio = Net.Sales / Items,
    Cliente_premium = ifelse(Net.Sales > quantile(Net.Sales, 0.75), "Premium", "Regular")
  )

#==================== Análises adicionais ====================#
ggplot(dados_trabalho, aes(x = Type.of.Customer, y = Ticket_Medio, fill = Type.of.Customer)) + 
  geom_boxplot() +
  labs(
    title = "Nova análise: Ticket por Tipo de Cliente",
    y = "R$ por item"
  ) +
  theme_minimal()


  #==================== Teste Estatístico: Ticket ====================#
  t_test_result <- t.test(Ticket_Medio ~ Type.of.Customer, data = dados_trabalho)
  print("TESTE NOVO: Diferença no Ticket entre Clientes Regulares e Promocionais")
  print(t_test_result)

  modelo_estrategico_ticket_medio <- lm(Ticket_Medio ~ Type.of.Customer, data = dados_trabalho)
  summary_modelo_estrategico_ticket_medio <- summary(modelo_estrategico_ticket_medio)
  print("Modelo Estratégico: Ticket Médio por Tipo de Cliente\n")
  print(summary_modelo_estrategico_ticket_medio)

  #==================== Modelo Aprimorado ====================#

  ggplot(dados_trabalho, aes(x = Method.of.Payment, fill = Cliente_premium)) +
    geom_bar(position = "fill") +
    labs(
      title = "Nova análise: Métodos de Pagamento por Status Premium",
      y = "Proporção"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))


  modelo_estrategico <- lm(Net.Sales ~ Items + Ticket_Medio + Cliente_premium, data = dados_trabalho)
  print("MODELO NOVO: Impacto do Ticket e Status Premium nas Vendas")
  print(summary(modelo_estrategico))

