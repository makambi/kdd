resources.file <- "/home/makambi/Desktop/DataAnalysis/kaggle/kdd-cup/resources.csv"
resources <- read.csv(resources.file)


expensive_resources <- resourses[resourses$item_unit_price > 2000,]
View(expensive_resources)

resourses[complete.cases(resourse)]

View(resources[is.na(resources$item_unit_price),])

colnames(resources)
head(resources[,1:2])











