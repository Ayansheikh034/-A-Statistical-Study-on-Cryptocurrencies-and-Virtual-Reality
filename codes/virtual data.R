library(readxl)
library(corrplot)
library(ggcorrplot)

data = read_excel("D:/ST 402 Project/data/Relation between VR experiences and tourism/VR_Experience_Raw_Data.xlsx")
data1 = read_excel("D:/ST 402 Project/data/Relation between VR experiences and tourism/VR_Experience_Raw_Data.xlsx")

data[,7:36] = lapply(data[,7:36], factor)

data[,7:36]= lapply(data[,7:36], plyr::revalue, 
                      c("1"="Completely disagree", "2"="Disagree", "3"="Neutral", "4"="Agree", "5"="Completely agree"))

names(data)[names(data) == "PRE1"]= "VR_DaNang_CityFeel"
names(data)[names(data) == "PRE2"]= "VR_DaNang_LocationFeel"
names(data)[names(data) == "PRE3"]= "VR_PresenceFeel"
names(data)[names(data) == "PRE4"]= "VR_ExplorationFeel"
View(data)
correlation_matrix=cor(data[,-c(1:6)], method = "spearman")
corrplot(correlation_matrix, method = "circle")

summary(data)

boxplot(data)


### Mode for the each questions 

mode = function(x) {
  ux= unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
modal_values= sapply(data1,mode);modal_values



########################## USER Experience Analysis ######################################
d=data[,1:10]
male=subset(d, Gender == 1)
female= subset(d, Gender == 2)
View(male)
View(female)
dim(male)
dim(female)

### Median
medians_male= apply(male[,7:10], 2, median);medians_male
medians_female=apply(female[,7:10],2,median);medians_female

#Mode
mode_male=sapply(male[,7:10],mode);mode_male
mode_female=sapply(female[,7:10],mode);mode_female

## Frequency Distribution
freq_d_male=lapply(male, table);freq_d_male
freq_d_female=lapply(female, table);freq_d_female

par(mfrow=c(1,1))
VR_DaNang_CityFeel = table(male$VR_DaNang_CityFeel)
VR_DaNang_LocationFeel = table(male$VR_DaNang_LocationFeel)
VR_PresenceFeel = table(male$VR_PresenceFeel)
VR_ExplorationFeel = table(male$VR_ExplorationFeel)
freq_dists = rbind(VR_DaNang_CityFeel, VR_DaNang_LocationFeel, VR_PresenceFeel, VR_ExplorationFeel)
barplot(freq_dists, beside = TRUE, main = "Frequency Distributions of User Experience for Male", 
        ylab = "Frequency", xlab = "Categories", 
        col = c("blue", "red", "green", "yellow"),
        legend.text = rownames(freq_dists), args.legend = list(cex=0.6))

## Frequency distribution of the user experience for user experience for female 

VR_DaNang_CityFeel = table(female$VR_DaNang_CityFeel)
VR_DaNang_LocationFeel = table(female$VR_DaNang_LocationFeel)
VR_PresenceFeel = table(female$VR_PresenceFeel)
VR_ExplorationFeel = table(female$VR_ExplorationFeel)
freq_dists1 = rbind(VR_DaNang_CityFeel, VR_DaNang_LocationFeel, VR_PresenceFeel, VR_ExplorationFeel)
barplot(freq_dists1, beside = TRUE, main = "Frequency Distributions of User Experience for Female", 
        ylab = "Frequency", xlab = "Categories", 
        col = c("blue", "red", "green", "yellow"),
        legend.text = rownames(freq_dists1), args.legend = list(cex=0.6))




###############################################################
test_result = wilcox.test(data$PRE1, data$PRE2)

boxplot(data$PRE1, data$PRE2, names=c("Using virtual reality on the Da Nang tourism destination website, I feel like I'm in the middle of the city. 1", "I feel like my actual location is at the Da Nang destination when experiencing virtual reality on the Da Nang tourism destination website."), main="Virtual Reality Experience Makes Me Feel Like I'm in Da Nang")





par(mfrow=c(2,1))  # Set up the graphics to show two plots on one page
 hist(group1, main="Histogram of Group 1", xlab="Value", col="blue")
 hist(group2, main="Histogram of Group 2", xlab="Value", col="red")




