// Processing code for this example

// Graphing sketch


// This program takes ASCII-encoded strings
// from the serial port at 9600 baud and graphs them. It expects values in the
// range 0 to 1023, followed by a newline, or newline and carriage return

// Created 20 Apr 2005
// Updated 18 Jan 2008
// by Tom Igoe
// This example code is in the public domain.

import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph

void setup () {
  // set the window size:
  size(800, 600);        

  // List all the available serial ports
  println(Serial.list());
  
  myPort = new Serial(this, "/dev/ttyUSB0", 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  // set inital background:
  background(0);
}
void draw () {
  // everything happens in the serialEvent()
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {

    inString = trim(inString);
    
    String[] inputs = split(inString, ',');
    // print(inputs[0]);
    // print("\n");

    for (int i = 0; i < 6; i++)
    {
      float inByte = float(inputs[i]);
      inByte = map(inByte, 0, 1023, 0, height / 6);

      // draw the lines
      int r = 0, g = 0, b = 0;
      
      switch (i) {
        case 0:
          r = 255;
          g = 255;
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
      
      stroke(r, g, b);
      int bottom = (height / 6) * (i + 1);
      println(bottom);
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

