scoresINorder = [3,3,5,4,3,1,5,3,4,4]

score = 0
for i in range(10):
	if i%2 == 0: #if i is even (odd numbered questions) 
		score += (scoresINorder[i] - 1 ) 
	else: #even numbered quesions 
		score += (5 - scoresINorder[i])

score = score*2.5 
print(score) #usability score out of 100, higher is better 

#Note: The score is not a percentage. It is a ranking out of 100 
# The average ranking is a score of 68, not 50. Anything above 68 is above average. 
		
#	https://measuringu.com/sus/
