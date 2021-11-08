# Webcam Gaze Magnifier
Made by Sarah Kitten 

This is the repository for the webcam-controlled gaze magnifier made for the 2021 Rochester Institute of Technology Computational Sensing for Human-centered AI REU (research experience for undergraduates).  The program uses the GazeRecorder API to track eye gaze through an ordinary webcam and move a Javascript-based magnifier
 
Homepage: https://cs.rit.edu/~snkreu/Homepage.html

Project visual: https://www.youtube.com/watch?v=6SClQqPEGh0

Research symposium presentation: https://www.youtube.com/watch?v=_mYukdaKJZc

index.html has links to the low-vision (unblurred background) and normal-vision (blurred background) versions of the magnifier tasks.  Homepage.html has an explanation of the project, links to normal-vision versions of the magnifier tasks, and embedded videos.

blurredReading.html and blurredTarget.html are versions of the reading and target tasks where the image outside the magnifier is blurred so that people without low vision can try the tasks with a more accurate experience.  readingStudy.html and targetStudy.html are the original tasks.  magStyle.css contains the styling for the magnifier.

imgs contains all images used in the tasks.  js contains gazeMagnifier.js, which powers the magnifier, controls, and eye tracking.  tasks contains the original task pages from which the task images were made.
