library(lubridate)
library(data.table)
library(dplyr)
library(beepr)

#Cases in school board partners
Aloc <- "https://data.ontario.ca/dataset/b1fef838-8784-4338-8ef9-ae7cfd405b41/resource/245479eb-db0a-4ec4-97af-459d61da0801/download/schoolpartnersactivecovid.csv"

#Summary of Cases in Schools 
Bloc <- "https://data.ontario.ca/dataset/b1fef838-8784-4338-8ef9-ae7cfd405b41/resource/7fbdbb48-d074-45d9-93cb-f7de58950418/download/schoolcovidsummary.csv"
#Schools with active COVID19 cases 
Cloc <- "https://data.ontario.ca/dataset/b1fef838-8784-4338-8ef9-ae7cfd405b41/resource/8b6d22e2-7065-4b0f-966f-02640be366f2/download/schoolsactivecovid.csv"


Cases_SchoolBoard_Partners <- data.table::fread(input = Aloc, encoding = "UTF-8",data.table = F)
SummarySchoolCases <- data.table::fread(input = Bloc, encoding = "UTF-8",data.table = F)
ActiveSchoolCases <- data.table::fread(input = Cloc, encoding = "Latin-1",data.table = F)

#create .csv for each date of dataset
dirPath <- paste(getwd(), "/datasets/", sep = "")

#Delete files if exists 
do.call(file.remove, list(list.files(dirPath, full.names = TRUE)))


fileName = paste(dirPath, 'Cases_SchoolBoard_Partners.csv',sep = '')
#Write A File 
write.csv(Cases_SchoolBoard_Partners, 
          file = fileName, 
          fileEncoding = 'UTF-8', 
          row.names = F)



####################################
# Writing B files to disk 
fileName = paste(dirPath, 'SummarySchoolCases.csv',sep = '')
#Write Case Status File 
write.csv(SummarySchoolCases, 
          file = fileName, 
          fileEncoding = 'UTF-8', 
          row.names = F)


####################################
# Writing C files to disk 
fileName = paste(dirPath, 'ActiveSchoolCases.csv',sep = '')
#Write Case Status File 
write.csv(ActiveSchoolCases, 
          file = fileName, 
          fileEncoding = "UTF-8", 
          row.names = F)
beep(sound = 1, expr = NULL)
print(paste("Download Completed"))

#garbage collection, deletes files from local environment to free up space after download is done 

remove(list = ls())
