PImage img;

int particles = 200;

boolean[] isAlive = new boolean[particles];
int[] positionX = new int[particles];
int[] positionY = new int[particles];
int[] vectorX = new int[particles];
int[] vectorY = new int[particles];

int diameter = 80;
int radius = round(diameter / 2.0);
int maxSpeed = 10;
int frequency = 10;

void setup() {
  size(800, 600);
  blendMode(ADD);
  img = loadImage("particle.png");
  noCursor();
  imageMode(CENTER);
}

void draw() {
  background(0);

  if (mousePressed) {
    if (mouseButton == LEFT) {
      if (frameCount % frequency == 0) {
        for (int i = 0; i < particles; i++) {
          if (!isAlive[i]) {
            isAlive[i] = true;

            // on initialise la position de départ au centre
            // positionX[i] = round(width / 2);
            // positionY[i] = round(height / 2);

            // on initialise la position de départ là ou est la souris
            positionX[i] = round(mouseX);
            positionY[i] = round(mouseY);

            vectorX[i] = 0;
            vectorY[i] = 0;

            // on initialise son vecteur de déplacement
            while (vectorX[i] == 0 && vectorY[i] == 0) {
              vectorX[i] = round(random(-maxSpeed, maxSpeed));
              vectorY[i] = round(random(-maxSpeed, maxSpeed));
            }

            // on sort de la boucle
            break;
          }
        }
      }
    }
  }

  for (int i = 0; i < particles; i++) {
    if (isAlive[i]) {
      tint(255);
      image(img, positionX[i], positionY[i], diameter, diameter);
      positionX[i] += vectorX[i];
      positionY[i] += vectorY[i];

      if (positionX[i] - radius > width
        || positionX[i] + radius < 0
        || positionY[i] - radius > height
        || positionY[i] + radius < 0
      ) {
        isAlive[i] = false;
      }
    }
  }

  tint(255, 100);
  image(img, mouseX, mouseY, diameter, diameter);
}
