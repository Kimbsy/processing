
class Ball {
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  
  int age = 0;
  
  Ball(float clickX, float clickY) {
    this.xPos = clickX;
    this.yPos = clickY;
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(xPos, yPos, 10, 10); 
  }
  
  void update() {
    age = age + 1;
  }
}





ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(400, 300);
  
  Ball b = new Ball(40, 40);
  balls.add(b);
}

void draw() {
  background(100, 100, 100);
  
  for (Ball b : balls) {
    b.display();
    b.update();
    
    if (b.age > 100) {
      balls.remove(b);
    }
  }
}
