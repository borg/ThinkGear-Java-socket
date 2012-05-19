/*
The NeuroSky MindWave device did not ship with any proper Java bindings.
 Jorge C. S. Cardoso has release a processing library for the MindSet device
 but that communicates over the serial port. NeuroSky has since release a connector
 application that talks JSON over a normal socket. 
 
 Using the same API as the previous library this talks directly to the ThinkGear
 connector.
 
 Info on this library
 http://crea.tion.to/processing/thinkgear-java-socket
 
 Info on ThinkGear 
 http://developer.neurosky.com/
 
 Info on Cardoso's API
 http://jorgecardoso.eu/processing/MindSetProcessing/
 
 Have fun and get some peace of mind!
 
 xx
 Andreas Borg
 Jun, 2011
 borg@elevated.to
 */



import neurosky.*;
import org.json.*;
ThinkGearSocket neuroSocket;
int attention=10;
int meditation=10;
PFont font;
void setup() {
  size(600,600);
  ThinkGearSocket neuroSocket = new ThinkGearSocket(this);
  try {
    neuroSocket.start();
  } 
  catch (ConnectException e) {
    //println("Is ThinkGear running??");
  }
  smooth();
  //noFill();
  font = createFont("Verdana",12);
  textFont(font);
}

void draw() {
  //background(0,0,0,50);
  fill(0, 0,0, 255);
  noStroke();
  rect(0,0,120,80);


  fill(0, 0,0, 10);
  noStroke();
  rect(0,0,width,height);
  fill(0, 116, 168);
  stroke(0, 116, 168);
  text("Attention: "+attention, 10, 30);
  noFill();
  ellipse(width/2,height/2,attention*3,attention*3);


  fill(209, 24, 117, 100);
  noFill();
  text("Meditation: "+meditation, 10, 50);
  stroke(209, 24, 117, 100);
  noFill();
  ellipse(width/2,height/2,meditation*3,meditation*3);
}

void poorSignalEvent(int sig) {
  println("SignalEvent "+sig);
}

public void attentionEvent(int attentionLevel) {
  println("Attention Level: " + attentionLevel);
  attention = attentionLevel;
}


void meditationEvent(int meditationLevel) {
  println("Meditation Level: " + meditationLevel);
  meditation = meditationLevel;
}

void blinkEvent(int blinkStrength) {

  println("blinkStrength: " + blinkStrength);
}

public void eegEvent(int delta, int theta, int low_alpha, int high_alpha, int low_beta, int high_beta, int low_gamma, int mid_gamma) {
  println("delta Level: " + delta);
  println("theta Level: " + theta);
  println("low_alpha Level: " + low_alpha);
  println("high_alpha Level: " + high_alpha);
  println("low_beta Level: " + low_beta);
  println("high_beta Level: " + high_beta);
  println("low_gamma Level: " + low_gamma);
  println("mid_gamma Level: " + mid_gamma);
}

void rawEvent(int[] raw) {
  //println("rawEvent Level: " + raw);
}	

void stop() {
  neuroSocket.stop();
  super.stop();
}

