Car[] myCars = new Car[20];

void setup() {
  size(400,400);
  background(0);
  frameRate(60);
 
  //instantiate the array of cars
  for (int i=0; i< myCars.length; i++) {
     myCars[i] = new Car(random(width), random(height), random(40), color(random(255),random(255),random(255)),random(-10,10));
  }
}

void draw() {
  background(0);
  for (int i=1000; i>0; i-=10) {
    noStroke();
    fill(255-i/4);
    ellipse(0,0,i,i);
  }
  for (int i=0; i<width; i+=100) {
    fill(255,255,0);
    rect(i,height/2-10,50,20);
  }
  for (int i=0; i< myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
  }
}
class Car {
  //member variables
  int cLength, cHeight, cWeight;
  float xpos, ypos, cSpeed, left;
  color cColor;
  
  //constructor 1
  Car (float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = 5;
    cColor = color(255,0,0);
    left = 0;
  }
  
  //constructor 2
  Car (float tempX, float tempY, float tempSpeed, color tempColor, float tempLeft) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = tempLeft;
  }
  
  //member methods
  void display() {
    rectMode(CENTER);
    fill(cColor);
    rect(xpos, ypos, 40, 20);
    //window
    noStroke();
    fill(255);
    rect(xpos-7, ypos-5, 6,8);
    rect(xpos+7,ypos-5,6,8);
    stroke(25,50,0);
    //tires
    fill(0);
    ellipse(xpos-10,ypos+10,16,16);
    ellipse(xpos+10,ypos+10,16,16);
    fill(cColor);
    
  }
  
  void drive() {
    if (left <= 0) {
      strokeWeight(5);
      line(xpos+18,ypos-10,xpos+10,ypos-20);
      strokeWeight(1);
      triangle(xpos+20,ypos-10,xpos+20,ypos+10,xpos+30,ypos+10);
      xpos = xpos + cSpeed;
      if (xpos > width) {
        xpos = 0;
        ypos = ypos + 15;
      }
      if (ypos > height) {
        ypos = 0;
      }
    } else {
      strokeWeight(5);
      line(xpos-18,ypos-10,xpos-10,ypos-20);
      strokeWeight(1);
      triangle(xpos-20,ypos-10,xpos-20,ypos+10,xpos-30,ypos+10);
      xpos = xpos - cSpeed;
      if(xpos < 0) {
        xpos = width;
        ypos = ypos - 15;
      }
      if(ypos <0) {
        ypos = height;
      }
    }
    
  }
  
  
}

