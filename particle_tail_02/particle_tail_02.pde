PImage img;

int historyMinimum = 15;
int historyStep = 10;
int history = 100;
int historyIndex = 0;
int[] historyX = new int[history];
int[] historyY = new int[history];
int mouseAlpha = 255;
int diameter = 50;

void setup() {
  size(800, 600);
  blendMode(ADD);
  img = loadImage("particle.png");
  imageMode(CENTER);
}

void draw() {
  background(0);
  for (int i = 0; i < history; i++) {
    if (historyX[i] != 0 && historyY[i] != 0) {
      int offsetHistory = 255;

      if (i >= historyIndex) {
        offsetHistory = i - historyIndex;
      } else {
        offsetHistory = history + (i - historyIndex);
      }

      // on map la transparence sur la position dans le tableau
      mouseAlpha = round(map(offsetHistory, 0, history - 1, 0, 255));

      // appliquer de la transparence sur l'image
      tint(255, mouseAlpha);
      image(img, random(-10, 10) + historyX[i], random(-10, 10) + historyY[i], random(-10, 10) + diameter, random(-10, 10) + diameter);
    }
  }
}

void mousePressed() {
  storePosition();
}

void mouseDragged() {
  storePosition();
}

void storePosition() {
  historyX[historyIndex] = mouseX;
  historyY[historyIndex] = mouseY;
  historyIndex++;

  if (historyIndex >= history) {
    historyIndex = 0;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();

  if (e < 0) {
    historyX = expand(historyX, historyX.length + historyStep);
    historyY = expand(historyY, historyY.length + historyStep);
    history += historyStep;
  } else if (e > 0) {
    if (historyX.length > historyMinimum) {
      for (int i = 0; i < historyStep; i++) {
        historyX = shorten(historyX);
        historyY = shorten(historyY);
      }

      if (historyIndex >= historyX.length) {
        historyIndex = historyX.length - 1;
      }

      history -= historyStep;
    }
  }
}
