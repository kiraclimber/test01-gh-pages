void setup() {
  size(900,300);
}

void draw() {
  background(0);
  
  //title and developer
  textSize(30);
  fill(0,0,255);
  text("Circle Measurements",200,250);
  textSize(15);
  fill(200);
  text("Kira Parker",200,280);
  
  //instructions
  fill(0,150,0);
  text("move mouse left and right to change radius",20,20);
  fill(200);
  
  //conversions
  drawReference(50,50);
  fill(255,0,255);
  text("Radius =" + float(mouseX/8-6), 50,100);
  fill(0,255,255);
  text("Circumference =" + circleCircumference(mouseX/8-6),50,130);
  fill(190,190,0);
  text("Area =" + circleArea(mouseX/8-6),50,160);
  
  //circle
  ellipseMode(CENTER);
  fill(190,190,0);
  stroke(0,255,255);
  strokeWeight(4);
  ellipse(600,170,2*(mouseX/8-6),2*(mouseX/8-6));
  strokeWeight(1);
  
  //radius of circle
  stroke(255,0,255);
  line(600,170,(mouseX/8-6)/sqrt(2)+600,(mouseX/8-6)/sqrt(2)+170);
  fill(255,0,255);
  text("r",((mouseX/8-6)/sqrt(2))/2+600,((mouseX/8-6)/sqrt(2))/2+170);
  fill(200);
  
  //no negative values
  rectMode(CENTER);
  if(mouseX/8-6<0) {
    noStroke();
    fill(0);
    rect(600,170,50,50);
  }
  if(mouseX/6-8<0){
    noStroke();
    fill(0);
    rect(150,100,70,30);
    rect(220,130,94,30);
    rect(150,160,98,30);
  }
  
  if (mousePressed && mouseButton==LEFT) {
    noLoop();
  } else if(mousePressed && mouseButton==RIGHT) {
    loop();
  }
}

// area conversion
float circleArea (float radius) {
  float area = PI*radius*radius;
  return area;
}

//circumference conversion
float circleCircumference (float radius) {
  float circ = PI*radius*2;
  return circ;
}

//number line
void drawReference(int xpos, int ypos) {
  stroke(200);
  line(xpos,ypos,850,ypos);
  for(int i = 0; i<101; i=i+10) {
    text(i, xpos+i*8-8, ypos);
    line(xpos+i*8, ypos, xpos+i*8, ypos+5);
  }
}

