//Mo Spiegel | 3B

class Note {

  //Member variables
  color c1, c2;
  int x;
  boolean inputted;
  boolean restMode;
  int noteTog;

  //Tracks where the mouse is clicked (where the note is to be inputted)
  int clickX, clickY,harmY;

  //Constructor
  Note(color c1, color c2, int x, int noteTog, boolean inputted, boolean restMode) {

    //Hover color
    this.c1 = c1;

    //Inputted note color
    this.c2 = c2;

    //x-position on score
    this.x = x;

    this.noteTog = noteTog;
    this.inputted = inputted;
    this.restMode = restMode;
  }

  //Member Methods

  //Draws hovering note that snaps to score following user's cursor
  void hover() {
    stroke(c1);
    fill(c1);

    if (inputted == false) {
      imageMode(CENTER);
      for (int i = 65; i<175; i = i + 10) {
        if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY< i+10 && mouseY<125) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[3], x, i+24);
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[7], x, i+23);
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[11], x, i+23);
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[15], x, i+23);
          } else if (noteTog ==5 && restMode == false) {
            image(noteImages[17], x, i+5);
          } 
        } else if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY < i+10 && mouseY >125) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[2], x, i-12);
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[6], x, i-12);
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[10], x, i-12);
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[14], x, i-12);
          } else if (noteTog == 5 && restMode == false) {
            image(noteImages[17], x, i+5);
          }
        }
      }
      //Rests
      if (noteTog == 1 && restMode == true) {
        image(noteImages[19], x, 123);
      } else if (noteTog == 2 && restMode == true) {
        image(noteImages[21], x, 120);
      } else if (noteTog == 3 && restMode == true) {
        image(noteImages[23], x, 130);
      } else if (noteTog == 4 && restMode == true) {
        image(noteImages[25], x, 130);
      } else if (noteTog == 5 && restMode == true) {
        image(noteImages[27], x, 138);
      }
    }
  }

  //Draws a note when it is inputted (mouse clicked)
  void inputNote() {
    if (mouseClicked == true && inputted == false && mouseX>= 40 && mouseX<=540 && mouseY> 60 && mouseY<180) {
      clickX = mouseX;
      clickY =  mouseY;
    }

    //Draw note
    strokeWeight(2);
    fill(c2);
    stroke(c2);
    if (clickX>= 140 && clickX<=580 && clickY> 65 && clickY< 75 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 89);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 88);
      } else if (noteTog == 3) {
        image(noteImages[9], x, 88);
      } else if (noteTog == 4) {
        image(noteImages[13], x, 88);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 70);
      } 
      harmY=40;
    } else if (clickX>= 140 && clickX<=580 && clickY>= 75 && clickY <= 85 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 99);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 98);
      } else if (noteTog == 3) {
        image(noteImages[9], x, 98);
      } else if (noteTog == 4) {
        image(noteImages[13], x, 98);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 80);
      }
      harmY=50;
    } else if (clickX>= 140 && clickX<=580 && clickY> 85 && clickY <= 95 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 109);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 108);
      } else if (noteTog == 3) {
        image(noteImages[9], x, 108);
      } else if (noteTog == 4) {
        image(noteImages[13], x, 108);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 90);
      }
      harmY=60;
    } else if (clickX>= 140 && clickX<=580 && clickY> 95 && clickY <= 105 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 119);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 118);
      } else if (noteTog == 3) {
        image(noteImages[9], x, 118);
      } else if (noteTog == 4) {
        image(noteImages[13], x, 118);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 100);
      }
      harmY=70;
    } else if (clickX>= 140 && clickX<=580 && clickY> 105 && clickY <= 115 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 129);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 128);
      } else if (noteTog == 3) {
        image(noteImages[9], x, 128);
      } else if (noteTog == 4) {
        image(noteImages[13], x, 128);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 110);
      }
      harmY=80;
    } else if (clickX>= 140 && clickX<=580 && clickY> 115 && clickY <= 125 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 139);
      } else if (noteTog == 2) {
        image(noteImages[5], x, 138);
      } else if (noteTog == 3) {
        image(noteImages[9], x, 138);
      } else if (noteTog == 4) {
        image(noteImages[13], x, 138);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 120);
      }
      harmY=90;
    } else if (clickX>= 140 && clickX<=580 && clickY> 125 && clickY <= 135 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 113);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 113);
      } else if (noteTog == 3) {
        image(noteImages[8], x, 113);
      } else if (noteTog == 4) {
        image(noteImages[12], x, 113);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 130);
      }
      harmY=100;
    } else if (clickX>= 140 && clickX<=580 && clickY> 135 && clickY <= 145 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 123);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 123);
      } else if (noteTog == 3) {
        image(noteImages[8], x, 123);
      } else if (noteTog == 4) {
        image(noteImages[12], x, 123);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 140);
      }
      harmY=110;
    } else if (clickX>= 140 && clickX<=580 && clickY> 145 && clickY <= 155 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 133);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 133);
      } else if (noteTog == 3) {
        image(noteImages[8], x, 133);
      } else if (noteTog == 4) {
        image(noteImages[12], x, 133);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 150);
      }
      harmY=120;
    } else if (clickX>= 140 && clickX<=580 && clickY> 155 && clickY <= 165 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 143);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 143);
      } else if (noteTog == 3) {
        image(noteImages[8], x, 143);
      } else if (noteTog == 4) {
        image(noteImages[12], x, 143);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 160);
      }
      harmY=130;
    } else if (clickX>= 140 && clickX<=580 && clickY> 165 && clickY <= 175 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 153);
      } else if (noteTog == 2) {
        image(noteImages[4], x, 153);
      } else if (noteTog == 3) {
        image(noteImages[8], x, 153);
      } else if (noteTog == 4) {
        image(noteImages[12], x, 153);
      } else if (noteTog == 5) {
        image(noteImages[16], x, 170);
      }
      harmY=140;
    } else if (clickX >= 140 && clickX <= 580 && restMode == true) {
      if (noteTog == 1) {
        image(noteImages[18], x, 123);
      } else if (noteTog == 2) {
        image(noteImages[20], x, 120);
      } else if (noteTog == 3) {
        image(noteImages[22], x, 130);
      } else if (noteTog == 4) {
        image(noteImages[24], x, 130);
      } else if (noteTog == 5) {
        image(noteImages[26], x, 138);
      }
      harmY=0;
    }
  }

  //Update mouseClicked when a click has been completed
  void mouseClick() {
    if (mouseClicked == false) {
      mouseClicked = true;
    }
  }
  int yVal() {
    return round(harmY/10);
  }
}
