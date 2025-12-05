
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
    noStroke();
    if(over) {
      fill(c1);
    } else {
      fill(c2);
    }
    rect(x,y,w,h,r);
    

   
    // Optional: draw button border
    stroke(0);
    strokeWeight(2);
    noFill();
    rect(x, y, w, h, 25);

    // Draw button text
    fill(0);
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(20);
    text(disVal, x, y,w,h);
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
