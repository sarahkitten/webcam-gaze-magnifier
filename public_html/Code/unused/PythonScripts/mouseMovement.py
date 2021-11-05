import pyautogui

#get screen size, move mouse to center screen
screen = pyautogui.size()
pyautogui.moveTo(screen[0]/2, screen[1]/2)

#drag the mouse in a square 4 times (move 5,5 away in between squares)
for i in range(10):
      pyautogui.dragRel(100, 0, duration=0.25)
      pyautogui.dragRel(0, 100, duration=0.25)
      pyautogui.dragRel(-100, 0, duration=0.25)
      pyautogui.dragRel(0, -100, duration=0.25)
      pyautogui.moveRel(5,5)
