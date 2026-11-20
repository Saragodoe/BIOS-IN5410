#Lage stolpediagram som viser prosentvis vekst

library(ggplot2)
library(dplyr)
library(tidyr)

#Sorterer data fra 1951 og 1961 i to lister
phones_1951 <- WorldPhones["1951", ]
phones_1961 <- WorldPhones["1961", ]

#Lager en tabell med en rad per region og to kolonner
growth_data <- data.frame(
  region = colnames(WorldPhones),
  growth_prosent = (phones_1961 - phones_1951) / phones_1951 * 100
)

#Lager et stolpediagram og lager tittel
ggplot(growth_data, aes(x = growth_prosent, y = region)) +
  geom_col(fill = "plum1") +
  geom_text(aes(label = paste0(round(growth_prosent), " %"))) +
  labs(x = "Prosentvis vekst fra 1951 til 1961", y = NULL)
