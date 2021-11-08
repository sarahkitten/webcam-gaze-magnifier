/*
	Gaze Magnifier
	Sarah Kitten
	Modified 11/5/2021
	Based on code from:
		Image magnifier: https://www.w3schools.com/howto/howto_js_image_magnifier_glass.asp
		Timer: https://jsfiddle.net/zymLk973/
*/

function magnify(imgID, doc, startEyeTracking, stopEyeTracking, tasks, blur = false) {
	/************************************************ ADJUSTABLE VARIABLES ********************************************* */

	/* Variables storing the current size and magnification level of the magnifier (px) -- defaults can be adjusted */
	var glassWidth = 600;
	var glassHeight = 300;
	var zoom = 4;

	/* Millisecond interval for moving the magnifier glass-- can be adjusted */
	var moveInterval = 30;

	/* Millisecond interval for logging gaze coordinates-- can be adjusted */
	var gazeRecordInterval = 200;

	/* Variables for key controls -- alter these to change the controls */
		// Manual control of magnifier position
		var upKey = "KeyW";
		var leftKey = "KeyA";
		var downKey = "KeyS";
		var rightKey = "KeyD";

		// Press to increase magnifier zoom, press while holding ctrl to decrease magnifier zoom
		var zoomKey = "KeyZ";

		// Change size of magnifier glass
		var expandVertKey = "ArrowDown";
		var shrinkHorizKey = "ArrowLeft";
		var shrinkVertKey = "ArrowUp";
		var expandHorizKey = "ArrowRight";

		// Hold to lock magnifier to only horizontal motion (for reading), release for normal controls
		var hLockKey = "Enter";

		// Press to record task time and proceed to the next task, press while holding ctrl to start eye tracking
		var nextTask_ctrlEyeTrackKey = "KeyN";

		// Press to call displayInfo or displayInstructions functions
		var infoKey = "KeyI";
		var instrKey = "Escape";

	/************************************************ NON-ADJUSTABLE VARIABLES ********************************************* */

	/* Variables tracking the current state of the program */
	var mouseControl = true;
	var hLock = false;
	var nextTaskIndex = 0;

	/* Variables tracking the use of horizontal lock and WASD controls */
	var hLockCount = 0;
	var wasdCount = 0;

	/* Variables logging task completion times and gaze coordinates */
	var timesString = "";
	var coordsString = "";

	/* Variables used by timer functions */
	var startTime, updatedtime, difference, tInterval, savedTime, minutes, seconds, milliseconds;
	var paused = 0;
	var running = 0;

	/************************************************ MAGNIFIER SETUP ********************************************* */

	var img, glass, w, h, bw;
	img = document.getElementById(imgID);

	/*create magnifier glass:*/
	glass = document.createElement("DIV");
	glass.setAttribute("class", "img-magnifier-glass");
	glass.style.height = glassHeight.toString() + "px";
	glass.style.width = glassWidth.toString() + "px";

	/*insert magnifier glass:*/
	img.parentElement.insertBefore(glass, img);

	/*set background properties for the magnifier glass:*/
	if (blur) {
		// set mag background image to the non-blurred version
		glass.style.backgroundImage = "url('" + img.src.slice(0, -9) + ".png" + "')";
	} else {
		glass.style.backgroundImage = "url('" + img.src + "')";
	}
	glass.style.backgroundRepeat = "no-repeat";
	glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
	bw = 3;
	w = glass.offsetWidth / 2;
	h = glass.offsetHeight / 2;

	/************************************************ EVENT LISTENERS ********************************************* */

	/* Move the mag to mouse (when mouseControl is true):*/
	glass.addEventListener("mousemove", moveToMouse);
	img.addEventListener("mousemove", moveToMouse);

	/* Handle keypresses */
	document.addEventListener("keydown", keyControl);
	document.addEventListener("keyup", checkHLockKeyUp);

	/* Set intervals for moving magnifier glass and logging gaze coordinates */
	setInterval(moveToGazeCoords, moveInterval);
	setInterval(recordCoords, gazeRecordInterval);

	/************************************************ END OF MAIN FUNCTION ********************************************* */

	/************************** Gaze control ****************************** */

  /* Move the magnifying glass based on the coordinates in GazeData */
  	function moveToGazeCoords() {
		var x, y, left_old, left_new, top_old, top_new, incr;
		incr = 7;
		gazeData = doc.getElementById("GazeData").innerHTML.split(" ");
		x = parseFloat(gazeData[0]);
		y = parseFloat(gazeData[1]);
		//console.log("GazeX: " + x + ", GazeY: " + y);

		/*prevent the magnifier glass from being positioned outside the image:*/
		if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
		if (x < w / zoom) {x = w / zoom;}
		if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
		if (y < h / zoom) {y = h / zoom;}

		/*move the glass towards the gaze coordinates*/
		left_old = parseInt(glass.style.left.slice(0, -2));
		left_new = left_old;
		top_old = parseInt(glass.style.top.slice(0, -2));
		top_new = top_old;
		
		if (x < (left_old + 0.5*w)) { // move the glass left
			left_new -= incr; 
			glass.style.left = (left_new) + "px";
		}
		else if (x > (left_old + 1.5*w)) { // move the glass right
			left_new += incr;
			glass.style.left = (left_new) + "px";
		}
		
		if ((!hLock) && (y < (top_old + 0.5*h))) { // move the glass up
			top_new -= incr;
			glass.style.top = (top_new) + "px";
		}
		else if ((!hLock) && (y > (top_old + 1.5*h))) { // move the glass down
			top_new += incr;
			glass.style.top = (top_new) + "px";
		}

		x = left_new + w;
		y = top_new + h;
			
		/*old code to directly set the position of the magnifier glass:*/
		//glass.style.left = (x - w) + "px";
		//glass.style.top = (y - h) + "px";

		/*display what the magnifier glass "sees":*/
		glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }

  /************************** Mouse Control ****************************** */

	function moveToMouse(e) {
		if (mouseControl) {
		var pos, x, y;
		/*prevent any other actions that may occur when moving over the image*/
		/*e.preventDefault();*/
		/*get the cursor's x and y positions:*/
		pos = getCursorPos(e);
		x = pos.x;
		y = pos.y;
		/*prevent the magnifier glass from being positioned outside the image:*/
		if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
		if (x < w / zoom) {x = w / zoom;}
		if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
		if (y < h / zoom) {y = h / zoom;}
		/*set the position of the magnifier glass:*/
		glass.style.left = (x - w) + "px";
		glass.style.top = (y - h) + "px";
		/*display what the magnifier glass "sees":*/
		glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
		}
	}

	function getCursorPos(e) {
		var a, x = 0, y = 0;
		e = e || window.event;
		/*get the x and y positions of the image:*/
		a = img.getBoundingClientRect();
		/*calculate the cursor's x and y coordinates, relative to the image:*/
		x = e.pageX - a.left;
		y = e.pageY - a.top;
		/*consider any page scrolling:*/
		x = x - window.pageXOffset;
		y = y - window.pageYOffset;
		return {x : x, y : y};
	}

	/************************** Info and logging ****************************** */

	function displayInfo() {
		// display info as an alert on infoKey keypress and copy info/coordinate data to the clipboard
		infoString = "Zoom: " + zoom + ", Height: " + glass.style.height + ", Width: " + glass.style.width
			+ ", WASD: " + wasdCount + ", HLock: " + hLockCount + "\n" + timesString;
		alert(infoString);
		coordsString = infoString + coordsString;
		const text = doc.createElement('textarea');
		text.value = coordsString;
		doc.body.appendChild(text);
		text.select();
		doc.execCommand('copy');
		doc.body.removeChild(text);
	}

	function displayInstructions() {
		// display instructions as an alert on instrKey keypress
		infoString = "Welcome to the Gaze Controlled Screen Magnifier!\n\n" +
			// "Here you can try out the tasks we used to test the magnifier with people with low vision.  " +
			// "In our tests, we used a version which was identical but without the blurred background.  " +
			// "In this version, the background is blurred so that people without low vision can try out the tasks with a more accurate experience.\n\n" +
			"Calibration:\n" +
			"The first two images are for setup and instructions-- press N to proceed.\n" +
			"Press Ctrl-N to start the eye tracking-- you will be asked to follow a target across the screen with your eyes to calibrate.\n\n" +
			"Target task instructions:\n" +
			"Try to find the word 'NEXT' on each screen.  Press N to move to the next screen.\n\n" +
			"Reading task instructions:\n" +
			"Read each paragraph, then press N to move to the next screen for a question about the reading.  You can hold Enter to lock the magnifier to only horizontal motion.\n\n" +
			"Controls:\n" +
			"Z/Ctrl-Z: Change zoom level (keep the magnifier zoomed in for a more accurate experience)\n" +
			"Arrow keys: Change magnifier size\n" +
			"Ctrl-N: Start eye tracking\n" +
			"N: Next page\n" +
			"Enter: Hold to lock magnifier to only horizontal motion (for reading)\n" +
			"Esc: See instructions/controls";
		alert(infoString);
		}

		/* Append current gaze coordinate to coordsString */
	function recordCoords() {
		var x, y;
		gazeData = doc.getElementById("GazeData").innerHTML.split(" ");
		x = parseFloat(gazeData[0]).toFixed(2);
		y = parseFloat(gazeData[1]).toFixed(2);
		if (!mouseControl) {
		coordsString += '[' + x + ', ' + y + '],';
		}
	}

	/************************** Key control handling ****************************** */

	/* Handle keypresses to control page and mag attributes */
	function keyControl(e) {
		var left, up;
		var incr = 7;  // Number of pixels to move per manual control keypress-- can be altered
		left = parseInt(glass.style.left.slice(0, -2));
		up = parseInt(glass.style.top.slice(0, -2));
	
		  switch (e.code) {
	
			/*Manual control of magnifier position */
			  case upKey:
				// move glass up
					up -= incr; 
					glass.style.top = up + "px";
				wasdCount++;
				break;
			  case leftKey:
				// move glass left
					left -= incr; 
					glass.style.left = left + "px";
				wasdCount++;
				break;
			  case downKey:
				// move glass down
					up += incr; 
					glass.style.top = up + "px";
				wasdCount++;
				break;
			  case rightKey:
				// move glass right
					left += incr; 
					glass.style.left = left + "px";
				wasdCount++;
				break;
	
			/* Press to increase magnifier zoom, press while holding ctrl to decrease magnifier zoom */
			case zoomKey:
				if (e.ctrlKey) {
					console.log("Zoom out");
					zoom -= 1;
				} else {
						console.log("Zoom in");
					zoom += 1;
				}
					glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
					break;
	
			/* Change size of magnifier glass */
			  case shrinkVertKey:
				// shrink glass vertically
				glassHeight = parseInt(glass.style.height.slice(0, -2));
				glassHeight -= 10;
				glass.style.height = glassHeight + "px";
				break;
			  case expandVertKey:
				// expand glass vertically
				glassHeight = parseInt(glass.style.height.slice(0, -2));
				glassHeight += 10;
				glass.style.height = glassHeight + "px";
				break;
			  case expandHorizKey:
				// expand glass horizontally
				glassWidth = parseInt(glass.style.width.slice(0, -2));
				glassWidth += 10;
				glass.style.width = glassWidth + "px";
				break;
			  case shrinkHorizKey:
				// shrink glass horizontally
				glassWidth = parseInt(glass.style.width.slice(0, -2));
				glassWidth -= 10;
				glass.style.width = glassWidth + "px";
				break;
	
			/* Hold to lock magnifier to only horizontal motion (for reading), release for normal controls */
			case hLockKey:
				  if (!hLock) { 
					  hLock = true; 
					  glass.style.border = "6px solid #03befc";
					  hLockCount++;
					}
				  break;
	
			/* Press to record task time and proceed to the next task, press while holding ctrl to start eye tracking */
			case nextTask_ctrlEyeTrackKey:
				if (e.ctrlKey) {
					// if holding ctrl: toggle mouse control and eye tracking
					if (mouseControl) {
						mouseControl = false;
						startEyeTracking();
					} else {
						mouseControl = true;
						stopEyeTracking();
					}
				} else { 
					pauseTimer();
					resetTimer();
					// change image
					if (nextTaskIndex < tasks.length) {
						if (tasks[nextTaskIndex].includes("instr")) {
							// turn off mag for instruction pages
							glass.style.width = "0px";
							glass.style.height = "0px";
						} else {
							glass.style.width = glassWidth + "px";
							glass.style.height = glassHeight + "px";
						}
						img.src = "imgs/" + tasks[nextTaskIndex] + ".png";
						nextTaskIndex++;
						if (blur) {
							// set mag background image to the non-blurred version
							if (img.src.includes("blur")) {
								glass.style.backgroundImage = "url('" + img.src.slice(0, -9) + ".png" + "')";
							}
						} else {
							glass.style.backgroundImage = "url('" + img.src + "')";
						}
						startTimer();
					} else {
						// display research params
						displayInfo();
					}
				}
				break;
			
			/* Press to call displayInfo/displayInstructions functions */
			case infoKey:
				displayInfo();
				break;
			case instrKey:
				displayInstructions();
				break;
			default:
				console.log(e.code);
		  }
			x = left + w;
			y = up + h;
			glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
	  }
	
	function checkHLockKeyUp(e) {
		// Check for release of hLock key
		if (e.code == hLockKey) {
			hLock = false;
			glass.style.border = "6px solid #F542f5";
		}
	}

	/************************** Timer Functions ****************************** */
	
	function startTimer() {
		if (!running) {
			startTime = new Date().getTime();
			tInterval = setInterval(getShowTime, 1);
			paused = 0;
			running = 1;
		}
	}
	
	function pauseTimer() {
		if (!difference) {}
		else if (!paused) {
			clearInterval(tInterval);
			savedTime = difference;
			if (nextTaskIndex > 0) {
				newTimesString = tasks[nextTaskIndex - 1] + ": " + 
					`${minutes}:${seconds}:${milliseconds}` + ",";
				timesString += newTimesString;
				coordsString += newTimesString;
			}
			paused = 1;
			console.log(`${minutes}:${seconds}:${milliseconds}`);
			running = 0;
		} else {
			startTimer();
		}
	}
	
	function resetTimer() {
		clearInterval(tInterval);
		savedTime = 0;
		difference = 0;
		paused = 0;
		running = 0;
	}
	
	function getShowTime() {
		updatedTime = new Date().getTime();
		if (savedTime) {
			difference = (updatedTime - startTime) + savedTime;
		} else {
			difference = updatedTime - startTime;
		}
		minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
		seconds = Math.floor((difference % (1000 * 60)) / 1000);
		milliseconds = Math.floor((difference % (1000 * 60)) / 100);
	
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		seconds = (seconds < 10) ? "0" + seconds : seconds;
		milliseconds = (milliseconds < 100) ? (milliseconds < 10) ? "00" + milliseconds : "0" + milliseconds : milliseconds;
	}
}