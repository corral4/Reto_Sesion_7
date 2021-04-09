
queries.R <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")
install.packages("dplyr")
library(dplyr)

dbListTables(queries.R)

dbListFields(queries.R, 'City')
dbListFields(queries.R, 'Country')
dbListFields(queries.R, 'CountryLanguage')

DataDB <- dbGetQuery(queries.R, "select * from CountryLanguage")

unique(DataDB$Language)

Porcentaje<-DataDB %>% filter(Language == "Spanish")

Porcentaje

install.packages("ggplot2")
library(ggplot2)

Grafica<- Porcentaje %>% ggplot(aes(x=Percentage, y=CountryCode,colour=IsOfficial))+
                     geom_point()
Grafica



