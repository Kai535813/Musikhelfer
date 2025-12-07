//Mo Spiegel | 3B

class Note {

  //Member variables
  int x, y;
  boolean inputted, restMode, flat, sharp;
  int noteTog;
  int clickX, clickY; //Tracks where the mouse is clicked (where the note is to be inputted)
  int harmY; //Tracks values for hash maps

  //Constructor
  Note(int x, int noteTog, boolean inputted, boolean restMode, boolean flat, boolean sharp) {
    this.x = x; //x-position on score
    this.noteTog = noteTog; //Note value (i.e. duration)
    this.inputted = inputted; //Whether or not the note has been inputted
    this.restMode = restMode; //Whether or not the note is a rest
    this.flat = flat; //Whether or not the note is flat
    this.sharp = sharp; //Whether or not the note is sharp
  }

  //Member Methods

  //Draws hovering note that snaps to score following user's cursor
  void hover() {
    if (inputted == false) {
      imageMode(CENTER);
      for (int i = 95; i<205; i = i + 10) {
        if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY <= i+10 && mouseY<=155) { //Tracks what line or space on the score the cursor is on
          //Each if block draws a hovering note on that line or space on the score
          if (noteTog == 1 && restMode == false) {
            image(noteImages[3], x, i+23);
            if (sharp == true && mouseY> 95 && mouseY <= 115) {
              image(noteImages[31], x+1, i+57);
            } else if (sharp == true) {
              image(noteImages[31], x+1, i-14);
            } else if (flat == true && mouseY> 95 && mouseY<=125) {
              image(noteImages[29], x-1, i+64);
            } else if (flat == true) {
              image(noteImages[29], x-1, i-14);
            }
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[7], x, i+23);
            if (sharp == true && mouseY> 95 && mouseY <= 115) {
              image(noteImages[31], x+3, i+55);
            } else if (sharp == true) {
              image(noteImages[31], x+3, i-14);
            } else if (flat == true && mouseY> 95 && mouseY<=125) {
              image(noteImages[29], x+2, i+60);
            } else if (flat == true) {
              image(noteImages[29], x+2, i-14);
            }
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[11], x, i+23);
            if (sharp == true && mouseY> 95 && mouseY <= 115) {
              image(noteImages[31], x+3, i+55);
            } else if (sharp == true) {
              image(noteImages[31], x+3, i-14);
            } else if (flat == true && mouseY> 95 && mouseY<=125) {
              image(noteImages[29], x+2, i+60);
            } else if (flat == true) {
              image(noteImages[29], x+2, i-14);
            }
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[15], x, i+23);
            if (sharp == true && mouseY> 95 && mouseY <= 115) {
              image(noteImages[31], x+1, i+57);
            } else if (sharp == true) {
              image(noteImages[31], x+1, i-14);
            } else if (flat == true && mouseY> 95 && mouseY<=125) {
              image(noteImages[29], x-1, i+60);
            } else if (flat == true) {
              image(noteImages[29], x-1, i-14);
            }
          } else if (noteTog ==5 && restMode == false) {
            image(noteImages[17], x, i+5);
            if (sharp == true && mouseY> 95 && mouseY <= 115) {
              image(noteImages[31], x, i+26);
            } else if (sharp == true) {
              image(noteImages[31], x, i-16);
            } else if (flat == true && mouseY> 95 && mouseY<=125) {
              image(noteImages[29], x, i+27);
            } else if (flat == true) {
              image(noteImages[29], x, i-16);
            }
          }
        } else if (mouseX>= 140 && mouseX<=580 && mouseY> i && mouseY <= i+10 && mouseY >155) {
          if (noteTog == 1 && restMode == false) {
            image(noteImages[2], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 215) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 215) {
              image(noteImages[29], x-2, i - 47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 2 && restMode == false) {
            image(noteImages[6], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 215) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 215) {
              image(noteImages[29], x-2, i-47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 3 && restMode == false) {
            image(noteImages[10], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 215) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 215) {
              image(noteImages[29], x-2, i-47);
            } else if (flat == true) {
              image(noteImages[29], x-2, i+27);
            }
          } else if (noteTog == 4 && restMode == false) {
            image(noteImages[14], x, i-12);
            if (sharp == true && mouseY> 175 && mouseY <= 215) {
              image(noteImages[31], x-2, i-47);
            } else if (sharp == true) {
              image(noteImages[31], x-2, i+23);
            } else if (flat == true && mouseY> 165 && mouseY <= 215) {
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
        image(noteImages[19], x, 153);
      } else if (noteTog == 2 && restMode == true) {
        image(noteImages[21], x, 150);
      } else if (noteTog == 3 && restMode == true) {
        image(noteImages[23], x, 160);
      } else if (noteTog == 4 && restMode == true) {
        image(noteImages[25], x, 160);
      } else if (noteTog == 5 && restMode == true) {
        image(noteImages[27], x, 168);
      }
    }
  }

  //Draws a note when it is inputted (mouse clicked)
  void inputNote() {
    if (inputted == false && mouseX>= 40 && mouseX<=580 && mouseY> 95 && mouseY<205) { //Score hitbox
      clickX = mouseX;
      clickY =  mouseY;
    }

    //Set the note y-position based off of where the user clicked on the score (causes it to snap to line or space)
    if (clickY >= 95 && clickY <= 105) {
      y = 95;
      harmY = 40;
    } else if (clickY > 105 && clickY <=115) {
      y = 105;
      harmY = 50;
    } else if (clickY > 115 && clickY <=125) {
      y = 115;
      harmY = 60;
    } else if (clickY > 125 && clickY <=135) {
      y = 125;
      harmY = 70;
    } else if (clickY > 135 && clickY <=145) {
      y = 135;
      harmY = 80;
    } else if (clickY > 145 && clickY <=155) {
      y = 145;
      harmY = 90;
    } else if (clickY > 155 && clickY <=165) {
      y = 155;
      harmY = 100;
    } else if (clickY > 165 && clickY <=175) {
      y = 165;
      harmY = 110;
    } else if (clickY > 175 && clickY <=185) {
      y = 175;
      harmY = 120;
    } else if (clickY > 185 && clickY <=195) {
      y = 185;
      harmY = 130;
    } else if (clickY > 195 && clickY <=205) {
      y = 195;
      harmY = 140;
    }
    
    //Inputs the note based on this y-position
    if (y< 155) {
      if (noteTog == 1 && restMode == false) {
        image(noteImages[1], x, y+23);
        if (sharp == true && y>= 95 && y <= 115) {
          image(noteImages[30], x+1, y+57);
        } else if (sharp == true) {
          image(noteImages[30], x+1, y-14);
        } else if (flat == true && y>= 95 && y<=125) {
          image(noteImages[28], x-1, y+64);
        } else if (flat == true) {
          image(noteImages[28], x-1, y-14);
        }
      } else if (noteTog == 2 && restMode == false) {
        image(noteImages[5], x, y+23);
        if (sharp == true && y>= 95 && y <= 115) {
          image(noteImages[30], x+3, y+55);
        } else if (sharp == true) {
          image(noteImages[30], x+3, y-14);
        } else if (flat == true && y>= 95 && y<=125) {
          image(noteImages[28], x+2, y+60);
        } else if (flat == true) {
          image(noteImages[28], x+2, y-14);
        }
      } else if (noteTog == 3 && restMode == false) {
        image(noteImages[9], x, y+23);
        if (sharp == true && y>= 95 && y <= 115) {
          image(noteImages[30], x+3, y+55);
        } else if (sharp == true) {
          image(noteImages[30], x+3, y-14);
        } else if (flat == true && y>= 95 && y<=125) {
          image(noteImages[28], x+2, y+60);
        } else if (flat == true) {
          image(noteImages[28], x+2, y-14);
        }
      } else if (noteTog == 4 && restMode == false) {
        image(noteImages[13], x, y+23);
        if (sharp == true && y>= 95 && y <= 115) {
          image(noteImages[30], x+1, y+57);
        } else if (sharp == true) {
          image(noteImages[30], x+1, y-14);
        } else if (flat == true && y>= 95 && y<=125) {
          image(noteImages[28], x-1, y+60);
        } else if (flat == true) {
          image(noteImages[28], x-1, y-14);
        }
      } else if (noteTog ==5 && restMode == false) {
        image(noteImages[16], x, y+5);
        if (sharp == true && y>= 95 && y <= 115) {
          image(noteImages[30], x, y+26);
        } else if (sharp == true) {
          image(noteImages[30], x, y-16);
        } else if (flat == true && y>= 95 && y<=125) {
          image(noteImages[28], x, y+27);
        } else if (flat == true) {
          image(noteImages[28], x, y-16);
        }
      }
    } else if (y >= 155) {
      if (noteTog == 1 && restMode == false) {
        image(noteImages[0], x, y-12);
        if (sharp == true && y>= 175 && y <= 215) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 215) {
          image(noteImages[28], x-2, y - 47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 2 && restMode == false) {
        image(noteImages[4], x, y-12);
        if (sharp == true && y>= 175 && y <= 215) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 215) {
          image(noteImages[28], x-2, y-47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 3 && restMode == false) {
        image(noteImages[8], x, y-12);
        if (sharp == true && y>= 175 && y <= 215) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 215) {
          image(noteImages[28], x-2, y-47);
        } else if (flat == true) {
          image(noteImages[28], x-2, y+27);
        }
      } else if (noteTog == 4 && restMode == false) {
        image(noteImages[12], x, y-12);
        if (sharp == true && y>= 175 && y <= 215) {
          image(noteImages[30], x-2, y-47);
        } else if (sharp == true) {
          image(noteImages[30], x-2, y+23);
        } else if (flat == true && y>= 165 && y <= 215) {
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
    
    //Rests
    if (noteTog == 1 && restMode == true) {
      image(noteImages[18], x, 153);
    } else if (noteTog == 2 && restMode == true) {
      image(noteImages[20], x, 150);
    } else if (noteTog == 3 && restMode == true) {
      image(noteImages[22], x, 160);
    } else if (noteTog == 4 && restMode == true) {
      image(noteImages[24], x, 160);
    } else if (noteTog == 5 && restMode == true) {
      image(noteImages[26], x, 168);
    }
  }

  //Return for hash map
  int yVal() {
    return round(harmY/10);
  }
}
