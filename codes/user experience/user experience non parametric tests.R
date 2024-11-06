
data = read_excel("D:/ST 402 Project/data/Relation between VR experiences and tourism/VR_Experience_Raw_Data.xlsx")
names(data)[names(data) == "PRE1"]= "VR_DaNang_CityFeel"
names(data)[names(data) == "PRE2"]= "VR_DaNang_LocationFeel"
names(data)[names(data) == "PRE3"]= "VR_PresenceFeel"
names(data)[names(data) == "PRE4"]= "VR_ExplorationFeel"
###Enjoyment
names(data)[names(data) == "ENJ1"]= "VR_DaNang_Excited1"
names(data)[names(data) == "ENJ2"]= "VR_DaNang_Excited2"
names(data)[names(data) == "ENJ3"]= "VR_DaNang_Happy1"
names(data)[names(data) == "ENJ4"]= "VR_DaNang_Happy2"
#emotional
names(data)[names(data) == "EMO1"]= "VR_DaNang_Engage"
names(data)[names(data) == "EMO2"]= "VR_DaNang_Activities"
names(data)[names(data) == "EMO3"]= "VR_DaNang_Immersed"
#flow
names(data)[names(data) == "FLOW1"]= "VR_DaNang_Captivated"
names(data)[names(data) == "FLOW2"]= "VR_DaNang_TimePasses"
names(data)[names(data) == "FLOW3"]= "VR_DaNang_ForgetConcerns"
names(data)[names(data) == "FLOW4"]= "VR_DaNang_ForgetLocation"
#invest
names(data)[names(data) == "INT1"]= "VR_DaNang_IntendVisit"
names(data)[names(data) == "INT2"]= "VR_DaNang_PlanVisit"
names(data)[names(data) == "INT3"]= "VR_DaNang_ReadyVisit"
names(data)[names(data) == "INT4"]= "VR_DaNang_InvestVisit"
###how its look
names(data)[names(data) == "AES1"]= "VR_DaNang_SharpDesign"
names(data)[names(data) == "AES2"]= "VR_DaNang_BeautifulDesign"
names(data)[names(data) == "AES3"]= "VR_DaNang_AttractiveLayout"
names(data)[names(data) == "AES4"]= "VR_DaNang_ArtisticDesign"
#benefit
names(data)[names(data) == "USE1"]= "VR_DaNang_Benefits"
names(data)[names(data) == "USE2"]= "VR_DaNang_KnowledgeGain"
names(data)[names(data) == "USE3"]= "VR_DaNang_MakeFriends"
names(data)[names(data) == "USE4"]= "VR_DaNang_InfoEfficiency"
#easy to use
names(data)[names(data) == "EAS1"]= "VR_DaNang_EasyUse"
names(data)[names(data) == "EAS2"]= "VR_DaNang_EasyExplore"
names(data)[names(data) == "EAS3"]= "VR_DaNang_UseAnywhere"


names(data)
View(data)


d=data[,1:10]
male=subset(data, Gender == 1)
female= subset(data, Gender == 2)

#Kruskal-Wallis test for on hole data according to gender
attach(data)
#Kruskal-Wallis test
kruskal.test(VR_DaNang_CityFeel ~ Gender, data = data)
kruskal.test(VR_DaNang_LocationFeel ~ Gender, data = data)

# Kruskal-Wallis test for Immersion
kruskal.test(VR_DaNang_Immersed ~ Gender, data = data)
kruskal.test(VR_DaNang_Captivated ~ Gender, data = data)

# Kruskal-Wallis test for Presence
kruskal.test(VR_PresenceFeel ~ Gender, data = data)
kruskal.test(VR_DaNang_TimePasses ~ Gender, data = data)

# Kruskal-Wallis test for Interactivity
kruskal.test(VR_DaNang_EasyExplore ~ Gender, data = data)
kruskal.test(VR_DaNang_Activities ~ Gender, data = data)




#For male
male_data = data[data$Gender == '1', ]
wilcox.test(male_data$VR_DaNang_LocationFeel)

# For 'Female'
female_data = data[data$Gender == '2', ]
wilcox.test(female_data$VR_DaNang_LocationFeel)


#Immersion
male$Immersion=apply(male[,c('VR_DaNang_CityFeel', 'VR_DaNang_LocationFeel', 'VR_PresenceFeel','VR_ExplorationFeel')], 1, median)

female$Immersion=apply(female[,c('VR_DaNang_CityFeel', 'VR_DaNang_LocationFeel', 'VR_PresenceFeel','VR_ExplorationFeel')], 1, median)
View(male)
