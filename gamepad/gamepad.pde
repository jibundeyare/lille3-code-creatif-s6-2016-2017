import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
ControlDevice stick;

float joystickX;
float joystickY;
float scaleJoystickX = 10;
float scaleJoystickY = 10;
float x1;
float y1;
float x2;
float y2;
int color1 = color(255, 0, 0); // rouge
int color2 = color(0, 0, 255); // bleu
boolean showRect = false;
int minTime = 500;
int oldTime = -minTime;
int time = 0;

void setup() {
	size(1000, 800);
	control = ControlIO.getInstance(this);
	stick = control.getMatchedDevice("generic-gamepad.txt");
	//stick = control.getMatchedDevice("ms-sidewinder.txt");
	if (stick == null) {
	println("No suitable device configured");
		System.exit(-1); // End the program NOW!
	}

	x1 = width / 2; // centre horizontal
	y1 = height / 2; // centre  vertical
	x2 = width / 2; // centre horizontal
	y2 = height / 2; // centre  vertical
}

void draw() {
	background(255);

	if (stick.getButton("button1").pressed()) {
		fill(color1);
		rect(x1, y1, 100, 100);
	}

	if (stick.getButton("button2").pressed()) {
		time = millis();

		// anti-bounce
		if (time - oldTime >= minTime) {
			oldTime = time;
			showRect = !showRect;
		}
	}

	joystickX = stick.getSlider("joystickX").getValue();
	joystickY = stick.getSlider("joystickY").getValue();

	// ^ = opérateur xor
	// empêche les mouvements en diagonal
	if (joystickX == 0 ^ joystickY == 0 ) {
		x2 = x2 + joystickX * scaleJoystickX;
		y2 = y2 + joystickY * scaleJoystickY;
	}

	// contraint x ou y à rester dans l'espace de l'écran
	x2 = constrain(x2, 0, width);
	y2 = constrain(y2, 0, height);

	if (showRect) {
		fill(color2);
		rect(x2, y2, 100, 100);
	}
}
