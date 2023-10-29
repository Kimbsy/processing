class Player {
  float xPos, yPos, xVel, yVel;
  
  Player(float x, float y) {
    this.xPos = x;
    this.yPos = y;
    this.xVel = 0.0;
    this.yVel = 0.0;
  }
  
  void update() {
    this.xPos += this.xVel;
    this.yPos += this.yVel;
  }
  
  void display() {
    fill(255, 0, 0);
    rect(this.xPos, this.yPos, 10, 10);
  }
}


Player p1 = new Player(0, 0);

void setup() {
  size(400, 300);
}

void draw() {
  background(0);
  
  p1.update();
  p1.display();
  
  if (keyPressed) {
    switch (key) {
      case 'w':
        p1.yVel -= 0.1;
        break;
      case 'a':
        p1.xVel -= 0.1;
        break;
      case 's':
        p1.yVel += 0.1;
        break;
      case 'd':
        p1.xVel += 0.1;
    }
  }
}

void keyPressed() {
  println(key);
  
  if (key == ' ') {
    
  }
}
