class Sparkle extends Sprite {
  
  public static final int SPARKLE_MAX_AGE = 30;
  
  public Sparkle(Sprite parent, color c, int i) {
    this.xPos = parent.xPos;
    this.yPos = parent.yPos;
    this.c = c;
    
    this.xVel = getXVel(i);
    this.yVel = getYVel(i);
  }
  
  public float getXVel(int i) {
    return (random(-5, 5));
  }
  
  public float getYVel(int i) {
    return (random(-5, 5)) - 3;
  }
  
  public void drawSelf() {
    fill(c);
    rect(xPos, yPos, 5, 5);
  }
  
  public boolean checkDetonation() {
    return (age > SPARKLE_MAX_AGE);
  }
  
  public void detonate(ArrayList<Sparkle> sparkles) {
    // no-op
  }
}