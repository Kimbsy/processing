import java.time.Instant;

PFont fNum;
PFont fText;
int seconds = 0;

public void setup() {
  fullScreen();
  
  fNum = createFont("Courier", 250);
  fText = createFont("Courier", 32);
  
  background(0);
}

public void draw() {
  if (seconds < 1500000000) {
    updateTime();
  }
  
  drawText();
}

public void updateTime() {
  seconds = (int) Instant.now().getEpochSecond();
}

public void drawText() {
  background(0);
  
  if (seconds == 1500000000) {
    fill(#00FF00);
  }
  
  textFont(fNum);
  textAlign(CENTER, CENTER);
  text(seconds, width / 2, height / 4);
  
  fill(#FFFFFF);
  textFont(fText);
  textAlign(CENTER, CENTER);
  text("Seconds since 1970-01-01 00:00", width / 2, height / 2);
}