### Ejercicio clase 4

library(tidyverse)
library(polAr)

show_available_elections(viewer = T)

pais <- get_election_data("arg", "presi", "gral", 2003)

mendoza <- pais %>%
  filter(name_prov == "MENDOZA")

mendoza %>%
  ungroup() %>% 
  group_by(listas) %>% 
  summarise(votos = sum(votos)) %>% 
  arrange(desc(votos)) %>% 
  mutate(votos = votos/sum(votos)*100)
