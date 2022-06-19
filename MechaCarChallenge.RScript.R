#DELIVERABLE 1 

#IMPORT LIBRARY 
library(dbplyr)

#READ CSV
MechaCar_MPG <- read.csv('MechaCar_mpg.csv') #import 

#TEST DATAFRAME 
head(MechaCar_MPG)

#LIN REGRESSION 
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_MPG)

# SUMMARY 
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_MPG))

# DELIVERABLE 2 
# IMPORT CSV 
Suspension_Coil <- read.csv('Suspension_Coil.csv') #import 

#TEST DATAFRAME 
head(Suspension_Coil) 

#SUMMARY  
summarize_Coil <- Suspension_Coil %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI), .groups = 'keep') 

# SUMMARY BY LOT 
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot)  %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),SD_PSI=sd(PSI), .groups = 'keep') 


#DELIVERABLE 3 

#T-TEST SCRIPT ALL LOTS   
t.test((Suspension_Coil$PSI),mu=1500)


#T-TESTS BY LOT 
t.test(subset(Suspension_Coil,Manufacturing_Lot =="Lot1")$PSI,mu = 1500)
t.test(subset(Suspension_Coil,Manufacturing_Lot =="Lot2")$PSI,mu = 1500)
t.test(subset(Suspension_Coil,Manufacturing_Lot =="Lot3")$PSI,mu = 1500)

