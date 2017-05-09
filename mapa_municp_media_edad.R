raw <- readOGR(dsn=".",layer = "se89_3_admin_muni_a_x")
data_spain <- read.csv("Censuses2011_2.csv", stringsAsFactors = F)
data_spain$id_ine <- as.factor(separate(data_spain, Municipality.of.residence, "ide_ine", " ")$ide_ine)
data_spain$People <- data_spain$Municipality.of.residence <- NULL
data_spain$Average.age <- as.numeric(data_spain$Average.age)
data_spain <- data_spain[order(data_spain$id_ine),]

dat <- merge(raw, data_spain, all.x = FALSE,all.y=FALSE)

my.palette <- brewer.pal(n = 7, name = "Blues")
spplot(dat, "Average.age", 
       col.regions = my.palette, cuts = 6, 
       col = "transparent")