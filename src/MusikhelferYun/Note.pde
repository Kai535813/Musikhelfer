//Mo Spiegel | 3B

class Note {

  //Member variables
  color c1, c2;
  int x;
  boolean inputted;
  boolean restMode;
  boolean flat;
  boolean sharp;
  int noteTog;

  //Tracks where the mouse is clicked (where the note is to be inputted)
  int clickX, clickY, harmY;

  //Constructor
  Note(color c1, color c2, int x, int noteTog, boolean inputted, boolean restMode, boolean flat, boolean sharp) {

    //Hover color
    this.c1 = c1;

    //Inputted note color
    this.c2 = c2;

    //x-position on score
    this.x = x;

    this.noteTog = noteTog;
    this.inputted = inputted;
    this.restMode = restMode;
    this.flat = flat;
    this.sharp = sharp;
  }

  //Member Methods

  //Draws hovering note that snaps to score following user's cursor
  void hover() {
    stroke(c1);
    fill(c1);

    if (inputted == false) {
      imageMode(CENTER);
      for (int i = 65; i<175; i = i + 10) {
        if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY <= i+10 && mouseY<=125) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[3], x, i+24);
            if (sharp == true && mouseY> 65 && mouseY <= 85) {
              image(noteImages[31], x+1, i+57);
            } else if (sharp == true) {
              image(noteImages[31], x+1, i-14);
            } else if (flat == true && mouseY> 65 && mouseY<=95) {
              image(noteImages[29], x-1, i+64);
            } else if (flat == true) {
              image(noteImages[29], x-1, i-14);
            }
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[7], x, i+23);
            if (sharp == true && mouseY> 65 && mouseY <= 85) {
              image(noteImages[31], x+3, i+55);
            } else if (sharp == true) {
              image(noteImages[31], x+3, i-14);
            } else if (flat == true && mouseY> 65 && mouseY<=95) {
              image(noteImages[29], x+2, i+60);
            } else if (flat == true) {
              image(noteImages[29], x+2, i-14);
            }
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[11], x, i+23);
            if (sharp == true && mouseY> 65 && mouseY <= 85) {
              image(noteImages[31], x+3, i+55);
            } else if (sharp == true) {
              image(noteImages[31], x+3, i-14);
            } else if (flat == true && mouseY> 65 && mouseY<=95) {
              image(noteImages[29], x+2, i+60);
            } else if (flat == true) {
              image(noteImages[29], x+2, i-14);
            }
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[15], x, i+23);
            if (sharp == true && mouseY> 65 && mouseY <= 85) {
              image(noteImages[31], x+1, i+57);
            } else if (sharp == true) {
              image(noteImages[31], x+1, i-14);
            } else if (flat == true && mouseY> 65 && mouseY<=95) {
              image(noteImages[29], x-1, i+60);
            } else if (flat == true) {
              image(noteImages[29], x-1, i-14);
            }
          } else if (noteTog ==5 && restMode == false) {
            image(noteImages[17], x, i+5);
            if (sharp == true && mouseY> 65 && mouseY <= 85) {
              image(noteImages[31], x, i+26);
            } else if (sharp == true) {
              image(noteImages[31], x, i-16);
            } else if (flat == true && mouseY> 65 && mouseY<=95) {
              image(noteImages[29], x, i+27);
            } else if (flat == true) {
              image(noteImages[29], x, i-16);
            }
          }
        } else if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY <= i+10 && mouseY >125) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[2], x, i-12);
            if (sharp == true && mouseY> 155 && mouseY <= 180) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 145 && mouseY <= 180) {
              image(noteImages[29], x-2, i - 47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[6], x, i-12);
            if (sharp == true && mouseY> 155 && mouseY <= 180) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 145 && mouseY <= 180) {
              image(noteImages[29], x-2, i-47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[10], x, i-12);
            if (sharp == true && mouseY> 155 && mouseY <= 180) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 145 && mouseY <= 180) {
              image(noteImages[29], x-2, i-47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[14], x, i-12);
            if (sharp == true && mouseY> 155 && mouseY <= 180) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 145 && mouseY <= 180) {
              image(noteImages[29], x-2, i - 47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 5 && restMode == false) {
            image(noteImages[17], x, i+5);
            if (sharp == true) {
              image(noteImages[31], x, i-16);
            } else if (flat == true) {
              image(noteImages[29], x, i-16);
            }
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
    if (clickX>= 140 && clickX<=580 && clickY>= 65 && clickY <= 75 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 89);
        if (sharp == true) {
          image(noteImages[30], x+1, 122);
        } else if (flat == true) {
          image(noteImages[28], x-1, 129);
        }
      } else if (noteTog == 2) {
        image(noteImages[5], x, 88);
        if (sharp == true) {
          image(noteImages[30], x+3, 120);
        } else if (flat == true) {
          image(noteImages[28], x+2, 125);
        }
      } else if (noteTog == 3) {
        image(noteImages[9], x, 88);
        if (sharp == true) {
          image(noteImages[30], x+3, 120);
        } else if (flat == true) {
          image(noteImages[28], x+2, 125);
        }
      } else if (noteTog == 4) {
        image(noteImages[13], x, 88);
        if (sharp == true) {
          image(noteImages[30], x+1, 122);
        } else if (flat == true) {
          image(noteImages[28], x-1, 129);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 70);
        if (sharp == true) {
          image(noteImages[30], x, 91);
        } else if (flat == true) {
          image(noteImages[28], x, 92);
        }
      }
      harmY=40;
    } else if (clickX>= 140 && clickX<=580 && clickY> 75 && clickY <= 85 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 99);
        if (sharp == true) {
          image(noteImages[30], x+1, 132);
        } else if (flat == true) {
          image(noteImages[28], x-1, 139);
        }
      } else if (noteTog == 2) {
        image(noteImages[5], x, 98);
        if (sharp == true) {
          image(noteImages[30], x+3, 130);
        } else if (flat == true) {
          image(noteImages[28], x+2, 135);
        }
      } else if (noteTog == 3) {
        image(noteImages[9], x, 98);
        if (sharp == true) {
          image(noteImages[30], x+3, 130);
        } else if (flat == true) {
          image(noteImages[28], x+2, 135);
        }
      } else if (noteTog == 4) {
        image(noteImages[13], x, 98);
        if (sharp == true) {
          image(noteImages[30], x+1, 132);
        } else if (flat == true) {
          image(noteImages[28], x-1, 139);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 80);
        if (sharp == true) {
          image(noteImages[30], x, 101);
        } else if (flat == true) {
          image(noteImages[28], x, 102);
        }
      }
      harmY=50;
    } else if (clickX>= 140 && clickX<=580 && clickY> 85 && clickY <= 95 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 109);
        if (sharp == true) {
          image(noteImages[30], x+1, 71);
        } else if (flat == true) {
          image(noteImages[28], x-1, 149);
        }
      } else if (noteTog == 2) {
        image(noteImages[5], x, 108);
        if (sharp == true) {
          image(noteImages[30], x+3, 71);
        } else if (flat == true) {
          image(noteImages[28], x+2, 145);
        }
      } else if (noteTog == 3) {
        image(noteImages[9], x, 108);
        if (sharp == true) {
          image(noteImages[30], x+3, 71);
        } else if (flat == true) {
          image(noteImages[28], x+2, 145);
        }
      } else if (noteTog == 4) {
        image(noteImages[13], x, 108);
        if (sharp == true) {
          image(noteImages[30], x+1, 71);
        } else if (flat == true) {
          image(noteImages[28], x-1, 149);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 90);
        if (sharp == true) {
          image(noteImages[30], x, 69);
        } else if (flat == true) {
          image(noteImages[28], x, 102);
        }
      }
      harmY=60;
    } else if (clickX>= 140 && clickX<=580 && clickY> 95 && clickY <= 105 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 119);
        if (sharp == true) {
          image(noteImages[30], x+1, 81);
        } else if (flat == true) {
          image(noteImages[28], x-1, 81);
        }
      } else if (noteTog == 2) {
        image(noteImages[5], x, 118);
        if (sharp == true) {
          image(noteImages[30], x+3, 81);
        } else if (flat == true) {
          image(noteImages[28], x+2, 81);
        }
      } else if (noteTog == 3) {
        image(noteImages[9], x, 118);
        if (sharp == true) {
          image(noteImages[30], x+3, 81);
        } else if (flat == true) {
          image(noteImages[28], x+2, 81);
        }
      } else if (noteTog == 4) {
        image(noteImages[13], x, 118);
        if (sharp == true) {
          image(noteImages[30], x+1, 81);
        } else if (flat == true) {
          image(noteImages[28], x-1, 81);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 100);
        if (sharp == true) {
          image(noteImages[30], x, 79);
        } else if (flat == true) {
          image(noteImages[28], x, 79);
        }
      }
      harmY=70;
    } else if (clickX>= 140 && clickX<=580 && clickY> 105 && clickY <= 115 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 129);
        if (sharp == true) {
          image(noteImages[30], x+1, 91);
        } else if (flat == true) {
          image(noteImages[28], x-1, 91);
        }
      } else if (noteTog == 2) {
        image(noteImages[5], x, 128);
        if (sharp == true) {
          image(noteImages[30], x+3, 91);
        } else if (flat == true) {
          image(noteImages[28], x+2, 91);
        }
      } else if (noteTog == 3) {
        image(noteImages[9], x, 128);
        if (sharp == true) {
          image(noteImages[30], x+3, 91);
        } else if (flat == true) {
          image(noteImages[28], x+2, 91);
        }
      } else if (noteTog == 4) {
        image(noteImages[13], x, 128);
        if (sharp == true) {
          image(noteImages[30], x+1, 91);
        } else if (flat == true) {
          image(noteImages[28], x-1, 91);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 110);
        if (sharp == true) {
          image(noteImages[30], x, 89);
        } else if (flat == true) {
          image(noteImages[28], x, 89);
        }
      }
      harmY=80;
    } else if (clickX>= 140 && clickX<=580 && clickY> 115 && clickY <= 125 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[1], x, 139);
        if (sharp == true) {
          image(noteImages[30], x+1, 101);
        } else if (flat == true) {
          image(noteImages[28], x-1, 101);
        }
      } else if (noteTog == 2) {
        image(noteImages[5], x, 138);
        if (sharp == true) {
          image(noteImages[30], x+3, 101);
        } else if (flat == true) {
          image(noteImages[28], x+2, 101);
        }
      } else if (noteTog == 3) {
        image(noteImages[9], x, 138);
        if (sharp == true) {
          image(noteImages[30], x+3, 101);
        } else if (flat == true) {
          image(noteImages[28], x+2, 101);
        }
      } else if (noteTog == 4) {
        image(noteImages[13], x, 138);
        if (sharp == true) {
          image(noteImages[30], x+1, 101);
        } else if (flat == true) {
          image(noteImages[28], x-1, 101);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 120);
        if (sharp == true) {
          image(noteImages[30], x, 99);
        } else if (flat == true) {
          image(noteImages[28], x, 99);
        }
      }
      harmY=90;
    } else if (clickX>= 140 && clickX<=580 && clickY> 125 && clickY <= 135 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 113);
        if (sharp == true) {
          image(noteImages[30], x-2, 148);
        } else if (flat == true) {
          image(noteImages[28], x-2, 153);
        }
      } else if (noteTog == 2) {
        image(noteImages[4], x, 113);
        if (sharp == true) {
          image(noteImages[30], x-2, 148);
        } else if (flat == true) {
          image(noteImages[28], x-2, 153);
        }
      } else if (noteTog == 3) {
        image(noteImages[8], x, 113);
        if (sharp == true) {
          image(noteImages[30], x-2, 148);
        } else if (flat == true) {
          image(noteImages[28], x-2, 153);
        }
      } else if (noteTog == 4) {
        image(noteImages[12], x, 113);
        if (sharp == true) {
          image(noteImages[30], x-2, 148);
        } else if (flat == true) {
          image(noteImages[28], x-2, 153);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 130);
        if (sharp == true) {
          image(noteImages[30], x, 109);
        } else if (flat == true) {
          image(noteImages[28], x, 109);
        }
      }
      harmY=100;
    } else if (clickX>= 140 && clickX<=580 && clickY> 135 && clickY <= 145 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 123);
        if (sharp == true) {
          image(noteImages[30], x-2, 158);
        } else if (flat == true) {
          image(noteImages[28], x-2, 163);
        }
      } else if (noteTog == 2) {
        image(noteImages[4], x, 123);
        if (sharp == true) {
          image(noteImages[30], x-2, 158);
        } else if (flat == true) {
          image(noteImages[28], x-2, 163);
        }
      } else if (noteTog == 3) {
        image(noteImages[8], x, 123);
        if (sharp == true) {
          image(noteImages[30], x-2, 158);
        } else if (flat == true) {
          image(noteImages[28], x-2, 163);
        }
      } else if (noteTog == 4) {
        image(noteImages[12], x, 123);
        if (sharp == true) {
          image(noteImages[30], x-2, 158);
        } else if (flat == true) {
          image(noteImages[28], x-2, 163);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 140);
        if (sharp == true) {
          image(noteImages[30], x, 119);
        } else if (flat == true) {
          image(noteImages[28], x, 119);
        }
      }
      harmY=110;
    } else if (clickX>= 140 && clickX<=580 && clickY> 145 && clickY <= 155 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 133);
        if (sharp == true) {
          image(noteImages[30], x-2, 168);
        } else if (flat == true) {
          image(noteImages[28], x-2, 98);
        }
      } else if (noteTog == 2) {
        image(noteImages[4], x, 133);
        if (sharp == true) {
          image(noteImages[30], x-2, 168);
        } else if (flat == true) {
          image(noteImages[28], x-2, 98);
        }
      } else if (noteTog == 3) {
        image(noteImages[8], x, 133);
        if (sharp == true) {
          image(noteImages[30], x-2, 168);
        } else if (flat == true) {
          image(noteImages[28], x-2, 98);
        }
      } else if (noteTog == 4) {
        image(noteImages[12], x, 133);
        if (sharp == true) {
          image(noteImages[30], x-2, 168);
        } else if (flat == true) {
          image(noteImages[28], x-2, 98);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 150);
        if (sharp == true) {
          image(noteImages[30], x, 129);
        } else if (flat == true) {
          image(noteImages[28], x, 129);
        }
      }
      harmY=120;
    } else if (clickX>= 140 && clickX<=580 && clickY> 155 && clickY <= 165 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 143);
        if (sharp == true) {
          image(noteImages[30], x-2, 108);
        } else if (flat == true) {
          image(noteImages[28], x-2, 108);
        }
      } else if (noteTog == 2) {
        image(noteImages[4], x, 143);
        if (sharp == true) {
          image(noteImages[30], x-2, 108);
        } else if (flat == true) {
          image(noteImages[28], x-2, 108);
        }
      } else if (noteTog == 3) {
        image(noteImages[8], x, 143);
        if (sharp == true) {
          image(noteImages[30], x-2, 108);
        } else if (flat == true) {
          image(noteImages[28], x-2, 108);
        }
      } else if (noteTog == 4) {
        image(noteImages[12], x, 143);
        if (sharp == true) {
          image(noteImages[30], x-2, 108);
        } else if (flat == true) {
          image(noteImages[28], x-2, 108);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 160);
        if (sharp == true) {
          image(noteImages[30], x, 139);
        } else if (flat == true) {
          image(noteImages[28], x, 139);
        }
      }
      harmY=130;
    } else if (clickX>= 140 && clickX<=580 && clickY> 165 && clickY <= 175 && restMode == false) {
      if (noteTog == 1) {
        image(noteImages[0], x, 153);
        if (sharp == true) {
          image(noteImages[30], x-2, 118);
        } else if (flat == true) {
          image(noteImages[28], x-2, 118);
        }
      } else if (noteTog == 2) {
        image(noteImages[4], x, 153);
        if (sharp == true) {
          image(noteImages[30], x-2, 118);
        } else if (flat == true) {
          image(noteImages[28], x-2, 118);
        }
      } else if (noteTog == 3) {
        image(noteImages[8], x, 153);
        if (sharp == true) {
          image(noteImages[30], x-2, 118);
        } else if (flat == true) {
          image(noteImages[28], x-2, 118);
        }
      } else if (noteTog == 4) {
        image(noteImages[12], x, 153);
        if (sharp == true) {
          image(noteImages[30], x-2, 118);
        } else if (flat == true) {
          image(noteImages[28], x-2, 118);
        }
      } else if (noteTog == 5) {
        image(noteImages[16], x, 170);
        if (sharp == true) {
          image(noteImages[30], x, 149);
        } else if (flat == true) {
          image(noteImages[28], x, 149);
        }
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
