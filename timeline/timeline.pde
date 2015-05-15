void setup() {
  size(900, 400);
  background(150, 130, 150);
}

void draw() {
  background(150, 130, 150);
  stroke(150, 0, 0);
  strokeWeight(5);
  line(50, 250, 850, 250);

  textFont(loadFont("Utsaah-48.vlw"), 30);

  //title
  if (mouseX  <= width/2 && mouseY <= height/2) {
    fill(255);
  }
  if (mouseX >= width/2 && mouseY <= height/2) {
    fill(255, 0, 255);
  }
  if (mouseX <= width/2 && mouseY >= height/2) {
    fill(0, 255, 255);
  }
  if (mouseX >= width/2 && mouseY >= height/2) {
    fill(255, 255, 0);
  }
  textSize(70);
  text("Historic Computer Systems", 150, 60);


  //events 
  fill(0, 0, 255);
  histEvent("Z2-1939", "one of the earliest examples of an electromechanical relay computer", 53, 190, true);

  histEvent("Atanasoff-Berry Computer-1942", "the first electronic digital calculating device, all electronic, used about 300 vacuum tubes", 53*3, 310, false);

  histEvent("ENIAC-1946", "the first electronic programmable computer built in the US", 53*7, 190, true);

  histEvent("Manchester Mark 1-1948", "one of the earliest stored-program computers, developed at the Victoria University of Manchester from the Small-Scale Experimental Machine", 53*9, 310, false);

  histEvent("EDVAC-1951", "stored-program computer, developed by US Army", 53*12, 190, true);

  histEvent("Ferranti Mark 1-1951", "commercial version of the Manchester Mark 1", 53*12, 310, false);

  histEvent("EDSAC 2-1952", "superseded EDSAC 1, stayed in use until 1965", 53*13, 205, true);

  histEvent("IBM 704-1954", "used magnetic core memory, which became the standard for large machines", 53*15, 310, false);

  //name appear 
  fill(0);
  if (mouseX >= 100 && mouseX <= 800 && mouseY >= 350 && mousePressed == true) {
    textSize(60);
    text("Kira", 450, 380);
  } else {
    text("", 450, 380);
  }
}

void histEvent(String eText, String details, int xpos, int ypos, boolean top) {
  if (top) {
    fill(0, 0, 255);
    line(xpos, ypos, xpos+40, 250);
    textSize(20);
    text(eText, xpos-30, ypos-10);
    if (mouseX > xpos-30 && mouseX < xpos+50 &&
      mouseY > ypos-30 && mouseY < ypos-10) {
      fill(200, 200, 44);
      text(details, 10, 100);
    }
  } else {
    fill(0, 0, 255);
    line(xpos, ypos, xpos+40, ypos-60);
    textSize(20);
    text(eText, xpos-30, ypos+10);
    if (mouseX > xpos-30 && mouseX < xpos+70 &&
      mouseY > ypos-10 && mouseY < ypos+30) {
      fill(200, 200, 44);
      text(details, 10, 100);
    }
  }
}



