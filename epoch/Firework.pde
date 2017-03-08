class Firework extends Sprite {
  
  public static final int FIREWORK_MAX_AGE = 600;
  
  public Firework(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    
    c = color(255, 0, 0);
    
    xVel = random(-5, 5);
    yVel = random(-13, -10);
  }
   
  public void drawSelf() {
    fill(c);  
    rect(xPos, yPos, 5, 5);
  }
  
  public boolean checkDetonation() {
    return (yVel > -1) || (age > FIREWORK_MAX_AGE);
  }
   
  public void detonate(ArrayList<Sparkle> sparkles) {
    color sparkleColor = sparkleColor();
    for (int i = 0; i < (int) random(10, 30); i++) {
      sparkles.add(new Sparkle(this, sparkleColor, i));
    }
  }
  
  public color sparkleColor() {
    color c;
    int choice = (int) random(7);
    
    switch(choice) {
      case 0:
        c = color(255, 0, 0);
        break;
      case 1:
        c = color(0, 255, 0);
        break;
      case 2:
        c = color(0, 0, 255);
        break;
      case 3:
        c = color(255, 255, 0);
        break;
      case 4:
        c = color(255, 0, 255);
        break;
      case 5:
        c = color(0, 255, 255);
        break;
      default:
        c = color(255, 255, 255);
        break;
    }
    
    return c;
  }  
}