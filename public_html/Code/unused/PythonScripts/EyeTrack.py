# -*- coding: utf-8 -*-

class EyeTrack:
    #Defines the features in the Affdex Data Stream
    def __init__(self,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18):
        self.SeqNum=D1
        self.EventSource=D2
        self.SampleName=D3
        self.Timestamp=D4
        self.MediaTime=D5
        self.ETTimestamp=D6
        self.GazeLeftX=D7
        self.GazeLeftY=D8
        self.GazeRightX=D9
        self.GazeRightY=D10
        self.LeftPupilDiam=D11
        self.RightPupilDiam=D12
        self.LeftEyeDist=D13
        self.RightEyeDist=D14
        self.LeftEyePosX=D15
        self.LeftEyePosY=D16
        self.RightEyePosX=D17
        self.RightEyePosY=D18