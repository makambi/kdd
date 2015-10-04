names(outcomes.train)

teacher_related_cols <- c(names(outcomes.train), 'teacher_acctid')
teachers_outcomes <- projects.with.outcomes[,teacher_related_cols]
  
table(teachers_outcomes$teacher_acctid)


require(plyr)

tceachers_outcomes


n = c(2, 3, 5, 3, 1, 6) 
s = c("aa", "bb", "cc", "aa", "bb", "cc") 
b = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE) 
df = data.frame(n, s, b)       # df is a data frame 
df

ddply(df, .(s), function(x){ sum(x$n)})

ddply(teachers_outcomes, .(teacher_acctid), summarize, count=length(teacher_acctid))












