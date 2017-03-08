import java.time.Instant;

PFont fNum;
PFont fText;
int seconds = 0;

ArrayList<Firework> fireworks = new ArrayList();
ArrayList<Sparkle> sparkles = new ArrayList();

int TIME = 1500000000;

public void setup() {
  fullScreen();
  
  fNum = createFont("Courier", 250);
  fText = createFont("Courier", 32);
  
  testing();
  
  background(0);
}

public void testing() {
  TIME = (int) Instant.now().getEpochSecond() + 5;
}

public void draw() {
  background(0);
  
  boolean isFinished = (seconds >= TIME);
  
  if (!isFinished) {
    updateTime();
  }
  
  drawText();
  
  if (isFinished) {
    if (random(20) < 1) {
      launchFirework();
    }
    
    drawFireworks();
    drawSparkles();
  }
}

public void updateTime() {
  seconds = (int) Instant.now().getEpochSecond();
}

public void drawText() {  
  if (seconds == TIME) {
    fill(#00FF00);
  }
  else {
    fill(#FFFFFF);
  }
  
  textFont(fNum);
  textAlign(CENTER, CENTER);
  text(seconds, width / 2, height / 4);
  
  fill(#FFFFFF);
  textFont(fText);
  textAlign(CENTER, CENTER);
  text("Seconds since 1970-01-01 00:00", width / 2, height / 2);
}

public void launchFirework() {
  fireworks.add(new Firework(width / 2, height));
}

public void drawFireworks() {
  for (int i = 0; i < fireworks.size(); i++) {
    Firework f = fireworks.get(i);
    f.updateSelf();
    f.drawSelf();
    
    if (f.checkDetonation()) {
      f.detonate(sparkles);
      fireworks.remove(f);  
    }
  }
}

public void drawSparkles() {
  for (int i = 0; i < sparkles.size(); i++) {
    Sparkle s = sparkles.get(i);
    s.updateSelf();
    s.drawSelf();
    
    if (s.checkDetonation()) {
      s.detonate(sparkles);
      sparkles.remove(s);
    }
  }
}