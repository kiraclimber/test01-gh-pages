Lines[] myLines = new Lines [80];

int reset;

void setup() {
  background(0);
  size(400,400);
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width),random(height),random(1,5), random(1,20));
  }
  frameRate(30);
  reset = 0;
}

void draw() {
  noCursor();
  
 for (int i=0; i<myLines.length; i++) {
   Lines iLines = myLines[i];
   iLines.display();
 }
 
 reset += 1;
 if (reset>= 250) {
   fill(random(255),random(255),random(255));
   rect(0,0,width,height);
   reset = 0;
 }
}


class Lines {
  //class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  
  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  
  //display
  void display() {
    strokeW = random(1,10);
    lineLength = random(1,25);
    if(xpos > width || xpos < 0 || ypos > height || ypos <0) {
       xpos = random(mouseX-10,mouseX+10);
       ypos = random(mouseY-10,mouseY+10);
  } else{
    if (random(100)>90) {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveRight(xpos,ypos,lineLength);
    } else if (random(100)>80) {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveLeft(xpos,ypos,lineLength);
    } else if (random(100)>70) {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveUp(xpos,ypos,lineLength);
    } else if (random(100)>60){
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveDown(xpos,ypos,lineLength);
    } else if (random(100)>50) {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveUpRight(xpos,ypos,lineLength);
    } else if(random(100)>40) {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveDownRight(xpos,ypos,lineLength);
    } else if(random(100)>30) {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveUpLeft(xpos,ypos,lineLength);
    } else {
      stroke(random(255),random(255),random(255));
      strokeWeight(strokeW);
      moveDownLeft(xpos,ypos,lineLength);
    }
  }
  
  }
  
  void moveRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i,startY);
    xpos = startX+i;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i,startY);
    xpos = startX-i;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX,startY-i);
    ypos = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX,startY+i);
    ypos = startY+i;
  }
}

void moveUpRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i,startY-i);
    ypos = startY-i;
    xpos = startX+i;
  }
}

void moveDownRight(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX+i,startY+i);
    ypos = startY+i;
    xpos = startX+i;
  }
}

void moveUpLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i,startY-i);
    ypos = startY-i;
    xpos = startX-i;
  }
}

void moveDownLeft(float startX, float startY, float moveCount) {
  for(float i=0; i<moveCount; i++) {
    point(startX-i,startY+i);
    ypos = startY+i;
    xpos = startX-i;
  }
}
}

