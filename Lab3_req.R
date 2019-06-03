rm(list = ls())

######################################### 1
dir.create("bigData_lab3")
setwd("/home/gehad/bigData_lab3")
getwd()

######################################### 2
library("arules")
#library("arulesViz")
######################################## 3
order_trans <- read.transactions(file = "AssociationRules.csv")
#######################################  4
inspect(order_trans[1:100])
####################################### 5
itms <- itemFrequency(order_trans, type = "absolute")
most_freq2 <- head(sort(itms, decreasing = TRUE), n = 2)
print(most_freq2)
# So most frequent two items are item13 with freq. 4948 and item5 with freq. 3699

###################################### 6
itemFrequencyPlot(order_trans,topN=5)
###################################### 7
rules <- apriori(order_trans,parameter = list(supp = 0.01, conf = 0.5,maxlen=2 ,target = "rules"))
###################################### 8
rules_by_support <- sort(rules,decreasing = TRUE ,by = "support")
inspect(head(rules_by_support, 6))
##################################### 9
rules_by_confidence <- sort(rules,decreasing = TRUE ,by = "confidence")
inspect(head(rules_by_confidence, 6))
##################################### 10
rules_by_lift <- sort(rules,decreasing = TRUE ,by = "lift")
inspect(head(rules_by_lift, 6))
##################################### 11
plot(rules,measure=c("support","confidence"),shading="lift")
##################################### 12
# the most interesting rules are 
#{item55} => {item34}   
#{item54} => {item96}   
#{item4}  => {item21}   
#{item44} => {item10}  
#{item23} => {item13} 
#{item72} => {item30}
# As they have the high lift among the rules 





