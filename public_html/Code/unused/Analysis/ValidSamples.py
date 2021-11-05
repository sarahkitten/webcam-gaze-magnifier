#Created by Dalton Rutledge 7/18/2019
#takes CSV files from participant data (iMotions)
#outputs percentage of valid eye-data from each participant


import pandas


#List of all CSV files of participant data to iterate over
csvs = ['P1-Reading.csv', 'P2-CCM.csv', 'P2-GCM.csv' ,'P2-Reading.csv', 
        'P3-Reading.csv','P4-CCM.csv','P4-GCM.csv','P4-Reading.csv',
        'P5-CCM.csv','P5-Reading.csv','P6-CCM.csv','P6-Reading.csv',
        'P7-Reading(NoMag).csv','P7-Target(NoMag).csv']

#empty list for containing tuples of (csv, percentage valid data). This is results!
SampleSuccessRates = []

#for each csv file, loop through that file and find all invalid samples. Then calculate the percentage of valid samples and append to the results list
for curr_csv in csvs:
    df = pandas.read_csv(curr_csv)
    badCount = 0
    size = len(df['GazeX'])
    for i in range(size):
        if df['GazeX'][i] == -1 or df['GazeY'][i] == -1:
            badCount += 1

    validSamplesPercentage = (1 - (badCount / size)) * 100
    SampleSuccessRates.append( (curr_csv, validSamplesPercentage) )

print(SampleSuccessRates)

