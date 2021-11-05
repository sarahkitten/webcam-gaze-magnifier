#survey data 
#Natalie Maus

#readline(prompt="Press [enter] to continue")


############HISTOGRAMS################################# : 

#Histogram of Group B font sizes: 
fonts <- c(40,18,42,18,32,14,28,8,40)
hist(fonts, main = "Histogram of Font Sizes Selected by Group B Participants", 
     xlab = "Selected Font Size (in points)", xlim = c(0,50), 
     ylab = "Frequency (number of participants)", ylim = c(0,4))

#read in files 
A <- read.csv("groupA.csv")
B <- read.csv("groupB.csv")

#Usability Histogram both groups (one combined histogram)
All_GCMsus <- c(A$GCM.SUS, B$GCM.SUS)
All_CCMsus <- c(A$CCM.SUS, B$CCM.SUS)
hist(All_GCMsus, main = "Histogram of System Usability Scores", 
     xlab = "Usability Score", xlim = c(0,100),
     ylab = "Frequency (number of participants)", ylim = c(0,6), border = "red",col = rgb(1,0,0,0.2),
     legend.text = c("Gaze-Controlled Magnifier Used", "Mouse-Controlled Magnifier Used"),
     args.legend = list(x = "topleft", bty = "n") 
     )
hist(All_CCMsus,
     xlab = "Usability Score", xlim = c(0,100) , ylim = c(0,6)
     ,ylab = "Frequency (number of participants)", col = "black", border = rgb(0,0,0), add = T,
     legend.text = c("Gaze-Controlled Magnifier Used", "Mouse-Controlled Magnifier Used"),
     args.legend = list(x = "topleft", bty = "n"), density = 20, angle = 75)

#Cog Load  Histograms both groups 
All_GCMc <- A$GCM.NASA.TLX
All_CCMc <- A$CCM.NASA.TLX

hist(All_GCMc, main = "Histogram of Cognitive Workload Scores", 
     xlab = "Cognitive Workload Score", xlim = c(0,100),
     ylab = "Frequency (number of participants)", ylim = c(0,6), border = "red",col = rgb(1,0,0,0.2),
     legend.text = c("Gaze-Controlled Magnifier Used", "Mouse-Controlled Magnifier Used"),
     args.legend = list(x = "topleft", bty = "n") 
)
hist(All_CCMc,
     xlab = "Cognitive Workload Score", xlim = c(0,100) , ylim = c(0,6)
     ,ylab = "Frequency (number of participants)", col = "black", border = rgb(0,0,0), add = T,
     legend.text = c("Gaze-Controlled Magnifier Used", "Mouse-Controlled Magnifier Used"),
     args.legend = list(x = "topleft", bty = "n"), density = 20, angle = 75)

#readline(prompt="Press [enter] to continue")


#Histograms of Usabililty and Cog Load Group A
A_GCMsus <- A$GCM.SUS
hist(A_GCMsus, main = "Histogram of Group A Usability Scores for Gaze-Controlled Magnifier", 
     xlab = "Usability Score", xlim = c(0,100),ylab = "Frequency (number of participants)", ylim = c(0,5))
A_CCMsus <- A$CCM.SUS
hist(A_CCMsus, main = "Histogram of Group A Usability Scores for Mouse-Controlled Magnifier",
     xlab = "Usability Score", xlim = c(0,100) , ylim = c(0,5)
     ,ylab = "Frequency (number of participants)")

A_GCMc <- A$GCM.NASA.TLX
hist(A_GCMc, main = "Histogram of Group A Cognitive Work Load Scores for Gaze-Controlled Magnifier",
     xlab = "Cognitive Work Load Score", xlim = c(0,100),ylab = "Frequency (number of participants)", ylim = c(0,5))
A_CCMc <- A$CCM.NASA.TLX
hist(A_CCMc, main = "Histogram of Group A Cognitive Work Load Scores for Mouse-Controlled Magnifier",
     xlab = "Cognitive Work Load Score", xlim = c(0,100),ylab = "Frequency (number of participants)", ylim = c(0,5))

#Histograms of Usabililty and Cog Load Group B
B_GCMsus <- B$GCM.SUS
hist(B_GCMsus,main = "Histogram of Group B Usability Scores for Gaze-Controlled Magnifier",
     xlab = "Usability Score", xlim = c(0,100),ylab = "Frequency (number of participants)", ylim = c(0,5))
B_CCMsus <- B$CCM.SUS
hist(B_CCMsus, main = "Histogram of Group B Usability Scores for Mouse-Controlled Magnifier",
     xlab = "Usability Score", xlim = c(0,100),ylab = "Frequency (number of participants)", ylim = c(0,5))

B_GCMc <- B$GCM.NASA.TLX
hist(B_GCMc, main = "Histogram of Group B Cognitive Work Load Scores for Gaze-Controlled Magnifier",
     xlab = "Cognitive Work Load Score", xlim = c(0,100),ylab = "Frequency (number of participants)", ylim = c(0,5))
B_CCMc <- B$CCM.NASA.TLX
hist(B_CCMc, main = "Histogram of Group B Cognitive Work Load Scores for Mouse-Controlled Magnifier",
     xlab = "Cognitive Work Load Score", xlim = c(0,100), ylab = "Frequency (number of participants)", ylim = c(0,5))



#########System Usability Analysis (SUS): ##############

#GCM
meanA_GCM <- mean(A$GCM.SUS)
meanB_GCM <- mean(B$GCM.SUS)
#CCM
meanA_CCM <- mean(A$CCM.SUS)
meanB_CCM <- mean(B$CCM.SUS)

usability <- c(meanA_GCM,meanB_GCM,meanA_CCM,meanB_CCM)
print("usability:")
print("meanA_GCM, meanB_GCM, meanA_CCM, meanB_CCM")
print(usability)


#########Cognitive Load Analysis : 

#GCM
meanA_GCM <- mean(A$GCM.NASA.TLX)
meanB_GCM <- mean(B$GCM.NASA.TLX)

#CCM
meanA_CCM <- mean(A$CCM.NASA.TLX)
meanB_CCM <- mean(B$CCM.NASA.TLX)

cogload <- c(meanA_GCM,meanB_GCM,meanA_CCM,meanB_CCM)
print("cognitive load:")
print("meanA_GCM, meanB_GCM, meanA_CCM, meanB_CCM")
print(cogload)





#######################TARGET TIMES: 

#read in files
A_CCM <- read.csv("TtimesA_CCM.csv")
B_CCM <- read.csv("TtimesB_CCM.csv")
A_GCM <- read.csv("TtimesA_GCM.csv")
B_GCM <- read.csv("TtimesB_GCM.csv")

#GCM
meanA_GCM <- mean(A_GCM$AvgTimePerTarget)
meanB_GCM <- mean(B_GCM$AvgTimePerTarget)
#CCM
meanA_CCM <- mean(A_CCM$AvgTimePerTarget)
meanB_CCM <- mean(B_CCM$AvgTimePerTarget) 

targetTimes <- c(meanA_GCM,meanA_CCM,meanB_GCM,meanB_CCM)
print("mean avg target times:")
print("meanA_GCM,meanA_CCM,meanB_GCM,meanB_CCM")
print(targetTimes)

barplot(targetTimes, ylim=c(0,25), 
        ylab = "Mean Target Aquision Time (seconds)",
        main="Mean Target Aquision Time for Each Magnifier Version", 
        col = c(rgb(1,0,0,0.5),rgb(0,0,0),rgb(1,0,0,0.5),rgb(0,0,0)),
        space = c(.1,.1,1,.1), legend.text = c("Gaze-Controlled Magnifier Used","Mouse-Controlled Magnifier Used" ),
        args.legend = list(x = "topleft", bty = "n"), density = c(100,20), angle = 75,
        yaxt = "n", 
        names.arg = c("                        Group A",NA,
                      "                           Group B",NA) 
)

# Changing y axis 
ytick<-seq(0, 25, by=1)
axis(side=2, at=ytick, labels = FALSE)
text(par("usr")[1], ytick,  
     labels = ytick, pos = 2, xpd = TRUE)


#GCM
stdevA_GCM <- sd(A_GCM$AvgTimePerTarget)
stdevB_GCM <- sd(B_GCM$AvgTimePerTarget)
#CCM
stdevA_CCM <- sd(A_CCM$AvgTimePerTarget)
stdevB_CCM <- sd(B_CCM$AvgTimePerTarget) 

SDtargetTimes <- c(stdevA_GCM,stdevA_CCM,stdevB_GCM,stdevB_CCM)
print("stdev of avg target times:")
print("stdevA_GCM,stdevA_CCM,stdevB_GCM,stdevB_CCM")
print(SDtargetTimes)

xLocations = c(0.6,1.7,3.75,4.8)
segments(xLocations,targetTimes-SDtargetTimes,xLocations,targetTimes+SDtargetTimes)
epsilon <- 0.02
segments(xLocations-epsilon,targetTimes-SDtargetTimes,xLocations+epsilon,targetTimes-SDtargetTimes)
segments(xLocations-epsilon,targetTimes+SDtargetTimes,xLocations+epsilon,targetTimes+SDtargetTimes)


print("Group A T-Test:")
#Group A t-test 
print(t.test(A_GCM$AvgTimePerTarget,A_CCM$AvgTimePerTarget) )

print("Gropu B T-Test:")
#Group B t-test 
print(t.test(B_GCM$AvgTimePerTarget,B_CCM$AvgTimePerTarget) )



#Target times for both groups combined... 


both_GCM <- c(A_GCM$AvgTimePerTarget,B_GCM$AvgTimePerTarget)
both_CCM <- c(A_CCM$AvgTimePerTarget,B_CCM$AvgTimePerTarget)
meanGCM <- mean(both_GCM)
meanCCM <- mean(both_CCM)

targetTimes <- c(meanGCM,meanCCM)
print("mean avg target times:")
print("mean_GCM,mean_CCM")
print(targetTimes)

barplot(targetTimes, ylim=c(0,25), 
        ylab = "Mean Target Acquisition Time (seconds)",
        main="Mean Target Acquisition Time for Each Magnifier Version", 
        yaxt = "n",
        names.arg = c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), 
        xlab = "Magnifier Version Used",
        col = c(rgb(1,0,0,0.5),rgb(0,0,0)),
        density = c(100,20), angle = 75 
)

# Changing y axis 
ytick<-seq(0, 25, by=1)
axis(side=2, at=ytick, labels = FALSE)
text(par("usr")[1], ytick,  
     labels = ytick, pos = 2, xpd = TRUE)


#GCM
stdev_GCM <- sd(both_GCM)
#CCM
stdev_CCM <- sd(both_CCM)

SDtargetTimes <- c(stdev_GCM,stdev_CCM)
print("stdev of avg target times:")
print("stdev_GCM,stdev_CCM")
print(SDtargetTimes)

xLocations = c(.7,1.9)
segments(xLocations,targetTimes-SDtargetTimes,xLocations,targetTimes+SDtargetTimes)
epsilon <- 0.02
segments(xLocations-epsilon,targetTimes-SDtargetTimes,xLocations+epsilon,targetTimes-SDtargetTimes)
segments(xLocations-epsilon,targetTimes+SDtargetTimes,xLocations+epsilon,targetTimes+SDtargetTimes)


print("Both Groups Target Times T-Test")
print(t.test(both_GCM,both_CCM) )




#######################READING SPEEDS (WPM): 

print('')
print('Reading!!!!!!!!!!!!')
print('')

#read in files
A_CCM <- read.csv("RSpeedsA_CCM.csv", na.strings = "NA")
B_CCM <- read.csv("RSpeedsB_CCM.csv", na.strings = "NA")
A_GCM <- read.csv("RSpeedsA_GCM.csv", na.strings = "NA")
B_GCM <- read.csv("RSpeedsB_GCM.csv", na.strings = "NA")

#get average speeds of each person in each of the four groups 


avgSpeedsA_CCM <- c(0,0,0,0,0,0,0,0,0,0)
for (i in 1:10) {
        avgSpeedsA_CCM[i] <- mean(c(A_CCM$R1[i],
                                    A_CCM$R2[i],
                                    A_CCM$R3[i],
                                    A_CCM$R4[i],
                                    A_CCM$R5[i],
                                    A_CCM$R6[i], 
                                    A_CCM$R7[i],
                                    A_CCM$R8[i]) , na.rm = TRUE  ) 
}

avgSpeedsA_GCM <- c(0,0,0,0,0,0,0,0,0,0)
for (i in 1:10) {
        avgSpeedsA_GCM[i] <- mean(c(A_GCM$R1[i],
                                    A_GCM$R2[i],
                                    A_GCM$R3[i],
                                    A_GCM$R4[i],
                                    A_GCM$R5[i],
                                    A_GCM$R6[i], 
                                    A_GCM$R7[i],
                                    A_GCM$R8[i]) , na.rm = TRUE) 
}

avgSpeedsB_CCM <- c(0,0,0,0,0,0,0,0,0)
for (i in 1:9) {
        avgSpeedsB_CCM[i] <- mean(c(B_CCM$R1[i],
                                    B_CCM$R2[i],
                                    B_CCM$R3[i],
                                    B_CCM$R4[i],
                                    B_CCM$R5[i],
                                    B_CCM$R6[i], 
                                    B_CCM$R7[i],
                                    B_CCM$R8[i]) , na.rm = TRUE) 
}

avgSpeedsB_GCM <- c(0,0,0,0,0,0,0,0,0)
for (i in 1:9) {
        avgSpeedsB_GCM[i] <- mean(c(B_GCM$R1[i],
                                    B_GCM$R2[i],
                                    B_GCM$R3[i],
                                    B_GCM$R4[i],
                                    B_GCM$R5[i],
                                    B_GCM$R6[i], 
                                    B_GCM$R7[i],
                                    B_GCM$R8[i]) , na.rm = TRUE) 
}

#GCM
meanA_GCM <- mean(avgSpeedsA_GCM)
meanB_GCM <- mean(avgSpeedsB_GCM)
#CCM
meanA_CCM <- mean(avgSpeedsA_CCM)
meanB_CCM <- mean(avgSpeedsB_CCM) 

meanReadingSpeeds <- c(meanA_GCM,meanA_CCM,meanB_GCM,meanB_CCM)
print("mean reading speeds:")
print("meanA_GCM,meanA_CCM,meanB_GCM,meanB_CCM")
print(meanReadingSpeeds)

barplot(meanReadingSpeeds, ylim=c(0,220), 
        ylab = "Mean Reading Speed (WPM)",
        main="Mean Reading Speeds for Each Magnifier Version", 
        space = c(.1,.1,1,.1), 
        legend.text = c("Gaze-Controlled Magnifier Used","Mouse-Controlled Magnifier Used" ),
        args.legend = list(x = "topright", bty = "n"),
        yaxt = "n", 
        col = c(rgb(1,0,0,0.5),rgb(0,0,0),rgb(1,0,0,0.5),rgb(0,0,0)),
        density = c(100,20), angle = 75,
        names.arg = c("                        Group A",NA,
                      "                         Group B",NA) 
)

# Changing y axis 
ytick<-seq(0, 220, by=10)
axis(side=2, at=ytick, labels = FALSE)
text(par("usr")[1], ytick,  
     labels = ytick, pos = 2, xpd = TRUE)


#GCM
stdevA_GCM <- sd(avgSpeedsA_GCM)
stdevB_GCM <- sd(avgSpeedsB_GCM)
#CCM
stdevA_CCM <- sd(avgSpeedsA_CCM)
stdevB_CCM <- sd(avgSpeedsB_CCM) 

SDspeeds <- c(stdevA_GCM,stdevA_CCM,stdevB_GCM,stdevB_CCM)
print("stdev of avg reading speeds:")
print("stdevA_GCM,stdevA_CCM,stdevB_GCM,stdevB_CCM")
print(SDspeeds)

xLocations = c(0.6,1.7,3.75,4.8)
segments(xLocations,meanReadingSpeeds-SDspeeds,xLocations,meanReadingSpeeds+SDspeeds)
epsilon <- 0.02
segments(xLocations-epsilon,meanReadingSpeeds-SDspeeds,xLocations+epsilon,meanReadingSpeeds-SDspeeds)
segments(xLocations-epsilon,meanReadingSpeeds+SDspeeds,xLocations+epsilon,meanReadingSpeeds+SDspeeds)


##T - TESTS
print("Group A T-Test:")
#Group A t-test 
print(t.test(avgSpeedsA_GCM,avgSpeedsA_CCM) )

print("Gropu B T-Test:")
#Group B t-test 
print(t.test(avgSpeedsB_GCM,avgSpeedsB_CCM) )

readline(prompt="Press [enter] to continue")




###########################Analysis of two subgroups of Group A #############

#target times - 

#read in files
A_CCM <- read.csv("TtimesA_CCM.csv")
A_GCM <- read.csv("TtimesA_GCM.csv")

#GCM
timesA_GCM <- A_GCM$AvgTimePerTarget
A_20_GCM <- c(timesA_GCM[2],timesA_GCM[4],timesA_GCM[5],timesA_GCM[6], timesA_GCM[8],timesA_GCM[9] )
A_Lenses_GCM <- c(timesA_GCM[1],timesA_GCM[3],timesA_GCM[7],timesA_GCM[10] )
#CCM
timesA_CCM <- A_CCM$AvgTimePerTarget
A_20_CCM <- c(timesA_CCM[2],timesA_CCM[4],timesA_CCM[5],timesA_CCM[6], timesA_CCM[8],timesA_CCM[9] )
A_Lenses_CCM <- c(timesA_CCM[1],timesA_CCM[3],timesA_CCM[7],timesA_CCM[10] )

print(A_20_GCM)
print(A_Lenses_GCM)
print(A_20_CCM)
print(A_Lenses_CCM)


##T - TESTS comparing two subgroups of Group A
print("GCM T-Test:")
print(t.test(A_20_GCM,A_Lenses_GCM) )
# p = 0.4112 so there is no statistically significant differance in these means 

print("CCM T-Test:")
print(t.test(A_20_CCM,A_Lenses_CCM) )
# p = 0.531 so there is no statistically significant differance in these means 



#reading speeds - 

#GCM
speedsA_GCM <- avgSpeedsA_GCM
A_20_GCM <- c(speedsA_GCM[2],speedsA_GCM[4],speedsA_GCM[5],speedsA_GCM[6], speedsA_GCM[8],speedsA_GCM[9] )
A_Lenses_GCM <- c(speedsA_GCM[1],speedsA_GCM[3],speedsA_GCM[7],speedsA_GCM[10] )
#CCM
speedsA_CCM <- avgSpeedsA_CCM
A_20_CCM <- c(speedsA_CCM[2],speedsA_CCM[4],speedsA_CCM[5],speedsA_CCM[6], speedsA_CCM[8],speedsA_CCM[9] )
A_Lenses_CCM <- c(speedsA_CCM[1],speedsA_CCM[3],speedsA_CCM[7],speedsA_CCM[10] )

print(A_20_GCM)
print(A_Lenses_GCM)
print(A_20_CCM)
print(A_Lenses_CCM)


##T - TESTS comparing two subgroups of Group A
print("GCM T-Test:")
print(t.test(A_20_GCM,A_Lenses_GCM) )
# p = 0.9943 so there is no statistically significant differance in these means 

print("CCM T-Test:")
print(t.test(A_20_CCM,A_Lenses_CCM) )
# p = 0.5633 so there is no statistically significant differance in these means 


#################SUS and Cog Load Scatter Plots #################
#(Above anaysis not appropriate for this type of data)

#re-read in files
#usability
A <- read.csv("groupA.csv")
B <- read.csv("groupB.csv")
#targets
A_CCM <- read.csv("TtimesA_CCM.csv")
B_CCM <- read.csv("TtimesB_CCM.csv")
A_GCM <- read.csv("TtimesA_GCM.csv")
B_GCM <- read.csv("TtimesB_GCM.csv")


#Usability vs. Target Times... 
#Group A 
#target times on x, usability socre on y, gaze controlled in red and cursor controlled in blue
plot(A_CCM$AvgTimePerTarget,A$CCM.SUS, col = "blue", ylim = c(0,100), xlim = c(0,30),
     xlab = "Average Target Aquisition Time (seconds)",
     ylab = "System Usability Score", 
     main = "Group A - System Usability Score vs. Average Target Aquisition Time" )
points(A_GCM$AvgTimePerTarget,A$GCM.SUS, col = "red") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Group B 
#target times on x, usability socre on y, gaze controlled in red and cursor controlled in blue
plot(B_CCM$AvgTimePerTarget,B$CCM.SUS, col = "blue", ylim = c(0,100), xlim = c(0,30),
     xlab = "Average Target Aquisition Time (seconds)",
     ylab = "System Usability Score", 
     main = "Group B - System Usability Score vs. Average Target Aquisition Time" )
points(B_GCM$AvgTimePerTarget,B$GCM.SUS, col = "red") 
legend(-.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Both
#target times on x, usability socre on y, gaze controlled in red and cursor controlled in blue
plot(B_CCM$AvgTimePerTarget,B$CCM.SUS, col = "blue", ylim = c(0,100), xlim = c(0,30),
     xlab = "Average Target Aquisition Time (seconds)",
     ylab = "System Usability Score", 
     main = "System Usability Score vs. Average Target Aquisition Time" )
points(B_GCM$AvgTimePerTarget,B$GCM.SUS, col = "red") 
points(A_GCM$AvgTimePerTarget,A$GCM.SUS, col = "red") 
points(A_CCM$AvgTimePerTarget,A$CCM.SUS, col = "blue") 
legend(-.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))


#Usability vs. Reading Speeds... 
#Group A 
#reading speeds on x, usability socre on y, gaze controlled in red and cursor controlled in blue
plot(avgSpeedsA_CCM,A$CCM.SUS, col = "blue", ylim = c(0,100), xlim = c(0,250),
     xlab = "Average Reading Speed (WPM)",
     ylab = "System Usability Score", 
     main = "Group A - System Usability Score vs. Average Reading Speed" )
points(avgSpeedsA_GCM,A$GCM.SUS, col = "red") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Group B 
#reading speeds on x, usability socre on y, gaze controlled in red and cursor controlled in blue
plot(avgSpeedsB_CCM,B$CCM.SUS, col = "blue", ylim = c(0,100), xlim = c(0,250),
     xlab = "Average Reading Speed (WPM)",
     ylab = "System Usability Score", 
     main = "Group B - System Usability Score vs. Average Reading Speed" )
points(avgSpeedsB_GCM,B$GCM.SUS, col = "red") 
legend(130,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Both
#reading speeds on x, usability socre on y, gaze controlled in red and cursor controlled in blue
plot(avgSpeedsB_CCM,B$CCM.SUS, col = "blue", ylim = c(0,100), xlim = c(0,250),
     xlab = "Average Reading Speed (WPM)",
     ylab = "System Usability Score", 
     main = "System Usability Score vs. Average Reading Speed" )
points(avgSpeedsB_GCM,B$GCM.SUS, col = "red") 
points(avgSpeedsA_GCM,A$GCM.SUS, col = "red") 
points(avgSpeedsA_CCM,A$CCM.SUS, col = "blue") 
legend(130,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))

#Cog Load vs. Target Times... 
#Group A 
#target times on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(A_CCM$AvgTimePerTarget,A$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,30),
     xlab = "Average Target Aquisition Time (seconds)",
     ylab = "Cognitive Work Load Score", 
     main = "Group A - Cognitive Work Load Score vs. Average Target Aquisition Time" )
points(A_GCM$AvgTimePerTarget,A$GCM.NASA.TLX, col = "red") 
legend(16,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Group B 
#target times on x, cog load on y, gaze controlled in red and cursor controlled in blue
plot(B_CCM$AvgTimePerTarget,B$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,30),
     xlab = "Average Target Aquisition Time (seconds)",
     ylab = "Cognitive Work Load Score", 
     main = "Group B - Cognitive Work Load Score vs. Average Target Aquisition Time" )
points(B_GCM$AvgTimePerTarget,B$GCM.NASA.TLX, col = "red") 
legend(-.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Both
#target times on x, cog load on y, gaze controlled in red and cursor controlled in blue
plot(B_CCM$AvgTimePerTarget,B$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,30),
     xlab = "Average Target Aquisition Time (seconds)",
     ylab = "Cognitive Work Load Score", 
     main = "Cognitive Work Load Score vs. Average Target Aquisition Time" )
points(B_GCM$AvgTimePerTarget,B$GCM.NASA.TLX, col = "red") 
points(A_GCM$AvgTimePerTarget,A$GCM.NASA.TLX, col = "red") 
points(A_CCM$AvgTimePerTarget,A$CCM.NASA.TLX, col = "blue") 
legend(16,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))



#Cog Load vs. Reading Speeds... 
#Group A 
#reading speeds on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(avgSpeedsA_CCM,A$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,250),
     xlab = "Average Reading Speed (WPM)",
     ylab = "Cognitive Work Load Score", 
     main = "Group A - Cognitive Work Load Score vs. Average Reading Speed" )
points(avgSpeedsA_GCM,A$GCM.NASA.TLX, col = "red") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Group B 
#reading speeds on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(avgSpeedsB_CCM,B$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,250),
     xlab = "Average Reading Speed (WPM)",
     ylab = "Cognitive Work Load Score", 
     main = "Group B - Cognitive Work Load Score vs. Average Reading Speed" )
points(avgSpeedsB_GCM,B$GCM.NASA.TLX, col = "red") 
legend(130,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Both 
#reading speeds on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(avgSpeedsB_CCM,B$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,250),
     xlab = "Average Reading Speed (WPM)",
     ylab = "Cognitive Work Load Score", 
     main = "Cognitive Work Load Score vs. Average Reading Speed" )
points(avgSpeedsB_GCM,B$GCM.NASA.TLX, col = "red") 
points(avgSpeedsA_GCM,A$GCM.NASA.TLX, col = "red") 
points(avgSpeedsA_CCM,A$CCM.NASA.TLX, col = "blue") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))


#Usability vs. Cognitive Work Load... 
#Group A 
#usability score on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(A$CCM.SUS,A$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,100),
     xlab = "System Usability Score",
     ylab = "Cognitive Work Load Score", 
     main = "Group A - Cognitive Work Load Score vs. System Usability Score" )
points(A$GCM.SUS,A$GCM.NASA.TLX, col = "red") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Group B 
#usability score on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(B$CCM.SUS,B$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,100),
     xlab = "System Usability Score",
     ylab = "Cognitive Work Load Score", 
     main = "Group B - Cognitive Work Load Score vs. System Usability Score" )
points(B$GCM.SUS,B$GCM.NASA.TLX, col = "red") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))
#Both Groups 
#usability score on x, cog load socre on y, gaze controlled in red and cursor controlled in blue
plot(B$CCM.SUS,B$CCM.NASA.TLX, col = "blue", ylim = c(0,100), xlim = c(0,100),
     xlab = "System Usability Score",
     ylab = "Cognitive Work Load Score", 
     main = "Cognitive Work Load Score vs. System Usability Score" )
points(B$GCM.SUS,B$GCM.NASA.TLX, col = "red") 
points(A$GCM.SUS,A$GCM.NASA.TLX, col = "red") 
points(A$CCM.SUS,A$CCM.NASA.TLX, col = "blue") 
legend(-0.5,20,c("Gaze-Controlled Magnifier","Mouse-Controlled Magnifier"), fill = c("red", "blue"))


###################Notes from Miguel on T - Test, etc.  
#.05 means there is a 5% chance that this could'be 
#been explained by a distribution in which there is no differance 
#p less than 0.05 means it IS significant, 
#don't have to report t value, usually only P value reported 
##!!!!! This one: 
# P value = percent chance that data is explained by null hypothesis (no differance)

#***** IN PAPER: ********
#Must only give the P-Value from t-test. 
#Can put P-Values directly in text or organize into a table


#confidence interval: 
#the more narrow this interval is the more condifent you are
#In order to be 95% confident, in the differance, you can only conculude that 
#the differance is in this interval. 

#It is easier to get a statistically significant result with a large sample size. 
#small sample size make it hard to get a statisically significant result 

# Anova : for more than two populations 
#analysis of vairance 
# you calculate F statistic which is a metric involving variances 
# Two groups using two softwares may be something that we can do an anova for, he isn't sure
# but honeslty is prolly unncessary, can just stick with t-test to show significance. 





#####################Study 2 analysis notes: 
#qualitative analysis will be useful 
#For two participants who used GCM, show data explicitely because their are only two of them
# reading speeds, target times, scores, etc. 
#explain why it worked for them and not the others 





