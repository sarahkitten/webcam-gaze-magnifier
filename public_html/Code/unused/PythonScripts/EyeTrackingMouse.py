#Created by Dalton Rutledge 6/16/2019

import socket                   #for port connections
import pyautogui                #for automating input
from EyeTrack import EyeTrack   #for processing eyetracking data
import statistics               #for averaging
import mouseSim                 #for simulating direct mouse input to Windows


'''EDIT starter variables as necessary. ALWAYS SAVE GOOD SETTINGS!!!
    
Working configurations: 
    1) .4, .6, 25, 2, .25, .25, 10   -- kinda works
    2) .4, .6, 10, 2, .25, .25, 10   -- lower sample size gives a wider degree of control
    3) .4, .6, 10, 2, .30, .30, 15   -- slighlty larger proximity box makes the box less shaky
    4) .45, .65, 15, 2, .3, .3, 20   -- increased magnifier area (without actually changing the magnifier) to make scrolling to the sides easier (without jumping)
    5) .45, .65, 15, 2, .3, .3, 5    -- trying out smallet smoothing factor, makes it worse, prefer 10 grouping size
        ABOVE IS BEST FOR ZOOM OF 2
        BELOW IS BEST FOR ZOOM OF 3
    1) .4, .6. 5, 3, .25, .25, 3 = STUDY SETTINGS. ALWAYS RUN WITH THESE
'''

#starter variables 
current_mag_x = .4          #magnifier size as a ratio to full screen resolution in x direction (i.e. .2 = 20% of current screen resolution in x direction)
current_mag_y = .6          #magnifier size as a ratio to full screen resolution in y direction (i.e. .2 = 20% of current screen resolution in y direction)
grouping_size = 5             #amount of samples to take before moving the mouse cursor
zoom = 3                      #the zoom level of the magnifier (i.e. 2 = 200%, 1.5 = 150%, etc.)
proximityRatioX = .25         #define the ratio of width of a rectangle where consecutive nearby samples will not generate a mouse movement (i.e. .4 --> a 40% from center of magnifier)
proximityRatioY = .25         #same as above but with respects to y (or height)
                              #keep proximity box ratio = (16 / 9) because that is the ratio of the screen resolution (and thus the magnifier)
smoothingFactor = 3          #set the number of mouse inputs to simulate for panning


''' Rest of code runs the server, no need to edit except for major changes'''
#setting up GUI settings
screenX, screenY = pyautogui.size()             # find screen size in pixels 
magnifierX = screenX * current_mag_x            #calculate size of magnifier in x direction in pixels
magnifierY = screenY * current_mag_y            #calculate size of magnifier in y direction in pixels
proximityBoxX = magnifierX * proximityRatioX    #caluclate size of proximity box in x direction in pixels
proximityBoxY = magnifierY * proximityRatioY    #caluclate size of proximity box in y direction in pixels
                       

#disable failsafe (prevents pyautogui from crashing if the cursor reaches top left corner of screen)
pyautogui.FAILSAFE = False

#initalize some things:
mouse = mouseSim.Mouse()          #mouse object (allows for simulated direct input)
count = 0                         #counting variable for grouping. Always starts at 0
current_x_set = []                #grouped set of x readings
current_y_set = []                #grouped set of y readings
prev_x = 0                        #last mean value of x
prev_y = 0                        #last mean value of y

#Setting up port connection
UDP_IP = "127.0.0.1"
UDP_PORT = 8088
s= socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind((UDP_IP, UDP_PORT))
BUFFER_SIZE = 2048   #minimum 2048 (values lower sometimes stop the program because the buffer size is exceeded)

#establish first connection to the port
data = s.recv(BUFFER_SIZE)

#running the server until it is manually stopped (or if buffer size is exceeded)
while(True):

    #receive data
    data = s.recv(BUFFER_SIZE)        
    
    #decode data into accessible info
    data_string = data.decode("utf-8")
    D = data_string.split(";")

     
    #only work with data from the eye-tracker
    if D[2] == "EyeData":    
        #filter out all data where gaze tracker registers no gaze. If we receive a -1,  exit the current loop and receive new data
        if D[7] == '-1':
            continue
        #translate data into workable info, to see full list of D data, consult Eyetrack.py
        EyeTrackObj = EyeTrack(D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7], D[8], D[9], D[10], D[11], D[12], D[13], D[14], D[15], D[16], D[17])
        #calculate screen coordinates of gaze
        x,y = ( (int(EyeTrackObj.GazeLeftX) + int(EyeTrackObj.GazeRightX)) /2 ) ,  ( (int(EyeTrackObj.GazeLeftY) + int(EyeTrackObj.GazeRightY) ) /2) 
        #add coordinates to set, and count up
        current_x_set.append(x)
        current_y_set.append(y)
        count += 1
        #count controls how many eye-tracking samples you take before moving the mouse cursor. Once count = grouping size, move the mouse cursor
        if count == grouping_size:   
            #calculate average (x,y) of gaze
            x = statistics.mean(current_x_set)
            y = statistics.mean(current_y_set)

            #if gaze is on average outside of the magnifier range, move the cursor there, and update latest position to that coordinate
            if (abs(x-prev_x) > magnifierX or abs(y-prev_y) > magnifierY):
                mouse.move_mouse((x,y))
                mouse.move_mouse((x+1,y+1))
                prev_x = x
                prev_y = y

            #else if gaze is on average within the same proximity as last sample, keep the cursor in the same position. don't update position
            elif (abs(x-prev_x) <= proximityBoxX and abs(y-prev_y) <= proximityBoxY):
                mouse.move_mouse((prev_x, prev_y))
            
            #otherwise, pan the cursor within the magnifier range based on zoom, and update last position based on that coordinate
            else:
                #for i in range( 1, smoothingFactor + 1):      #for 200% zoom, use midpoint
                    #t = (i * (1/smoothingFactor))**(1/4)
                    #mouse.move_mouse( (prev_x + (((x + prev_x) / zoom) - prev_x) * t , prev_y + (((y + prev_y) / zoom) - prev_y) * t ) )
                #prev_x = ((x + prev_x) / zoom)
                #prev_y = ((y + prev_y) / zoom)
                
                x = (2/3)*prev_x + (1/3)*x                     #for 300% zoom, calculate the point that is 1/3rd distance between old and new
                y = (2/3)*prev_y + (1/3)*y                 
                for i in range( 1, smoothingFactor + 1):
                    t = (i * (1/smoothingFactor))
                    mouse.move_mouse(    (prev_x + (x - prev_x) * t, prev_y + (y - prev_y)*t     )    )
                prev_x = x
                prev_y = y


            #reset varaibles to start grouping again based on last mean gaze position

            count = 0
            current_x_set = []
            current_y_set = []