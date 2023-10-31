# Antes inferimos que los estados con mayor poblacion tienen mas posibilidades
# de tener mas asesinatos, esto puede ser confirmado rapidamente con una 
# visualizacion exploratoria que traza estas dos cantidades entre si.
# Asi se hace en R

population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions, total_gun_murders)

# Otro ejemplo de grafico que podemos hacer son histogramas
murders <- mutate(murders, rate = total / population * 100000)
hist(murders$rate)
# En el histograma se destaca uno, averiguemos cual es
murders$state[which.max(murders$rate)]

# Ahora los boxplots
boxplot(rate ~ region, data = murders)
