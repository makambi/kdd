projects.path <- "/home/makambi/Desktop/DataAnalysis/kaggle/kdd-cup/projects.csv"
outcomes.path <- "/home/makambi/Desktop/DataAnalysis/kaggle/kdd-cup/outcomes.csv"
resources.path <- "/home/makambi/Desktop/DataAnalysis/kaggle/kdd-cup/resources.csv"
teachers.path <- "/home/makambi/Desktop/DataAnalysis/kaggle/kdd-cup/teachers.csv"

projects <- read.csv(projects.path)
outcomes.train <- read.csv(outcomes.path)
resourses <- read.csv(resources.path)
teachers <- read.csv(teachers.path)
  

View(projects)

str(projects)
str(outcomes.train)

projects.with.outcomes <- merge(projects, outcomes.train, by = "projectid")
projects.with.outcomes <- merge(projects.with.outcomes, teachers, by="teacher_acctid")

glm.fit <- glm(is_exciting ~ poverty_level + school_metro + teacher_projects + teacher_exciting_projects + teacher_fully_funded + teacher_referred_count_mean, data=projects.with.outcomes, family = binomial)
summary(glm.fit)


train=sample(c(TRUE,FALSE), nrow(projects.with.outcomes), rep=TRUE)
test = (!train)
projects.train = projects.with.outcomes[train,]
projects.test <- projects.with.outcomes[test,]


glm.fit <- glm(is_exciting ~ . , data=projects.train, family = binomial)
summary(glm.fit)

glm.probs <- predict (glm.fit, projects.test, type ="response")
contrasts(projects.train$is_exciting)

glm.pred=rep("f", nrow(projects.test))
glm.pred[glm.probs >.005]=" t"
table(glm.pred, projects.test$is_exciting)

summary(resourses)

boxplot(resourses$item_quantity)

library(gbm)
set.seed (1)
boost.exciting <- gbm(is_exciting ~ poverty_level + school_metro + teacher_projects + teacher_exciting_projects + teacher_fully_funded + teacher_referred_count_mean, data=projects.train, distribution = "gaussian", n.trees = 5000, interaction.depth=4)
yhat.boost=predict(boost.exciting, newdata = projects.test, n.trees = 5000)
mean((yhat.boost - boost.exciting)^2)