//Mo Spiegel | 3B

class Note {

  //Member variables
  color c1, c2;
  int x, y;
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
      for (int i = 85; i<195; i = i + 10) {
        if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY <= i+10 && mouseY<=145) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[3], x, i+23);
            if (sharp == true && mouseY> 85 && mouseY <= 105) {
              image(noteImages[31], x+1, i+57);
            } else if (sharp == true) {
              image(noteImages[31], x+1, i-14);
            } else if (flat == true && mouseY> 85 && mouseY<=115) {
              image(noteImages[29], x-1, i+64);
            } else if (flat == true) {
              image(noteImages[29], x-1, i-14);
            }
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[7], x, i+23);
            if (sharp == true && mouseY> 85 && mouseY <= 105) {
              image(noteImages[31], x+3, i+55);
            } else if (sharp == true) {
              image(noteImages[31], x+3, i-14);
            } else if (flat == true && mouseY> 85 && mouseY<=115) {
              image(noteImages[29], x+2, i+60);
            } else if (flat == true) {
              image(noteImages[29], x+2, i-14);
            }
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[11], x, i+23);
            if (sharp == true && mouseY> 85 && mouseY <= 105) {
              image(noteImages[31], x+3, i+55);
            } else if (sharp == true) {
              image(noteImages[31], x+3, i-14);
            } else if (flat == true && mouseY> 85 && mouseY<=115) {
              image(noteImages[29], x+2, i+60);
            } else if (flat == true) {
              image(noteImages[29], x+2, i-14);
            }
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[15], x, i+23);
            if (sharp == true && mouseY> 85 && mouseY <= 105) {
              image(noteImages[31], x+1, i+57);
            } else if (sharp == true) {
              image(noteImages[31], x+1, i-14);
            } else if (flat == true && mouseY> 85 && mouseY<=115) {
              image(noteImages[29], x-1, i+60);
            } else if (flat == true) {
              image(noteImages[29], x-1, i-14);
            }
          } else if (noteTog ==5 && restMode == false) {
            image(noteImages[17], x, i+5);
            if (sharp == true && mouseY> 85 && mouseY <= 105) {
              image(noteImages[31], x, i+26);
            } else if (sharp == true) {
              image(noteImages[31], x, i-16);
            } else if (flat == true && mouseY> 85 && mouseY<=115) {
              image(noteImages[29], x, i+27);
            } else if (flat == true) {
              image(noteImages[29], x, i-16);
            }
          }
        } else if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY <= i+10 && mouseY >145) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[2], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 200) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 200) {
              image(noteImages[29], x-2, i - 47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[6], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 200) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 200) {
              image(noteImages[29], x-2, i-47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[10], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 200) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 200) {
              image(noteImages[29], x-2, i-47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[14], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 200) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 200) {
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
        image(noteImages[19], x, 143);
      } else if (noteTog == 2 && restMode == true) {
        image(noteImages[21], x, 140);
      } else if (noteTog == 3 && restMode == true) {
        image(noteImages[23], x, 150);
      } else if (noteTog == 4 && restMode == true) {
        image(noteImages[25], x, 150);
      } else if (noteTog == 5 && restMode == true) {
        image(noteImages[27], x, 158);
      }
    }
  }

  //Draws a note when it is inputted (mouse clicked)
  void inputNote() {
    if (mouseClicked == true && inputted == false && mouseX>= 40 && mouseX<=580 && mouseY> 85 && mouseY<195) {
      clickX = mouseX;
      clickY =  mouseY;
    }

    //Draw note
    strokeWeight(2);
    fill(c2);
    stroke(c2);
    if (clickX >= 40 && clickX <= 580 && clickY> 85 && clickY<195) {
      if (clickY >= 85 && clickY <= 95) {
        y = 85;
        harmY = 40;
      } else if (clickY > 95 && clickY <=105) {
        y = 95;
        harmY = 50;
      } else if (clickY > 105 && clickY <=115) {
        y = 105;
        harmY = 60;
      } else if (clickY > 115 && clickY <=125) {
        y = 115;
        harmY = 70;
      } else if (clickY > 125 && clickY <=135) {
        y = 125;
        harmY = 80;
      } else if (clickY > 135 && clickY <=145) {
        y = 135;
        harmY = 90;
      } else if (clickY > 145 && clickY <=155) {
        y = 145;
        harmY = 100;
      } else if (clickY > 155 && clickY <=165) {
        y = 155;
        harmY = 110;
      } else if (clickY > 165 && clickY <=175) {
        y = 165;
        harmY = 120;
      } else if (clickY > 175 && clickY <=185) {
        y = 175;
        harmY = 130;
      } else if (clickY > 185 && clickY <=195) {
        y = 185;
        harmY = 140;
      }
    }
    if (y< 145) {
      if (noteTog == 1 && restMode == false) {
        image(noteImages[1], x, y+23);
        if (sharp == true && y>= 85 && y <= 105) {
          image(noteImages[30], x+1, y+57);
        } else if (sharp == true) {
          image(noteImages[30], x+1, y-14);
        } else if (flat == true && y>= 85 && y<=115) {
          image(noteImages[28], x-1, y+64);
        } else if (flat == true) {
          image(noteImages[28], x-1, y-14);
        }
      } else if (noteTog == 2 && restMode == false) {
        image(noteImages[5], x, y+23);
        if (sharp == true && y>= 85 && y <= 105) {
          image(noteImages[30], x+3, y+55);
        } else if (sharp == true) {
          image(noteImages[30], x+3, y-14);
        } else if (flat == true && y>= 85 && y<=115) {
          image(noteImages[28], x+2, y+60);
        } else if (flat == true) {
          image(noteImages[28], x+2, y-14);
        }
      } else if (noteTog == 3 && restMode == false) {
        image(noteImages[9], x, y+23);
        if (sharp == true && y>= 85 && y <= 105) {
          image(noteImages[30], x+3, y+55);
        } else if (sharp == true) {
          image(noteImages[30], x+3, y-14);
        } else if (flat == true && y>= 85 && y<=115) {
          image(noteImages[28], x+2, y+60);
        } else if (flat == true) {
          image(noteImages[28], x+2, y-14);
        }
      } else if (noteTog == 4 && restMode == false) {
        image(noteImages[13], x, y+23);
        if (sharp == true && y>= 85 && y <= 105) {
          image(noteImages[30], x+1, y+57);
        } else if (sharp == true) {
          image(noteImages[30], x+1, y-14);
        } else if (flat == true && y>= 85 && y<=115) {
          image(noteImages[28], x-1, y+60);
        } else if (flat == true) {
          image(noteImages[28], x-1, y-14);
        }
      } else if (noteTog ==5 && restMode == false) {
        image(noteImages[16], x, y+5);
        if (sharp == true && y>= 85 && y <= 105) {
          image(noteImages[30], x, y+26);
        } else if (sharp == true) {
          image(noteImages[30], x, y-16);
        } else if (flat == true && y>= 85 && y<=115) {
          image(noteImages[28], x, y+27);
        } else if (flat == true) {
          image(noteImages[28], x, y-16);
        }
      }
    } else if (y >= 145) {
      if (noteTog == 1 && restMode == false) {
        image(noteImages[0], x, y-12);
        if (sharp == true && y>= 175 && y <= 200) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 200) {
          image(noteImages[28], x-2, y - 47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 2 && restMode == false) {
        image(noteImages[4], x, y-12);
        if (sharp == true && y>= 175 && y <= 200) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 200) {
          image(noteImages[28], x-2, y-47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 3 && restMode == false) {
        image(noteImages[8], x, y-12);
        if (sharp == true && y>= 175 && y <= 200) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 200) {
          image(noteImages[28], x-2, y-47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 4 && restMode == false) {
        image(noteImages[12], x, y-12);
        if (sharp == true && y>= 175 && y <= 200) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 200) {
          image(noteImages[28], x-2, y - 47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 5 && restMode == false) {
        image(noteImages[16], x, y+5);
        if (sharp == true) {
          image(noteImages[30], x, y-16);
        } else if (flat == true) {
          image(noteImages[28], x, y-16);
        }
      }
    }
    if (noteTog == 1 && restMode == true) {
      image(noteImages[18], x, 143);
    } else if (noteTog == 2 && restMode == true) {
      image(noteImages[20], x, 140);
    } else if (noteTog == 3 && restMode == true) {
      image(noteImages[22], x, 150);
    } else if (noteTog == 4 && restMode == true) {
      image(noteImages[24], x, 150);
    } else if (noteTog == 5 && restMode == true) {
      image(noteImages[26], x, 158);
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
