int x1 = 40;
int y1 = 40;

int x2 = 50;
int y2 = 50;

int x3 = 90;
int y3 = 90;

int x4 = 62;
int y4 = 39;

// This happens once.
void setup() {
  size(400,200);
}

// This happens over and over forever.
void draw() {
  background(100, 100, 100);
  
  fill(255, 0, 0); // Get ready to fill a shape with red.
  rect(x1, y1, 10, 10);
  
  fill(0, 255, 0);
  rect(x2, y2, 20, 20);
  
  fill(0 ,0 ,255);
  rect(x3, y3,5,20);
  
  fill(255, 0, 255);
  ellipse(x4, y4, 20, 20);
  
  x4 = x4 -2;
  y4 = y4 -1;
  x3 = x3 + 2;
  y3 = y3 + 2;
  y2 = y2 + 5;
  x1 = x1 + 5;
  
  if (y4 < 0) {
    y4 = height;
  }
  if (x4 < 0) {
    x4 = width;
  }
  if (y2 > height) {
    y2 = 0;  
  }
  if(y3 > height){
  y3 = 0;
  }
  if(x3 > width){
    x3 = 0;
  }
  // If x is too big, set it back to 0.
  if (x1 > width) {
    x1 = 0;
  }
}
