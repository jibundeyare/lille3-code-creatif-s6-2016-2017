void setup() {
	size(800, 600);
}

void draw() {
	background(0);

	if (mousePressed) {
		if (mouseButton == LEFT) {
			println("draw mousePressed LEFT " + frameCount);
		} else if (mouseButton == RIGHT) {
			println("draw mousePressed RIGHT " + frameCount);
		}
	}
}

void mousePressed() {
	if (mouseButton == LEFT) {
		println("mousePressed LEFT " + frameCount);
	} else if (mouseButton == RIGHT) {
		println("mousePressed RIGHT " + frameCount);
	}
}

void mouseDragged() {
	if (mouseButton == LEFT) {
		println("mouseDragged LEFT " + frameCount);
	} else if (mouseButton == RIGHT) {
		println("mouseDragged RIGHT " + frameCount);
	}
}

void mouseReleased() {
	if (mouseButton == LEFT) {
		println("mouseReleased LEFT " + frameCount);
	} else if (mouseButton == RIGHT) {
		println("mouseReleased RIGHT " + frameCount);
	}
}

void mouseClicked() {
	if (mouseButton == LEFT) {
		println("mouseClicked LEFT " + frameCount);
	} else if (mouseButton == RIGHT) {
		println("mouseClicked RIGHT " + frameCount);
	}
}

void mouseWheel(MouseEvent event) {
	float e = event.getCount();
	println("mouseWheel " + e);
}