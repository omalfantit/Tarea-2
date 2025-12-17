# Análisis de pilotos de la FóRmula 1 2025

# Instalamos los paquetes y los cargamos

install.packages("f1dataR")
install.packages("datapasta")
library(datapasta)
library("f1dataR")



library(dplyr)
library(ggplot2)


# Vemos el calendarios de carreras 2025
schedule <- load_schedule(season = 2025)
View(schedule)

|    | season | round | race_name                 | circuit_id    | circuit_name                   | lat      | long     | locality    | country      | date       | time      | sprint_date |
|----|--------|-------|---------------------------|---------------|--------------------------------|----------|----------|-------------|--------------|------------|-----------|-------------|
|  1 | 2025   | 1     | Australian Grand Prix     | albert_park   | Albert Park Grand Prix Circuit | -37.8497 | 144.968  | Melbourne   | Australia    | 2025-03-16 | 04:00:00Z | NA          |
|  2 | 2025   | 2     | Chinese Grand Prix        | shanghai      | Shanghai International Circuit | 31.3389  | 121.22   | Shanghai    | China        | 2025-03-23 | 07:00:00Z | 2025-03-22  |
|  3 | 2025   | 3     | Japanese Grand Prix       | suzuka        | Suzuka Circuit                 | 34.8431  | 136.541  | Suzuka      | Japan        | 2025-04-06 | 05:00:00Z | NA          |
|  4 | 2025   | 4     | Bahrain Grand Prix        | bahrain       | Bahrain International Circuit  | 26.0325  | 50.5106  | Sakhir      | Bahrain      | 2025-04-13 | 15:00:00Z | NA          |
|  5 | 2025   | 5     | Saudi Arabian Grand Prix  | jeddah        | Jeddah Corniche Circuit        | 21.6319  | 39.1044  | Jeddah      | Saudi Arabia | 2025-04-20 | 17:00:00Z | NA          |
|  6 | 2025   | 6     | Miami Grand Prix          | miami         | Miami International Autodrome  | 25.9581  | -80.2389 | Miami       | USA          | 2025-05-04 | 20:00:00Z | 2025-05-03  |
|  7 | 2025   | 7     | Emilia Romagna Grand Prix | imola         | Autodromo Enzo e Dino Ferrari  | 44.3439  | 11.7167  | Imola       | Italy        | 2025-05-18 | 13:00:00Z | NA          |
|  8 | 2025   | 8     | Monaco Grand Prix         | monaco        | Circuit de Monaco              | 43.7347  | 7.42056  | Monte Carlo | Monaco       | 2025-05-25 | 13:00:00Z | NA          |
|  9 | 2025   | 9     | Spanish Grand Prix        | catalunya     | Circuit de Barcelona-Catalunya | 41.57    | 2.26111  | Barcelona   | Spain        | 2025-06-01 | 13:00:00Z | NA          |
| 10 | 2025   | 10    | Canadian Grand Prix       | villeneuve    | Circuit Gilles Villeneuve      | 45.5     | -73.5228 | Montreal    | Canada       | 2025-06-15 | 18:00:00Z | NA          |
| 11 | 2025   | 11    | Austrian Grand Prix       | red_bull_ring | Red Bull Ring                  | 47.2197  | 14.7647  | Spielberg   | Austria      | 2025-06-29 | 13:00:00Z | NA          |
| 12 | 2025   | 12    | British Grand Prix        | silverstone   | Silverstone Circuit            | 52.0786  | -1.01694 | Silverstone | UK           | 2025-07-06 | 14:00:00Z | NA          |
| 13 | 2025   | 13    | Belgian Grand Prix        | spa           | Circuit de Spa-Francorchamps   | 50.4372  | 5.97139  | Spa         | Belgium      | 2025-07-27 | 13:00:00Z | 2025-07-26  |
| 14 | 2025   | 14    | Hungarian Grand Prix      | hungaroring   | Hungaroring                    | 47.5789  | 19.2486  | Budapest    | Hungary      | 2025-08-03 | 13:00:00Z | NA          |
| 15 | 2025   | 15    | Dutch Grand Prix          | zandvoort     | Circuit Park Zandvoort         | 52.3888  | 4.54092  | Zandvoort   | Netherlands  | 2025-08-31 | 13:00:00Z | NA          |
| 16 | 2025   | 16    | Italian Grand Prix        | monza         | Autodromo Nazionale di Monza   | 45.6156  | 9.28111  | Monza       | Italy        | 2025-09-07 | 13:00:00Z | NA          |
| 17 | 2025   | 17    | Azerbaijan Grand Prix     | baku          | Baku City Circuit              | 40.3725  | 49.8533  | Baku        | Azerbaijan   | 2025-09-21 | 11:00:00Z | NA          |
| 18 | 2025   | 18    | Singapore Grand Prix      | marina_bay    | Marina Bay Street Circuit      | 1.2914   | 103.864  | Marina Bay  | Singapore    | 2025-10-05 | 12:00:00Z | NA          |
| 19 | 2025   | 19    | United States Grand Prix  | americas      | Circuit of the Americas        | 30.1328  | -97.6411 | Austin      | USA          | 2025-10-19 | 19:00:00Z | 2025-10-18  |
| 20 | 2025   | 20    | Mexico City Grand Prix    | rodriguez     | Autódromo Hermanos Rodríguez   | 19.4042  | -99.0907 | Mexico City | Mexico       | 2025-10-26 | 20:00:00Z | NA          |
| 21 | 2025   | 21    | São Paulo Grand Prix      | interlagos    | Autódromo José Carlos Pace     | -23.7036 | -46.6997 | São Paulo   | Brazil       | 2025-11-09 | 17:00:00Z | 2025-11-08  |
| 22 | 2025   | 22    | Las Vegas Grand Prix      | vegas         | Las Vegas Strip Street Circuit | 36.1147  | -115.173 | Las Vegas   | USA          | 2025-11-23 | 04:00:00Z | NA          |
| 23 | 2025   | 23    | Qatar Grand Prix          | losail        | Losail International Circuit   | 25.49    | 51.4542  | Lusail      | Qatar        | 2025-11-30 | 16:00:00Z | 2025-11-29  |
| 24 | 2025   | 24    | Abu Dhabi Grand Prix      | yas_marina    | Yas Marina Circuit             | 24.4672  | 54.6031  | Abu Dhabi   | UAE          | 2025-12-07 | 13:00:00Z | NA          |


# Veremos los resultados de la primera carrera del 2025
results <- load_results(season = 2025, round = 1)
View(results)

|    | driver_id      | constructor_id | points | position | grid | laps | status   | gap         | fastest_rank | fastest  | top_speed_kph | time_sec |
|----|----------------|----------------|--------|----------|------|------|----------|-------------|--------------|----------|---------------|----------|
|  1 | norris         | mclaren        | 25     | 1        | 1    | 57   | Finished | 1:42:06.304 | 1            | 1:22.167 | NA            |   82.167 |
|  2 | max_verstappen | red_bull       | 18     | 2        | 3    | 57   | Finished | +0.895      | 3            | 1:23.081 | NA            |   83.081 |
|  3 | russell        | mercedes       | 15     | 3        | 4    | 57   | Finished | +8.481      | 11           | 1:25.065 | NA            |   85.065 |
|  4 | antonelli      | mercedes       | 12     | 4        | 16   | 57   | Finished | +10.135     | 9            | 1:24.901 | NA            |   84.901 |
|  5 | albon          | williams       | 10     | 5        | 6    | 57   | Finished | +12.773     | 8            | 1:24.597 | NA            |   84.597 |
|  6 | stroll         | aston_martin   | 8      | 6        | 13   | 57   | Finished | +17.413     | 14           | 1:25.538 | NA            |   85.538 |
|  7 | hulkenberg     | sauber         | 6      | 7        | 17   | 57   | Finished | +18.423     | 12           | 1:25.243 | NA            |   85.243 |
|  8 | leclerc        | ferrari        | 4      | 8        | 7    | 57   | Finished | +19.826     | 13           | 1:25.271 | NA            |   85.271 |
|  9 | piastri        | mclaren        | 2      | 9        | 2    | 57   | Finished | +20.448     | 4            | 1:23.242 | NA            |   83.242 |
| 10 | hamilton       | ferrari        | 1      | 10       | 8    | 57   | Finished | +22.473     | 7            | 1:24.218 | NA            |   84.218 |
| 11 | gasly          | alpine         | 0      | 11       | 9    | 57   | Finished | +26.502     | 10           | 1:25.020 | NA            |   85.020 |
| 12 | tsunoda        | rb             | 0      | 12       | 5    | 57   | Finished | +29.884     | 6            | 1:24.194 | NA            |   84.194 |
| 13 | ocon           | haas           | 0      | 13       | 19   | 57   | Finished | +33.161     | 15           | 1:26.764 | NA            |   86.764 |
| 14 | bearman        | haas           | 0      | 14       | 20   | 57   | Finished | +40.351     | 16           | 1:27.603 | NA            |   87.603 |
| 15 | lawson         | red_bull       | 0      | 15       | 18   | 46   | Retired  | NA          | 2            | 1:22.970 | NA            |   82.970 |
| 16 | bortoleto      | sauber         | 0      | 16       | 15   | 45   | Retired  | NA          | 5            | 1:24.192 | NA            |   84.192 |
| 17 | alonso         | aston_martin   | 0      | 17       | 12   | 32   | Retired  | NA          | 17           | 1:28.819 | NA            |   88.819 |
| 18 | sainz          | williams       | 0      | 18       | 10   | 0    | Retired  | NA          | NA           | NA       | NA            |       NA |
| 19 | doohan         | alpine         | 0      | 19       | 14   | 0    | Retired  | NA          | NA           | NA       | NA            |       NA |
| 20 | hadjar         | rb             | 0      | 20       | 11   | 0    | Retired  | NA          | NA           | NA       | NA            |       NA |


# Creamos los resultados del 2025
driver_standings <- load_standings(season = 2025, round = "last", type = "driver")
print(driver_standings)

|    | driver_id      | position | points | wins | constructor_id |
|----|----------------|----------|--------|------|----------------|
|  1 | norris         | 1        | 423    | 7    | mclaren        |
|  2 | max_verstappen | 2        | 421    | 8    | red_bull       |
|  3 | piastri        | 3        | 410    | 7    | mclaren        |
|  4 | russell        | 4        | 319    | 2    | mercedes       |
|  5 | leclerc        | 5        | 242    | 0    | ferrari        |
|  6 | hamilton       | 6        | 156    | 0    | ferrari        |
|  7 | antonelli      | 7        | 150    | 0    | mercedes       |
|  8 | albon          | 8        | 73     | 0    | williams       |
|  9 | sainz          | 9        | 64     | 0    | williams       |
| 10 | alonso         | 10       | 56     | 0    | aston_martin   |
| 11 | hulkenberg     | 11       | 51     | 0    | sauber         |
| 12 | hadjar         | 12       | 51     | 0    | rb             |
| 13 | bearman        | 13       | 41     | 0    | haas           |
| 14 | lawson         | 14       | 38     | 0    | red_bull       |
| 15 | lawson         | 14       | 38     | 0    | rb             |
| 16 | ocon           | 15       | 38     | 0    | haas           |
| 17 | stroll         | 16       | 33     | 0    | aston_martin   |
| 18 | tsunoda        | 17       | 33     | 0    | rb             |
| 19 | tsunoda        | 17       | 33     | 0    | red_bull       |
| 20 | gasly          | 18       | 22     | 0    | alpine         |
| 21 | bortoleto      | 19       | 19     | 0    | sauber         |
| 22 | colapinto      | 20       | 0      | 0    | alpine         |
| 23 | doohan         | 21       | 0      | 0    | alpine         |


# Creamos el listado con todos los pilotos
drivers <- load_drivers(season = 2025)

|    | driver_id       | given_name  | family_name | nationality   | date_of_birth | code | permanent_number |
|----|-----------------|-------------|-------------|---------------|---------------|------|------------------|
|  1 | albon           | Alexander   | Albon       | Thai          | 1996-03-23    | ALB  | 23               |
|  2 | alonso          | Fernando    | Alonso      | Spanish       | 1981-07-29    | ALO  | 14               |
|  3 | antonelli       | Andrea Kimi | Antonelli   | Italian       | 2006-08-25    | ANT  | 12               |
|  4 | paul_aron       | Paul        | Aron        | NA            | NA            | NA   | NA               |
|  5 | bearman         | Oliver      | Bearman     | British       | 2005-05-08    | BEA  | 87               |
|  6 | bortoleto       | Gabriel     | Bortoleto   | Brazilian     | 2004-10-14    | BOR  | 5                |
|  7 | luke_browning   | Luke        | Browning    | NA            | NA            | NA   | NA               |
|  8 | colapinto       | Franco      | Colapinto   | Argentine     | 2003-05-27    | COL  | 43               |
|  9 | jak_crawford    | Jak         | Crawford    | NA            | NA            | NA   | NA               |
| 10 | doohan          | Jack        | Doohan      | Australian    | 2003-01-20    | DOO  | 7                |
| 11 | gasly           | Pierre      | Gasly       | French        | 1996-02-07    | GAS  | 10               |
| 12 | hadjar          | Isack       | Hadjar      | French        | 2004-09-28    | HAD  | 6                |
| 13 | hamilton        | Lewis       | Hamilton    | British       | 1985-01-07    | HAM  | 44               |
| 14 | ryo_hirakawa    | Ryo         | Hirakawa    | NA            | NA            | NA   | NA               |
| 15 | hulkenberg      | Nico        | Hülkenberg  | German        | 1987-08-19    | HUL  | 27               |
| 16 | ayumu_iwasa     | Ayumu       | Iwasa       | NA            | NA            | NA   | NA               |
| 17 | lawson          | Liam        | Lawson      | New Zealander | 2002-02-11    | LAW  | 30               |
| 18 | leclerc         | Charles     | Leclerc     | Monegasque    | 1997-10-16    | LEC  | 16               |
| 19 | arthur_leclerc  | Arthur      | Leclerc     | NA            | NA            | NA   | NA               |
| 20 | arvid_lindblad  | Arvid       | Lindblad    | NA            | NA            | NA   | NA               |
| 21 | norris          | Lando       | Norris      | British       | 1999-11-13    | NOR  | 4                |
| 22 | ocon            | Esteban     | Ocon        | French        | 1996-09-17    | OCO  | 31               |
| 23 | patricio_o_ward | Patricio    | O'Ward      | NA            | NA            | NA   | NA               |
| 24 | piastri         | Oscar       | Piastri     | Australian    | 2001-04-06    | PIA  | 81               |
| 25 | russell         | George      | Russell     | British       | 1998-02-15    | RUS  | 63               |
| 26 | sainz           | Carlos      | Sainz       | Spanish       | 1994-09-01    | SAI  | 55               |
| 27 | cian_shields    | Cian        | Shields     | NA            | NA            | NA   | NA               |
| 28 | stroll          | Lance       | Stroll      | Canadian      | 1998-10-29    | STR  | 18               |
| 29 | tsunoda         | Yuki        | Tsunoda     | Japanese      | 2000-05-11    | TSU  | 22               |
| 30 | max_verstappen  | Max         | Verstappen  | Dutch         | 1997-09-30    | VER  | 33               |


# Finalmente crearemos un gráfico con los puntos obtenidos por los 10 primeros pilotos

library(ggplot2)

ggplot(driver_standings %>% head(10), 
       aes(x = reorder(driver_id, points), y = points, fill = driver_id)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 Pilotos - Temporada 2025",
       x = "Piloto", y = "Puntos") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

<img width="864" height="554" alt="Rplot" src="https://github.com/user-attachments/assets/caac494c-221c-4f3b-83c1-f3e2af6e9621" />


