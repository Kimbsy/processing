/**
 * Graphing sketch.
 * Reads info from 6 inputs and graphs them in 6 different colors 
 * (colors represent current wire colors) in one window.
 * 
 * This program takes ASCII-encoded strings
 * from the serial port at 9600 baud and graphs them. It expects values in the
 * range 0 to 1023, followed by a newline, or newline and carriage return
 * 
 * Based on sketch by Tom Igoe.
 **/
 
import processing.serial.*;
import javax.swing.*;

// Serial port object
Serial port;

// x position of graph
int xPos = 1;

// pause state
boolean paused = false;

// variables for displaying
float[][] metaValues = {
  {9999999, 9999999, 9999999, 9999999, 9999999, 9999999}, // minimum
  {0, 0, 0, 0, 0, 0}, // maximum
  {0, 0, 0, 0, 0, 0}  // current
};

// font for displaying text
PFont font = createFont("Courier New", 12, true);

// declare second applet window
SecondApplet s;

void setup() {
  // set the graphing window size:
  size(800, 600);
  
  // create new window for metadata
  PFrame f = new PFrame(200, 400);
  
  // distinguish frames
  frame.setTitle("Graphical analysis");
  f.setTitle("MetaData");

  // List all the available serial ports
  // println(Serial.list());
  
  port = new Serial(this, "/dev/ttyUSB1", 9600);
  // don't generate a serialEvent() unless you get a newline character:
  port.bufferUntil('\n');
  // set inital background:
  background(0);
}

void draw() {
  // all the graphing happens in the serialEvent()
}

public class PFrame extends JFrame {
  // just a constructor
  public PFrame(int w, int h) {
    setBounds(100, 100, w, h);
    s = new SecondApplet();
    add(s);
    s.init();
    show();
  }  
}

public class SecondApplet extends PApplet {
  public void setup() {
    background(0);
    noStroke();
  }
  
  public void draw() {
    background(0);
    textFont(font, 12);
    
    int[] c;
    
    for (int i = 0; i < 6; i++) {
      // get color of current channel
      c = getColor(i);
      fill(c[0], c[1], c[2]);

      // display minimum, current and maximum values
      text(metaValues[0][i], 10, (20 + (45 * i)));
      text(" >>  " + metaValues[2][i], 10, (35 + (45 * i)));
      text(metaValues[1][i], 10, (50 + (45 * i)));
    }
  }
}

void serialEvent(Serial myPort) {
  
  // if paused, just return
  if (paused) {
    return;
  }
  
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {

    // clean string and split into channels
    inString = trim(inString);
    String[] inputs = split(inString, ',');

    for (int i = 0; i < 6; i++) {
      float inByte = float(inputs[i]);
      
      // save value to metadata
      saveMeta(inByte, i);

      // map value to display size
      inByte = map(inByte, metaValues[0][i], metaValues[1][i], 0, height / 6);
      
      // get color for this channel      
      int[] c = getColor(i);
      
      //draw the lines
      stroke(c[0], c[1], c[2]);
      int bottom = (height / 6) * (i + 1);
      line(xPos, bottom, xPos, bottom - inByte);
    }

    // at the edge of the screen, go back to the beginning:
    if (xPos >= width) {
      xPos = 0;
      background(0); 
    } 
    else {
      // increment the horizontal position:
      xPos++;
    }
  }
}

void keyPressed() {
  // if space is pressed, toggle pause state
  if (keyCode == 32) {
    paused = !paused;
  }
 
  // if number 1-6 is pressed, reset corresponding min/max values
  if (keyCode >= 49 && keyCode <= 54) {
    metaValues[0][keyCode - 49] = 9999999;
    metaValues[1][keyCode - 49] = 0;
  }
  
  // if backspace in pressed, reset all min/max values
  if (keyCode == 8) {
    for (int i = 0; i < 6; i++) {
      metaValues[0][i] = 9999999;
      metaValues[1][i] = 0;
    }
  }
}

void saveMeta(float inByte, int i) {
  // check minimum
  if (inByte < metaValues[0][i]) {
    metaValues[0][i] = inByte;
  }
  
  // check maximum
  if (inByte > metaValues[1][i]) {
    metaValues[1][i] = inByte;
  }
  
  // set current
  metaValues[2][i] = inByte;
}

int[] getColor(int i) {
  // create return array
  int[] c = new int[3];
  
  // initialise rgb values
  int r = 0, g = 0, b = 0;
  
  // select colors
  switch (i) {
    case 0:
      r = 255;
      g = 165;
      break;
    case 1:
      r = 255;
      break;
    case 2:
      b = 255;
      break;
    case 3:
      r = 255;
      b = 255;
      break;
    case 4:
      r = 125;
      g = 125;
      b = 125;
      break;
    case 5:
      r = 255;
      g = 255;
      b = 255;
      break;
  }
  
  //set values
  c[0] = r;
  c[1] = g;
  c[2] = b;
  
  return c;
}

