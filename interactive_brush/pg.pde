void pgDraw() {
	PVector mouseVector = new PVector();
	int brushR;
	int brushG;
	int brushB;
	int brushA;

	mouseVector.x = mouseX - pmouseX;
	mouseVector.y = mouseY - pmouseY;

	pg.beginDraw();

	// rect
	brushR = 0;
	brushG = 0;
	brushB = 0;
	brushA = round(map(mouseVector.mag(), 0, diagonal, 10, 255));
	pg.stroke(0);
	pg.fill(brushR, brushG, brushB, brushA);
	pg.rectMode(CENTER);

	pg.pushMatrix();
	pg.translate(mouseX, mouseY);
	pg.rotate(mouseVector.heading());
	pg.rect(0, 0, 2 * mouseVector.mag(), 2 * mouseVector.mag());
	pg.popMatrix();

	// line
	brushR = 0;
	brushG = 0;
	brushB = 0;
	brushA = round(map(mouseVector.mag(), 0, diagonal, 100, 255));
	pg.stroke(brushR, brushG, brushB, brushA);

	pg.pushMatrix();
	pg.translate(mouseX, mouseY);
	pg.rotate(mouseVector.heading());
	pg.rotate(HALF_PI);
	pg.line(0, 0, 4 * mouseVector.mag(), 0);
	pg.popMatrix();

	pg.pushMatrix();
	pg.translate(mouseX, mouseY);
	pg.line(0, 0, mouseVector.x * 10, mouseVector.y * 10);
	pg.ellipse(mouseVector.x * 10, mouseVector.y * 10, 10, 10);
	pg.popMatrix();

	pg.endDraw();
}
