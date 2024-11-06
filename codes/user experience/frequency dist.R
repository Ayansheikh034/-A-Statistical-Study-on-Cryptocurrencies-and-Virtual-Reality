

#User Experience Analysis

library(readxl)
data = read_excel("D:/ST 402 Project/data/Relation between VR experiences and tourism/VR_Experience_Raw_Data.xlsx")

data[,7:36] = lapply(data[,7:36], factor)

data[,7:36]= lapply(data[,7:36], plyr::revalue, 
                    c("1"="Completely disagree", "2"="Disagree", "3"="Neutral", "4"="Agree", "5"="Completely agree"))

names(data)[names(data) == "PRE1"]= "VR_DaNang_CityFeel"
names(data)[names(data) == "PRE2"]= "VR_DaNang_LocationFeel"
names(data)[names(data) == "PRE3"]= "VR_PresenceFeel"
names(data)[names(data) == "PRE4"]= "VR_ExplorationFeel"
#View(data)
d=data[,1:10]
male=subset(d, Gender == 1)
female= subset(d, Gender == 2)
#View(male)

#View(female)
dim(male)
dim(female)

freq_d_male=lapply(male, table);freq_d_male
freq_d_female=lapply(female, table);freq_d_female

par(mfrow=c(1,2))
VR_DaNang_CityFeel = table(male$VR_DaNang_CityFeel)
VR_DaNang_LocationFeel = table(male$VR_DaNang_LocationFeel)
VR_PresenceFeel = table(male$VR_PresenceFeel)
VR_ExplorationFeel = table(male$VR_ExplorationFeel)
freq_dists = rbind(VR_DaNang_CityFeel, VR_DaNang_LocationFeel, VR_PresenceFeel, VR_ExplorationFeel)
barplot(freq_dists[,-1], beside = TRUE, main = "Frequency Distributions of User Experience for Male", 
        ylab = "Frequency", xlab = "Categories", 
        col = c("blue", "red", "green", "yellow"),
        legend.text = rownames(freq_dists), args.legend = list(cex=0.5))

## Frequency distribution of the user experience for user experience for female 

VR_DaNang_CityFeel = table(female$VR_DaNang_CityFeel)
VR_DaNang_LocationFeel = table(female$VR_DaNang_LocationFeel)
VR_PresenceFeel = table(female$VR_PresenceFeel)
VR_ExplorationFeel = table(female$VR_ExplorationFeel)
freq_dists1 = rbind(VR_DaNang_CityFeel, VR_DaNang_LocationFeel, VR_PresenceFeel, VR_ExplorationFeel)
barplot(freq_dists1[,-1], beside = TRUE, main = "Frequency Distributions of User Experience for Female", 
        ylab = "Frequency", xlab = "Categories", 
        col = c("blue", "red", "green", "yellow"),
        legend.text = rownames(freq_dists1), args.legend = list(cex=0.6))

####################################################################################
