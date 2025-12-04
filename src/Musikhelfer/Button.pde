//Simon Sakata
class Button {
  // Member variables
  int x, y, w, h, r;
  color c1, c2;
  String disVal, val;
  boolean over;

  // Constructor
  Button(int x, int y, int w, int h, int r, color c1, color c2, String val, String disVal) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.r = r;
    this.disVal = disVal;
    this.val = val;
    this.c1 = c1;
    this.c2 = c2;
    over = false;
  }

  // Member Methods
  void display() {
    rectMode(CENTER);
    //Draw shadow
    noStroke();
    fill(60);
    rect(x-3, y+4, w, h, r);

    if (over) {
      fill(c1);
    } else {
      fill(c2);
    }
    stroke(#3348F2);
    rect(x, y, w, h, r);

    // Draw button text
    textFont(font, 30);
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255);
    text(disVal, x, y, w, h);
  }

  boolean hover(int tempX, int tempY) {
    // Check if the mouse is within the bounds
    if (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2) {
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  }
}
