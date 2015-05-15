//Basic Calculator by Kira Parker 2014

//Instantiate each of the classifications of buttons
Button[] numButtons = new Button[11];
Button[] opButtons = new Button[5];
Button[] spButtons = new Button[8];

//Global Variables
String displayValue = "0";
String valueToCompute1 = "";   //string value left of operator
String valueToCompute2 = "";  //string value right of operator
float valueToComputeI1 = 0;    //float value left of operator
float valueToComputeI2 = 0;   //float value right of operator
float result = 0;
char opValue;
int spValue = 0;
boolean firstNum = false;
int value;

void setup() {
  size(360, 360);
  background(0);
  noFill();
  strokeWeight(3);
  stroke(200);
  rect(5,5,350,320);
 
  //Populate number buttons
  numButtons[0] = new Button(50,295,color(0,0,70)).asNumber(0,40,30);
  numButtons[1] = new Button(50,245,color(0,0,90)).asNumber(1,40,30);
  numButtons[2] = new Button(110,245,color(0,0,110)).asNumber(2,40,30);
  numButtons[3] = new Button(170,245,color(0,0,130)).asNumber(3,40,30);
  numButtons[4] = new Button(50,195,color(0,0,150)).asNumber(4,40,30);
  numButtons[5] = new Button(110,195,color(0,0,170)).asNumber(5,40,30);
  numButtons[6] = new Button(170,195,color(0,0,190)).asNumber(6,40,30);
  numButtons[7] = new Button(50,145,color(0,0,210)).asNumber(7,40,30);
  numButtons[8] = new Button(110,145,color(0,0,230)).asNumber(8,40,30);
  numButtons[9] = new Button(170,145,color(0,0,250)).asNumber(9,40,30);
  numButtons[10] = new Button(230,95,color(190,0,0)).asNumber(PI,40,30);
 
  //Set the initial value of first num to true
  firstNum = true;
 
  //populate operators
  opButtons[0] = new Button(230,295,color(0,150,0)).asOperator("+",40,40);
  opButtons[1] = new Button(230,245,color(0,170,0)).asOperator("-",40,40);
  opButtons[3] = new Button(230,195,color(0,190,0)).asOperator("*",40,40);
  opButtons[4] = new Button(230,145,color(0,210,0)).asOperator("/",40,40);
  opButtons[2] = new Button(300,267,color(0,255,0)).asOperator("=",60,60);

  //populate special buttons
  spButtons[0] = new Button(50,95,color(#F7E6E8)).asSpecial("clr",40,40);
  spButtons[1] = new Button(170,295,color(#63A5F5)).asSpecial("+-",40,40);
  spButtons[2] = new Button(110,95,color(150,0,0)).asSpecial("sqrt",40,40);
  spButtons[3] = new Button(170,95,color(170,0,0)).asSpecial("sq",40,40);
  spButtons[4] = new Button(110,295,color(#63A5F5)).asSpecial(".",40,40);
  spButtons[5] = new Button(300,95,color(210,0,0)).asSpecial("sin",40,40);
  spButtons[6] = new Button(300,145,color(230,0,0)).asSpecial("cos",40,40);
  spButtons[7] = new Button(300,195,color(250,0,0)).asSpecial("rad",40,40);
}


void draw() {
  background(0);
  println(keyCode);
  //draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
    inumButton.hover();
  }
 
  //draw operator buttons
  for (int i=0; i<opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.display();
    iopButton.hover();
  }
  
  //draw special buttons
  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.display();
    ispButton.hover();
  }
  
 updateDisplay();
 textSize(15);
 fill(255);
 text("opvalue" + opValue,50,340);
 text("int 1   " + valueToCompute1,150,340);
 text("int 2   " + valueToCompute2,250,340);
}

void performCalculation() {
  //set string values to integers
  valueToComputeI1 = float(valueToCompute1);
  valueToComputeI2 = float(valueToCompute2);
 
  //perform calculation based on the appropriate operator
  if (spValue == 0) {
    if (opValue == '+') {
      result = valueToComputeI1 + valueToComputeI2;
      displayValue = str(result);
    } else if(opValue == '-') {
      result = valueToComputeI1 - valueToComputeI2;
      displayValue = str(result);
    } else if(opValue == '*') {
      result = valueToComputeI1*valueToComputeI2;
      displayValue = str(result);
    } else if(opValue == '/') {
      result = valueToComputeI1/valueToComputeI2;
      displayValue = str(result);
    }
    //perform calculation based on appropriate special button
  } else if(spValue == 1) {
    result = sqrt(valueToComputeI1);
    displayValue = str(result);
  } else if(spValue == 2) {
    result = sq(valueToComputeI1);
    displayValue = str(result);
  } else if(spValue == 3) {
    if(result == 0) {
      if (firstNum) {
        result = valueToComputeI1 * -1;
        displayValue = str(result);
      } else {
        if (opValue == '+') {
      result = valueToComputeI1 + valueToComputeI2 * -1;
      displayValue = str(result);
    } else if(opValue == '-') {
      result = valueToComputeI1 - valueToComputeI2 * -1;
      displayValue = str(result);
    } else if(opValue == '*') {
      result = valueToComputeI1*valueToComputeI2 * -1;
      displayValue = str(result);
    } else if(opValue == '/') {
      result = valueToComputeI1/valueToComputeI2 * -1;
      displayValue = str(result);
    }
        displayValue = str(result);  
      }
    } else {
      result = result * -1;
      displayValue = str(result);
    }
  } else if(spValue == 4) {
    result = sin(valueToComputeI1);
    displayValue = str(result);
  } else if(spValue == 5) {
    result = cos(valueToComputeI1);
    displayValue = str(result);
  } else if(spValue == 6) {
    result = radians(valueToComputeI1);
    displayValue = str(result);
  }
 
  //let = work multiple times
  if (firstNum) {
    valueToCompute2 = displayValue;
  } else {
    valueToCompute2 = displayValue;
    valueToCompute2 = "";
  }
}

void updateDisplay() {
  //display window and text
  fill(215,215,215);
  rect(30,20,300,40,7);
  fill(0);
  textSize(25);
  text(displayValue,50,50);
}

void mousePressed() {
  //click and display for numbers
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.on) {
      if(inumButton.numButtonValue == PI) {
        if (firstNum) {
          valueToCompute1 += PI;
          displayValue = valueToCompute1;
        } else {
          valueToCompute2 += PI;
          displayValue = valueToCompute2;
      }
      }
      if (firstNum) {
        valueToCompute1 += int(inumButton.numButtonValue);
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
 
  //click and display for operators
  for(int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.click();
    if(iOpButton.on) {
      if(iOpButton.opButtonValue == "+") {
        if(result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          valueToCompute1 = str(result);
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      }else if (iOpButton.opButtonValue == "=") {
          //Perform Calculation
          spValue = 0;
          firstNum = true;
          performCalculation();
        } else if (iOpButton.opButtonValue == "-") {
          if (result != 0) {
            opValue = '-';
            valueToCompute2 = "";
            valueToCompute1 = str(result);
            firstNum = false;
            displayValue = "-";
          } else {
            opValue = '-';
            firstNum = false;
            displayValue = "-";
          }
        } else if (iOpButton.opButtonValue == "*") {
          if (result != 0) {
            opValue = '*';
            valueToCompute2 = "";
            valueToCompute1 = str(result);
            firstNum = false;
            displayValue = "*";
          } else {
            opValue = '*';
            firstNum = false;
            displayValue = "*";
          }
        } else if (iOpButton.opButtonValue == "/") {
          if (result != 0) {
            opValue = '/';
            valueToCompute2 = "";
            valueToCompute1 = str(result);
            firstNum = false;
            displayValue = "/";
          } else {
            opValue = '/';
            firstNum = false;
            displayValue = "/";
          }
        }
    }
  }
  
  //click and display for special buttons
  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.click();
    if(ispButton.on) {
      if(ispButton.spButtonValue == "clr") {
        valueToCompute1 = "";
        valueToCompute2 = "";
        firstNum = true;
        displayValue = "0";
        result = 0;
      } else if (ispButton.spButtonValue == "sqrt") {
        if(result == 0) {
          spValue = 1;
          firstNum = true;
          performCalculation();
        } else {
          spValue = 1;
          firstNum = true;
          valueToCompute1 = str(result);
          performCalculation();
        }
      } else if (ispButton.spButtonValue == "sq") {
        if(result == 0) {
          spValue = 2;
          firstNum = true;
          performCalculation();
        } else {
          spValue = 2;
          firstNum = true;
          valueToCompute1 = str(result);
          performCalculation();
        }
      } else if (ispButton.spButtonValue == ".") {
        spValue = 100;
        //concentrate the values clicked on
        if (ispButton.on && firstNum == true) {
          valueToCompute1 += ispButton.spButtonValue;
          displayValue = valueToCompute1;
        } else if (ispButton.on && firstNum == false) {
          valueToCompute2 += ispButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      } else if(ispButton.spButtonValue == "+-") {
          spValue = 3;
          performCalculation();
      } else if(ispButton.spButtonValue == "sin") {
        if(result == 0) {
          spValue = 4;
          firstNum = true;
          performCalculation();
        } else {
          spValue = 4;
          firstNum = true;
          valueToCompute1 = str(result);
          performCalculation();
        }
      } else if(ispButton.spButtonValue == "cos") {
        if(result == 0) {
          spValue = 5;
          firstNum = true;
          performCalculation();
        } else {
          spValue = 5;
          firstNum = true;
          valueToCompute1 = str(result);
          performCalculation();
        }
      } else if(ispButton.spButtonValue == "rad") {
          spValue = 6;
          firstNum = true;
          performCalculation();
        } else {
          spValue = 6;
          firstNum = true;
          valueToCompute1 = str(result);
          performCalculation();
        }
      }
      }
    }
    
    
void keyReleased() {
  //press and display for numbers
    if(keyCode == 49 || keyCode == 50 || keyCode == 51 || keyCode == 52 || keyCode == 53 || keyCode == 54 || keyCode == 55 || keyCode == 56 || keyCode == 57) {
      if (firstNum) {
        valueToCompute1 += int(keyCode - 48);
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += int(keyCode - 48);
        displayValue = valueToCompute2;
      }
    }
    if(keyCode == 96 || keyCode == 97 || keyCode == 98 || keyCode == 99 || keyCode == 100 || keyCode == 101 || keyCode == 102 || keyCode == 103 || keyCode == 104 || keyCode == 105) {
      if (firstNum) {
        valueToCompute1 += int(keyCode - 96);
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += int(keyCode - 96);
        displayValue = valueToCompute2;
      }
    }
    
    if(keyCode == 155) {
      if (firstNum) {
        valueToCompute1 += 0;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 0;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 35) {
      if (firstNum) {
        valueToCompute1 += 1;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 1;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 40) {
      if (firstNum) {
        valueToCompute1 += 2;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 2;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 34) {
      if (firstNum) {
        valueToCompute1 += 3;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 3;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 37) {
      if (firstNum) {
        valueToCompute1 += 4;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 4;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 12) {
      if (firstNum) {
        valueToCompute1 += 5;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 5;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 39) {
      if (firstNum) {
        valueToCompute1 += 6;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 6;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 36) {
      if (firstNum) {
        valueToCompute1 += 7;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 7;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 38) {
      if (firstNum) {
        valueToCompute1 += 8;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 8;
        displayValue = valueToCompute2;
      }
    } else if(keyCode == 33) {
      if (firstNum) {
        valueToCompute1 += 9;
        displayValue = valueToCompute1;
      } else {
        valueToCompute2 += 9;
        displayValue = valueToCompute2;
      }
    }


  //press and display for operators
      if(keyCode == 61 || keyCode == 107) {
        if(result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          valueToCompute1 = str(result);
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      }else if (keyCode == 10) {
          //Perform Calculation
          spValue = 0;
          firstNum = true;
          performCalculation();
        } else if (keyCode == 45 || keyCode == 109 ) {
          if (result != 0) {
            opValue = '-';
            valueToCompute2 = "";
            valueToCompute1 = str(result);
            firstNum = false;
            displayValue = "-";
          } else {
            opValue = '-';
            firstNum = false;
            displayValue = "-";
          }
        } else if (keyCode == 88 || keyCode == 106) {
          if (result != 0) {
            opValue = '*';
            valueToCompute2 = "";
            valueToCompute1 = str(result);
            firstNum = false;
            displayValue = "*";
          } else {
            opValue = '*';
            firstNum = false;
            displayValue = "*";
          }
        } else if (keyCode == 47 || keyCode == 111) {
          if (result != 0) {
            opValue = '/';
            valueToCompute2 = "";
            valueToCompute1 = str(result);
            firstNum = false;
            displayValue = "/";
          } else {
            opValue = '/';
            firstNum = false;
            displayValue = "/";
          }
        } else if (keyCode == 127 || keyCode == 110) {
        spValue = 100;
        //concentrate the values clicked on
        if (firstNum == true) {
          valueToCompute1 += ".";
          displayValue = valueToCompute1;
        } else if (firstNum == false) {
          valueToCompute2 += ".";
          displayValue = valueToCompute2;
        }
      } else if(keyCode == 144) {
        valueToCompute1 = "";
        valueToCompute2 = "";
        firstNum = true;
        displayValue = "0";
        result = 0;
      }
  }
  
  
class Button {
  //class variables
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float x;
  float y;
  int w;
  int h;
  boolean on = false;
  boolean over = false;
  color c;
 
  //Constructor
  Button(float tempX, float tempY, color tempC) {
    x = tempX;
    y = tempY;
    c = tempC;
  }
 
  //Constructor for number buttons
  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    w = tempW;
    h = tempH;
    return this;
  }
 
  //Constructor for operator buttons
  Button asOperator(String tempOpButtonValue, int tempW, int tempH) {
    isNumber = false;
    opButtonValue = tempOpButtonValue;
    w = tempW;
    h = tempH;
    return this;
  }
 
  //Constructor for special buttons
  Button asSpecial(String buttonValue, int tempW, int tempH) {
    isSpecial = true;
    spButtonValue = buttonValue;
    w = tempW;
    h = tempH;
    return this;
  }
 
  //MEMBER METHODS
  //Draw the button on the canvas
  void display() {
    //Draw round-edged button on canvas
    if(isNumber) {
        if(over) {
          fill(200,150,0);
          h = 45;
          w = 45;
        } else {
           fill(c);
           h = 40;
           w = 40;
        }
      stroke(255);
      strokeWeight(1.5);
      ellipse(x,y,w,w);
      if(over) {
        fill(0);
      } else {
        fill(150);
      }
      textSize(20);
      if(numButtonValue == PI) {
        fill(0);
        text("π",x-7,y+7);
      } else{
      text(int(numButtonValue),x-7, y+7);
      }
    } else if(isSpecial) {
        if(over) {
          fill(200,150,0);
          h = 45;
          w = 45;
        } else {
           fill(c);
           h = 40;
           w = 40;
        }
      ellipse(x,y,w,w);
      fill(0);
      if (spButtonValue == "clr") {
        text(spButtonValue, x-12,y+7);
      } else if (spButtonValue == "+-") {
        text("±",x-8,y+7);
      } else if (spButtonValue == "sqrt") {
        text("√x",x-15,y+7);
      } else if (spButtonValue == "sq") {
        text("x²",x-10,y+7);
      } else if(spButtonValue == ".") {
        text(spButtonValue,x-3,y+7);
      } else if(spButtonValue == "sin") {
        text(spButtonValue,x-15,y+7);
      } else if(spButtonValue == "cos") {
        text(spButtonValue,x-15,y+7);
      } else if(spButtonValue == "rad") {
        text(spButtonValue,x-15,y+7);
      }
    }else {
      if(opButtonValue == "=") {
        if(over) {
          fill(200,150,0);
          h = 65;
          w = 65;
        } else {
          fill(c);
          h = 60;
          w = 60;
        }
      } else {
          if(over) {
          fill(200,150,0);
          h = 45;
          w = 45;
        } else {
           fill(c);
           h = 40;
           w = 40;
        }
      }
      ellipse(x,y,h,w);
      fill(0);
      text(opButtonValue,x-7,y+7);
    }
  }
 
  //Handle mouse actions
  void click() {
    on = sqrt(sq(mouseX-x)+sq(mouseY-y))<(w/2);
  
  }
 
   void hover() {
     over = sqrt(sq(mouseX-x)+sq(mouseY-y))<(w/2);
   }

}


