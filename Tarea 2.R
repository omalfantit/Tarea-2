install.packages("f1dataR")
install.packages("datapasta")
library(datapasta)
library("f1dataR")



library(dplyr)
library(ggplot2)

schedule <- load_schedule(season = 2025)
View(schedule)

results <- load_results(season = 2025, round = 1)
View(results)

driver_standings <- load_standings(season = 2025, round = "last", type = "driver")
print(driver_standings)


drivers <- load_drivers(season = 2025)

all_results <- data.frame()
for(round in 1:10) {
  race_results <- load_results(season = 2025, round = round)
  all_results <- rbind(all_results, race_results)
}

names(driver_standings)
names(drivers)

library(ggplot2)

ggplot(driver_standings %>% head(10), 
       aes(x = reorder(driver_id, points), y = points, fill = driver_id)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 Pilotos - Temporada 2025",
       x = "Piloto", y = "Puntos") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

