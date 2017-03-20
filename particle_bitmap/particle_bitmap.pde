PGraphics pg;

color c1 = color(255);
color c2 = color(255, 255, 0, 10);
color c3 = color(255, 127, 0, 1);
color c4 = color(255, 0, 0, 1);
float dia;

void setup() {
  size(256, 256);

  pg = createGraphics(width, height);

  pg.beginDraw();
  pg.noStroke();

  for (int dia = width; dia >= 30; dia -= 1) {
    if (dia > 150) {
      pg.fill(c4);
    } else if (dia > 100) {
      pg.fill(c3);
    } else if (dia > 50) {
      pg.fill(c2);
    } else {
      pg.fill(c1);
    }

    pg.ellipse(width / 2, height / 2, dia, dia);
  }

  pg.endDraw();
  
  pg.save("particle.png");
}

void draw() {
  background(0);
  image(pg, 0, 0);
}
