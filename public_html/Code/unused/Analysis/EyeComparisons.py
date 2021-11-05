#Created by Dalton Rutledge 7/18/2019
#takes CSV files from participant data (iMotions)
#outputs percentage of valid eye-data from each participant
#for all participants see ValidSamples.py
#this file focuses on comparing valid samples between eyes for participants who reported severe differences in eye sight between left and right. 


import pandas


#List of all CSV files of participant data to iterate over, tupled with which eye is BAD for that participant
csvs = [ ('P1-Reading.csv', 'left'), ('P2-CCM.csv', 'right'), ('P2-GCM.csv', 'right'), ('P2-Reading.csv', 'right'), ('P3-Reading.csv','left')]

#empty list for containing tuples of (csv, bad eye percentage valid data, good eye percentage valid data, totalvalid data). This is results!
SampleSuccessRates = []

#for each csv file, loop through that file and find all invalid samples. Then calculate the percentage of valid samples and append to the results list
for curr_csv in csvs:
    df = pandas.read_csv(curr_csv[0])
    badCount = 0
    size = len(df['GazeX'])
    for i in range(size):
        if df['GazeX'][i] == -1 or df['GazeY'][i] == -1:
            badCount += 1
    validSamplesPercentage = (1 - (badCount / size)) * 100

    badCount = 0
    for i in range(size):
        if df['GazeLeftx'][i] == -1 or df['GazeLefty'][i] == -1:
            badCount += 1
    validLeftPercentage = (1 - (badCount / size)) * 100
    
    badCount = 0
    for i in range(size):
        if df['GazeRightx'][i] == -1 or df['GazeRighty'][i] == -1:
            badCount += 1
    validRightPercentage = (1 - (badCount / size)) * 100

   

    SampleSuccessRates.append( (curr_csv[0], curr_csv[1], validLeftPercentage, validRightPercentage, validSamplesPercentage) )


#print results, copy into another file called 'ValidSamplesPercentages.txt' in Processed Data folder of the Google Drive
print(SampleSuccessRates)

