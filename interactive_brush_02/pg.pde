PVector mouseVector = new PVector();
int brushR;
int brushG;
int brushB;
int brushA;

void pgDraw() {
	mouseVector.x = mouseX - pmouseX;
	mouseVector.y = mouseY - pmouseY;

	brushR = round(map(mouseX, 0, width, 0, 255));
	brushG = 0;
	brushB = round(map(mouseY, 0, height, 100, 200));
	brushA = round(map(mouseVector.heading(), 0, TWO_PI, 50, 200));

	pg.beginDraw();
	pg.stroke(0);
	pg.fill(brushR, brushG, brushB, brushA);
	pg.ellipse(mouseX, mouseY, 3 * mouseVector.mag(), 3 * mouseVector.mag());
	pg.endDraw();
}
