abstract class Sprite {
  
  int xPos, yPos;
  float xVel, yVel;
  int age = 0;
  color c;
  
  public void updateSelf() {
    age++;
    
    // Update velocity.
    this.yVel += 0.1;
    
    // Update position.
    this.xPos += xVel;
    this.yPos += yVel;
  }
  
  public abstract void drawSelf();
}