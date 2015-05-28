
install.packages("RPostgreSQL")
library("RPostgreSQL")



drv <- dbDriver('PostgreSQL')
con <- dbConnect(drv, 
                 host = "dssgsummer2014postgres.c5faqozfo86k.us-west-2.rds.amazonaws.com",
                 dbname = "training_2015",
                 user = "mahmud",
                 password = "mahmud")

data <- dbGetQuery(con, "SELECT * FROM jwalsh.building_permits;")

data <- data[, !(names(data) %in% 'SSA')]

names(data)
sapply(data, class)

violations <- dbGetQuery(con, "SELECT * FROM mahmud.building_violation_table;")
names(violations)


