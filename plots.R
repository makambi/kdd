require(Amelia)

missmap(projects, main="kdd cup - missing map", col=c("yellow", "black"), legend=FALSE)

barplot(table(outcomes.train$is_exciting), names.arg = c("Not exciting", "Exciting"), main="Exciting (projects rate)", col="black")
barplot(table(outcomes.train$fully_funded), names.arg = c("Not fully funded", "Fully funded"),  main="Fully funded (projects rate)", col="grey")

barplot(table(outcomes.train$at_least_1_green_donation), col="black")

barplot(table(projects$poverty_level))
barplot(table(projects$teacher_teach_for_america), names.arg = c("Not for America", "Teach for America"), main="Teach for America (projects rate)")

plot(projects.with.outcomes[c("is_exciting", "fully_funded", "donation_from_thoughtful_donor")])


str(projects.with.outcomes[c("is_exciting", "fully_funded", "donation_from_thoughtful_donor")])

require(ggplot2)
d <- ggplot(projects.with.outcomes, aes(is_exciting, grade_level))
d <- ggplot(projects.with.outcomes, aes(is_exciting, fully_funded ))


barplot(table(projects.with.outcomes$poverty_level), main="Poverty level (projects rate)", col="black")
ggplot(projects.with.outcomes, aes(is_exciting, poverty_level)) + geom_bin2d()

d + stat_binhex()

str(projects.with.outcomes)

barplot(table(projects$school_metro))
ggplot(projects.with.outcomes, aes(is_exciting, school_metro))+ geom_bin2d()   + ggtitle("School's metro exitement")   + labs(x="Is Exciting",y="School metro")

str(projects)

require(vcd)
mosaicplot(projects.with.outcomes$is_exciting ~ projects.with.outcomes$poverty_level, main="Is exitining by Poverty level", shade=FALSE, color=TRUE,  xlab="Is Exciting", ylab="Poverty level")
mosaicplot(projects.with.outcomes$is_exciting ~ projects.with.outcomes$school_metro, main="Is exitining by Metro", shade=FALSE, color=TRUE,  xlab="Is Exciting", ylab="Metro")
mosaicplot(projects.with.outcomes$is_exciting ~ projects.with.outcomes$grade_level, main="Is exitining by Grade level", shade=FALSE, color=TRUE,  xlab="Is Exciting", ylab="Grade level")


require(corrgram)
corrgram.data <- projects.with.outcomes
corrgram.vars <- c("primary_focus_subject", "fully_funded")
corrgram(corrgram.data[,corrgram.vars], order=FALSE, 
         lower.panel=panel.ellipse, upper.panel=panel.pie, 
         text.panel=panel.txt, main="kdd cup training data")

corrgram(projects.with.outcomes[,corrgram.vars])

summary(projects.with.outcomes)