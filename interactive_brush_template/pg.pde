PVector mouseVector = new PVector();
float angle;

void pgDraw() {
	mouseVector.x = mouseX - pmouseX;
	mouseVector.y = mouseY - pmouseY;
  angle = mouseVector.heading();

  println(mouseVector);
  println(angle);

	pg.beginDraw();

  // exemple
  pg.line(pmouseX, pmouseY, mouseX, mouseY); 

	pg.endDraw();
}