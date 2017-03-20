import controlP5.*;

ControlP5 cp5;
Button screenshot;
boolean drawCp5 = false;

PGraphics pg;
int bgColor = color(255);

void setup() {
	size(1024, 768);

	pg = createGraphics(width, height);

	cp5 = new ControlP5(this);
	cp5.setAutoDraw(false);

	cp5.addButton("buttonSave")
		.setValue(0)
		.setPosition(50, 50)
		.setSize(50, 50)
		.setLabel("save")
	;

	cp5.addButton("buttonSavePg")
		.setValue(0)
		.setPosition(50, 150)
		.setSize(50, 50)
		.setLabel("save pg")
	;

	cp5.addButton("buttonClear")
		.setValue(0)
		.setPosition(width - 100, 50)
		.setSize(50, 50)
		.setLabel("clear")
	;
}

void draw() {
	background(bgColor);

	if (!drawCp5 && mousePressed) {
		if (mouseButton == LEFT) {
			pgDraw();
		}
	}

	image(pg, 0, 0);

	if (drawCp5) {
		cp5.draw();
	}
}

void mouseClicked() {
 	if (mouseButton == RIGHT) {
		drawCp5 = !drawCp5;
	}
}

void controlEvent(ControlEvent theEvent) {
	if (theEvent.getController().getName() == "button1") {
		println("button1 " + theEvent.getController().getValue());
	}

	if (theEvent.getController().getName() == "button2") {
		println("button2 " + theEvent.getController().getValue());
	}
}

void buttonSave(int theValue) {
	if (frameCount > 0) {
		background(bgColor);
		image(pg, 0, 0);
		save("screenshot-" + getTimestamp() + ".png");
	}
}

void buttonSavePg(int theVale) {
	if (frameCount > 0) {
		pg.save("screenshot-" + getTimestamp() + ".png");
	}
}

void buttonClear(int theValue) {
	pg = createGraphics(width, height);
	pg.beginDraw();
	pg.endDraw();
}
