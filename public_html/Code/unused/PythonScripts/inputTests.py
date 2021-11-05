from pynput.mouse import Button, Controller
import pyautogui
import time
import mouse
import pywinauto
import mouseSim
import pymouse
#get screen size
screen = pyautogui.size()

center_screen = (screen[0]/2, screen[1]/2)

m = pymouse()

m.move(screen[0].screen[1])



#for mouseSim.py (using ctypes to simulate diret input to windows API)
'''
direct_mouse = mouseSim.Mouse()

direct_mouse.move_mouse(center_screen)

for x in range(10):                                              #holy cow this one actually works. Need to find a better direct input simulator
    direct_mouse.move_mouse((screen[0]/4, screen[1]/4))
    time.sleep(1)
    direct_mouse.move_mouse(center_screen)
    time.sleep(1)

'''


#for pyautogui keyboard (to be tested with windows magnifier)
'''
for i in range(40):
    pyautogui.hotkey('ctrl','alt','left')               # works, but is too slow
    pyautogui.hotkey('ctrl','alt','down')
'''



#for mouse mouse
'''
mouse.move(screen[0]/2,screen[1]/2, True, 0.25)
for i in range(10):
    mouse.move(100, 0, 0.25)
    mouse.move(0, -100, 0.25)
    mouse.move(-100, 0, 0.25)
    mouse.move(0, 100, 0.25)
    mouse.move(10, 10, 0.25)
'''


#for pyautogui mouse
'''
pyautogui.moveTo(screen[0]/2, screen[1]/2)

for i in range(5):
    pyautogui.move(100, 0, 0.25)
    pyautogui.move(0, -100, 0.25)
    pyautogui.move(-100, 0, 0.25)
    pyautogui.move(0, 100, 0.25)
    pyautogui.move(10, 10, 0.25)
'''

#for pynput mouse
'''
pynputMouse = Controller()

pynputMouse.position = (screen[0]/2, screen[1]/2)

for i in range(10):
    pynputMouse.move(100, 0)
    time.sleep(.25)
    pynputMouse.move(0, -100)
    time.sleep(.25)
    pynputMouse.move(-100, 0)
    time.sleep(.25)
    pynputMouse.move(0, 100)
    time.sleep(.25)
    pynputMouse.move(30, 30)
    time.sleep(.25)

pynputMouse.click(Button.left, 1)
'''
