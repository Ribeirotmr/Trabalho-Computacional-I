source("analise.r")


#==================== Matriz de correlação ====================#
correlacao <- cor(dados_trabalho[, c("Net.Sales", "Items", "Age")])
diag(correlacao) <- NA
cat("Matriz de correlação:\n")
print(correlacao)

#==================== Modelo final ====================#
modelo_final <- lm(Net.Sales ~ Items, data = dados_trabalho)
sum_modelo_final <- summary(modelo_final)
cat("Modelo final:\n")
print(sum_modelo_final) 