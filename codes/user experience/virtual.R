
############################################################################################
#########################   User Experience Analysis  ######################################
############################################################################################

library(readxl)
df = read_excel("D:/ST 402 Project/data/Relation between VR experiences and tourism/average data vr.xlsx")
#View(df)
summary(df)

# Load necessary library
library(ggplot2)
library(reshape2)
library(dplyr)
library(stats)
##################################
# variables for the first plot
df1 =df[, c("Presence", "Aesthetic_Aspects")]
df1_melt=melt(df1)
# first Box Plot
ggplot(df1_melt, aes(x = variable, y = value)) +
  geom_boxplot() +
  labs(title = "Boxplot of Presence and Aesthetic Aspects",
       x = "Variable",
       y = "Values") +
  theme_minimal()

###########################################
#  variables for the second plot
df2=df[, c("Utility", "Ease_of_Use")]
df2_melt=melt(df2)
# second Box Plot
ggplot(df2_melt, aes(x = variable, y = value)) +
  geom_boxplot() +
  labs(title = "Boxplot of Utility and Ease of Use",
       x = "Variable",
       y = "Values") +
  theme_minimal()
###########################################################
####################Alternative plot######################
##########################################################

# Histogram for the first set of variables
ggplot(df1_melt, aes(x = value)) +
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +
  facet_wrap(~variable, scales = "free") +
  labs(title = "Histogram of Presence and Aesthetic Aspects",
       x = "Values",
       y = "Frequency") +
  theme_minimal()

# Histogram for the second set of variables
ggplot(df2_melt, aes(x = value)) +
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +
  facet_wrap(~variable, scales = "free") +
  labs(title = "Histogram of Utility and Ease of Use",
       x = "Values",
       y = "Frequency") +
  theme_minimal()





library(dplyr)

#########Non parametric Test for User Experience Analysis

#Mann-Whitney U Test or Wilcoxon Rank-Sum Test
#These tests can be used to compare the user experience ratings between two independent demographic groups. 
# Presence ratings between two Gender groups.

# Perform Mann-Whitney U Test for Presence between two Gender groups
result = wilcox.test(Presence ~ Gender, data = df)
result

###Kruskal wallis test 
# this test is for the comparing the Utility accross different income group
kruskal.test(Utility ~ Income, data = df)

#Spearman's Rank Correlation test for Age and Ease_of_Use
result_cor = cor.test(df$Age, df$Ease_of_Use, method = "spearman")
result_cor







############################################################################################
#############################   Demographic Analysis  ######################################
############################################################################################

#Chi-Square Test of Independence
contingency_table = table(df$Gender, df$Presence)
result_chi = chisq.test(contingency_table);result_chi



#Kruskal-Wallis Test
#To compare the means of VR experience ratings across different demographic groups.
result_kru = kruskal.test(Presence ~ Age, data = df);result_kru

library(car)
manova_result = manova(cbind(Presence, Aesthetic_Aspects, Utility, Ease_of_Use) ~ Gender, data = df)
summary(manova_result)



############################################################################################
#############################  Emotional State Analysis ####################################
############################################################################################

#Spearman's Rank Correlation test for Flow of States and Enjoyment
result_cor = cor.test(df$Flow_of_States, df$Enjoyment, method = "spearman");result_cor




############################################################################################
#############################  Travel Intent Analysis ######################################
############################################################################################
#Multiple Linear regression
# Load necessary library
library(caret)
# Multiple Logistic Regression
df$Intention_to_Travel =ifelse(df$Intention_to_Travel > 4.5, 1, 0)
df$Intention_to_Travel = as.factor(df$Intention_to_Travel)
train_control = trainControl(method = "cv", number = 10)
logistic_model = train(Intention_to_Travel ~ Presence + Aesthetic_Aspects + Utility + Ease_of_Use, data = df, method = "glm", family = binomial(), trControl = train_control)
summary(logistic_model)



# Chi square test for independence
contingency_table = table(df$Intention_to_Travel, df$Gender)
result_travel = chisq.test(contingency_table);result_travel


