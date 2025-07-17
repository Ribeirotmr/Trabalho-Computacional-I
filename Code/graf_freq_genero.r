#source("analise.r")


#==================== tabela frequencia por genero ====================#

tabela_gender_plot <- tabela_gender[tabela_gender$Categoria != "Total", ]



barplot(
    tabela_gender_plot$Frequencia_Absoluta,
    names.arg = tabela_gender_plot$Categoria,
    main = "Frequência por Gênero",
    col = "blue",
    las = 2,
    ylab = "Frequência",
    xlab = "Gênero"
)



