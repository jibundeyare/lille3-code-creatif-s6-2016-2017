void setup() {
  size(800, 600);
  
  noStroke();
  fill(255, 0, 0);
}

void draw() {
  background(255);
  
  if (keyPressed) {
    if (key == 'z') {
      ellipse(width / 2, height / 2, 20, 20);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      println("touche haut");
    } else if (keyCode == DOWN) {
      println("touche bas");
    } else if (keyCode == LEFT) {
      println("touche gauche");
    } else if (keyCode == RIGHT) {
      println("touche droite");
    }

    if (keyCode == ENTER) {
      println("touche entrée");
    }
  } else {
    if (key == 'a' || key == 'A') {
      println("touche a ou A");
    }

     if (key == ' ') {
      println("touche espace");
    }
  }
}

void keyReleased() {
  println("touche lachée");
}

void keyTyped() {
  println("touche appuyée");
}