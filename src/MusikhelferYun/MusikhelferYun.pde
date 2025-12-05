//Kai Yun Chao | 3B
import processing.sound.*;
SoundFile pitch, pitchA4, pitchAs4, pitchB4, pitchC4, pitchCs4, pitchD4, pitchDs4, pitchE4, pitchF4, pitchFs4, pitchG4, pitchGs4, pitchA5, pitchAs5, pitchB5, pitchC5, pitchCs5, pitchD5, pitchDs5, pitchE5, pitchF5, pitchFs5, pitchG5, pitchGs5;
Delay delay;

//Ethan Tang | 3B | 11/4/25
import java.util.Map;
HashMap<Integer, String> keyConvert= new HashMap<Integer, String>();
ArrayList<Note> notes = new ArrayList<Note>();
PImage[] noteImages = new PImage[35];
boolean mouseClicked, firstSwitch;
StringList inputScore;
StringList harmonizeRes;
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[12];
Button[] harmButtons=new Button[12];
Button[] metroButtons=new Button[3];
Button[] pitchButtons=new Button[14];
int modeTog, clef;
String buttonVal, tuneNote, scoreNote, metroVal, noteVal;
Boolean play;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
PFont myFont;
//Simon Sakata
int interval, note1, note2;


void setup() {
 
  
  clef = 1;
  //Sounds and Sound Settings, Kai Yun Chao | 3B
  pitchA4 = new SoundFile(this, "A4.mp3");
  pitchC4 = new SoundFile(this, "C4.mp3");
  pitchAs4 = new SoundFile(this, "A#4.mp3");
  pitchB4 = new SoundFile(this, "B4.mp3");
  pitchCs4 = new SoundFile(this, "C#4.mp3");
  pitchD4 = new SoundFile(this, "D4.mp3");
  pitchDs4 = new SoundFile(this, "D#4.mp3");
  pitchE4 = new SoundFile(this, "E4.mp3");
  pitchF4 = new SoundFile(this, "F4.mp3");
  pitchFs4 = new SoundFile(this, "F#4.mp3");
  pitchG4 = new SoundFile(this, "G4.mp3");
  pitchGs4 = new SoundFile(this, "G#4.mp3");
  pitchA5 = new SoundFile(this, "A5.mp3");
  pitchC5 = new SoundFile(this, "C5.mp3");
  pitchAs5 = new SoundFile(this, "As5.mp3");
  pitchB5 = new SoundFile(this, "B5.mp3");
  pitchCs5 = new SoundFile(this, "Cs5.mp3");
  pitchD5 = new SoundFile(this, "D5.mp3");
  pitchDs5 = new SoundFile(this, "Ds5.mp3");
  pitchE5 = new SoundFile(this, "E5.mp3");
  pitchF5 = new SoundFile(this, "F5.mp3");
  pitchFs5 = new SoundFile(this, "Fs5.mp3");
  pitchG5 = new SoundFile(this, "G5.mp3");
  pitchGs5 = new SoundFile(this, "Gs5.mp3");
 noteVal = ""; 
delay = new Delay(this);
  //delay.process("A4.mp3" );
  //delay.time(1.0);
  
  //Notes
  noteImages[0] = loadImage("Quarter Note.png");
  noteImages[1] = loadImage("Quarter Note (BOTTOM SIDE).png");
  noteImages[2] = loadImage("Quarter Note (HOVER).png");
  noteImages[3] = loadImage("Quarter Note (HOVER, BOTTOM SIDE).png");
  noteImages[4] = loadImage("Eight Note.png");
  noteImages[5] = loadImage("Eight Note (BOTTOM SIDE).png");
  noteImages[6] = loadImage("Eight Note (HOVER).png");
  noteImages[7] = loadImage("Eight Note (HOVER, BOTTOM SIDE).png");
  noteImages[8] = loadImage("Sixteenth Note.png");
  noteImages[9] = loadImage("Sixteenth Note (BOTTOM SIDE).png");
  noteImages[10] = loadImage("Sixteenth Note (HOVER).png");
  noteImages[11] = loadImage("Sixteenth Note (HOVER, BOTTOM SIDE).png");
  noteImages[12] = loadImage("Half Note.png");
  noteImages[13] = loadImage("Half Note (BOTTOM SIDE).png");
  noteImages[14] = loadImage("Half Note (HOVER).png");
  noteImages[15] = loadImage("Half Note (HOVER, BOTTOM SIDE).png");
  noteImages[16] = loadImage("Whole Note.png");
  noteImages[17] = loadImage("Whole Note (HOVER).png");

  //Rests
  noteImages[18] = loadImage("Quarter Rest.png");
  noteImages[19] = loadImage("Quarter Rest (HOVER).png");
  noteImages[20] = loadImage("Eight Rest.png");
  noteImages[21] = loadImage("Eight Rest (HOVER).png");
  noteImages[22] = loadImage("Sixteenth Rest.png");
  noteImages[23] = loadImage("Sixteenth Rest (HOVER).png");
  noteImages[24] = loadImage("Half Rest.png");
  noteImages[25] = loadImage("Half Rest (HOVER).png");
  noteImages[26] = loadImage("Whole Rest.png");
  noteImages[27] = loadImage("Whole Rest (HOVER).png");


  //Misc
  noteImages[28] = loadImage("Flat.png");
  noteImages[29] = loadImage("Flat (HOVER).png");
  noteImages[30] = loadImage("Sharp.png");
  noteImages[31] = loadImage("Sharp (HOVER).png");
  noteImages[32] = loadImage("Final Play.png");
  noteImages[33] = loadImage("rTreble Clef.png");
  noteImages[34] = loadImage("rBass Clef.png");

  noteImages[0].resize(40, 80);
  noteImages[1].resize(40, 80);
  noteImages[2].resize(40, 80);
  noteImages[3].resize(40, 80);
  noteImages[4].resize(40, 80);
  noteImages[5].resize(40, 80);
  noteImages[6].resize(40, 80);
  noteImages[7].resize(40, 80);
  noteImages[8].resize(40, 80);
  noteImages[9].resize(40, 80);
  noteImages[10].resize(40, 80);
  noteImages[11].resize(40, 80);
  noteImages[12].resize(40, 80);
  noteImages[13].resize(40, 80);
  noteImages[14].resize(40, 80);
  noteImages[15].resize(40, 80);
  noteImages[16].resize(25, 25);
  noteImages[17].resize(25, 25);

  //Quarter Rests
  noteImages[18].resize(30, 70);
  noteImages[19].resize(30, 70);

  //Eight Rests
  noteImages[20].resize(19, 30);
  noteImages[21].resize(19, 30);

  //Sixteenth Rests
  noteImages[22].resize(20, 45);
  noteImages[23].resize(20, 45);

  //Half Rests
  noteImages[24].resize(48, 90);
  noteImages[25].resize(48, 90);

  //Whole Rests
  noteImages[26].resize(48, 90);
  noteImages[27].resize(48, 90);

  //Flats
  noteImages[28].resize(17, 27);
  noteImages[29].resize(17, 27);

  //Sharps
  noteImages[30].resize(17, 25);
  noteImages[31].resize(17, 25);

  noteImages[32].resize(80, 160);

  //Clefs
  noteImages[33].resize(65, 140);
  noteImages[34].resize(60, 96);

  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);

  //Simon Sakata | 3B
  modeButtons[0]=new Button(60, 120, 100, 100, 25, #7FA3E0, #5E86D8, "1", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, 25, #7FA3E0, #5E86D8, "2", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, 25, #7FA3E0, #5E86D8, "3", "Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, 25, #7FA3E0, #5E86D8, "4", "Metronome");
  clef=1;
  mouseClicked = false;

  //Aristotle Stokes
  metroButtons[0] = new Button(362, 350, 100, 100, 25, #7FA3E0, #5E86D8, "0", "+1");
  metroButtons[1] = new Button(362, 600, 100, 100, 25, #7FA3E0, #5E86D8, "0", "-1");
  metroButtons[2] = new Button(362, 475, 100, 75, 25, #767676, #767676, "0", "PLAY");
  metroVal = "100";

  //Mo Spiegel
  harmButtons[0] = new Button(170, 30, 60, 40, 25, #7FA3E0, #5E86D8, "1", "Quart");
  harmButtons[1] = new Button(245, 30, 60, 40, 25, #7FA3E0, #5E86D8, "2", "Eight");
  harmButtons[2] = new Button(320, 30, 60, 40, 25, #7FA3E0, #5E86D8, "3", "Sixt");
  harmButtons[3] = new Button(395, 30, 60, 40, 25, #7FA3E0, #5E86D8, "4", "Half");
  harmButtons[4] = new Button(470, 30, 60, 40, 25, #7FA3E0, #5E86D8, "5", "Whole");
  harmButtons[5] = new Button(545, 30, 60, 40, 25, #7FA3E0, #5E86D8, "6", "Rest");
  harmButtons[6] = new Button(358, 220, 135, 40, 25, #7FA3E0, #5E86D8, "7", "Clear" );
  harmButtons[7] = new Button(245, 220, 60, 40, 25, #7FA3E0, #5E86D8, "8", "#");
  harmButtons[8] = new Button(470, 220, 60, 40, 25, #7FA3E0, #5E86D8, "9", "b");
  harmButtons[9] = new Button(170, 260, 60, 120, 25, #7FA3E0, #5E86D8, "10", "Clef \n Tog");
  harmButtons[10] = new Button(545, 260, 60, 120, 25, #7FA3E0, #5E86D8, "11", "Del");
  harmButtons[11] = new Button(358, 300, 270, 90, 25, #7FA3E0, #5E86D8, "12", "Harmonize");

  pitchButtons[0] = new Button(200, 70, 100, 40, 25, #7FA3E0, #5E86D8, "31", "Unison");
  pitchButtons[1] = new Button(320, 140, 100, 40, 25, #7FA3E0, #5E86D8, "31.5", "Minor 2nd");
  pitchButtons[2] = new Button(200, 140, 100, 40, 25, #7FA3E0, #5E86D8, "32", "Major 2nd");
  pitchButtons[3] = new Button(320, 210, 100, 40, 25, #7FA3E0, #5E86D8, "32.5", "Minor 3rd");
  pitchButtons[4] = new Button(200, 210, 100, 40, 25, #7FA3E0, #5E86D8, "33", "Major 3rd");
  pitchButtons[5] = new Button(200, 280, 100, 40, 25, #7FA3E0, #5E86D8, "34", "Perfect 4th");
  pitchButtons[6] = new Button(320, 350, 100, 40, 25, #7FA3E0, #5E86D8, "34.5", "Tritone");
  pitchButtons[7] = new Button(200, 350, 100, 40, 25, #7FA3E0, #5E86D8, "35", "Perfect 5th");
  pitchButtons[8] = new Button(320, 420, 100, 40, 25, #7FA3E0, #5E86D8, "35.5", "Minor 6th");
  pitchButtons[9] = new Button(200, 420, 100, 40, 25, #7FA3E0, #5E86D8, "36", "Major 6th");
  pitchButtons[10] = new Button(320, 490, 100, 40, 25, #7FA3E0, #5E86D8, "36.5", "Minor 7th");
  pitchButtons[11] = new Button(200, 490, 100, 40, 25, #7FA3E0, #5E86D8, "37", "Major 7th");
  pitchButtons[12] = new Button(200, 560, 100, 40, 25, #7FA3E0, #5E86D8, "38", "Octave");
  pitchButtons[13] = new Button(200, 650, 80, 80, 25, #7FA3E0, #5E86D8, "39", "PLAY");

  tuneButtons[0]=new Button(180, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "A");
  tuneButtons[1]=new Button(300, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "A#/Bb");
  tuneButtons[2]=new Button(420, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "B/Cb");
  tuneButtons[3]=new Button(540, 300, 80, 80, 25, #7FA3E0, #5E86D8, "", "C/B#");
  tuneButtons[4]=new Button(180, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "C#/Db");
  tuneButtons[5]=new Button(300, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "D");
  tuneButtons[6]=new Button(420, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "D#/Eb");
  tuneButtons[7]=new Button(540, 420, 80, 80, 25, #7FA3E0, #5E86D8, "", "E/Fb");
  tuneButtons[8]=new Button(180, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "F/E#");
  tuneButtons[9]=new Button(300, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "F#/Gb");
  tuneButtons[10]=new Button(420, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "G");
  tuneButtons[11]=new Button(540, 540, 80, 80, 25, #7FA3E0, #5E86D8, "", "G#/Ab");
}

void keyPressed() {
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 3) {
    if (keyCode == 8 || keyCode == 127) {
      if (notes.size()-1 >= 0) {
        if (notes.get(notes.size()-1).inputted == true && ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x == 490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x == 535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x >= 550) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x == 400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220))) {
          notes.remove(notes.size()-1);
        } else if (notes.size()-1 != 0) {
          notes.remove(notes.size()-2);
          notes.remove(notes.size()-1);
        }
      }
    }
  }
}

void mouseReleased() {
  if (pitchButtons[13].hover(mouseX, mouseY)&& modeTog==1) {
    note1 = int(random(1, 14));
    note2 = note1 + int(random(0, 13));
    interval = note2-note1;
    println(interval);
  }
  if (pitchButtons[0].hover(mouseX, mouseY)&&modeTog==1) {
  }
  for (int i=0; i<modeButtons.length; i++) {
    if (modeButtons[i].hover(mouseX, mouseY)) {
      modeTog=int(modeButtons[i].val);
      firstSwitch=true;
    }
  }
  //Mo Spiegel 3B
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 3) {
    for (int i = 0; i < harmButtons.length; i++) {
      if (harmButtons[i].hover(mouseX, mouseY) == true) {
        if (harmButtons[i] == harmButtons[0]) {
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 1;
          }
        } else if (harmButtons[i] == harmButtons[1]) {
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 2;
          }
        } else if (harmButtons[i] == harmButtons[2]) {
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 3;
          }
        } else if (harmButtons[i] == harmButtons[3]) {
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 4;
          }
        } else if (harmButtons[i] == harmButtons[4]) {
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 5;
          }
        } else if (harmButtons[i] == harmButtons[5]) {
          if (notes.get(notes.size()-1).inputted == false && notes.get(notes.size()-1).restMode == false) {
            notes.get(notes.size()-1).restMode = true;
          } else if (notes.get(notes.size()-1).inputted == false && notes.get(notes.size()-1).restMode == true) {
            notes.get(notes.size()-1).restMode = false;
          }
        } else if (harmButtons[i] == harmButtons[6]) {
          notes.clear();
        } else if (harmButtons[i] == harmButtons[7]) {
          if (notes.get(notes.size()-1).sharp == false && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).flat = false;
            notes.get(notes.size()-1).sharp = true;
          } else if (notes.get(notes.size()-1).sharp == true && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).sharp = false;
          }
        } else if (harmButtons[i] == harmButtons[8]) {
          if (notes.get(notes.size()-1).flat == false && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).sharp = false;
            notes.get(notes.size()-1).flat = true;
          } else if (notes.get(notes.size()-1).flat == true && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).flat = false;
          }
        } else if (harmButtons[i] == harmButtons[9]) {
          if (clef == 1) {
            clef = 2;
          } else if (clef == 2) {
            clef = 1;
          }
        } else if (harmButtons[i] == harmButtons[10]) {
          if (notes.size()-1 >= 0) {
            if (notes.get(notes.size()-1).inputted == true && ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x == 490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x == 535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x >= 550) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x == 400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220))) {
              notes.remove(notes.size()-1);
            } else if (notes.size()-1 != 0) {
              notes.remove(notes.size()-2);
              notes.remove(notes.size()-1);
            }
          }
        } else if (harmButtons[i] == harmButtons[11]) {
          harmonize();
        }
      }
    }
    if (mouseX>= 40 && mouseX<=580 && mouseY>= 60 && mouseY<=180) {
      if ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x <=490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x <=535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x <=558) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x <=400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220)) {
        notes.get(notes.size()-1).mouseClick();
        notes.get(notes.size()-1).inputNote();
        notes.get(notes.size()-1).inputted = true;
      }
    }

    mouseClicked = false;
  }
}

void mousePressed() {
  // Kai Yun Chao | 3B
  for (int i = 0; i<tuneButtons.length; i++) {
    if (tuneButtons[i].over) {
      play(tuneButtons[i].disVal);
    }
  }
  for (int i = 0; i<tuneButtons.length; i++) {
    if (tuneButtons[i].hover(mouseX, mouseY)) {
      noteVal = tuneButtons[i].disVal;
    }
  }
}


void draw() {
  background(75);
  setGradient(0, 0, width/5, height, c1, c2, Y_AXIS);

  for (int i=0; i<modeButtons.length; i++) {
    modeButtons[i].display();
    modeButtons[i].hover(mouseX, mouseY);
  }
  switch(modeTog) {
  case 0:
    fill(230);
    textSize(60);
    text("MusikHelfer", width/2+60, 30);
    textSize(30);
    text("Use buttons on the side to navigate and switch functionality", width/2+60, 140, 450, 700);
    break;
  case 1:
    pitchMode();
    break;
  case 2:
    tunerMode();
    for (int i = 0; i<tuneButtons.length; i++) {
      tuneButtons[i].display();
      tuneButtons[i].hover(mouseX, mouseY);
    }
    break;
  case 3:
    harmMode();
    break;
  case 4:
    metroMode();
    break;
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {

  noFill();

  if (axis == Y_AXIS) { //Top to bottom gradient
    for (int i = y; i < y + h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x + w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i < x + w; i++) {
      float inter = map(i, x, x + w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y + h);
    }
  }
}

void display() {
  rectMode(CENTER);
  noStroke();
}

void tunerMode() {
  //Kai Yun Chao | 3B


  fill(#5E86D8);
  rect(360, 120, 440, 160, 25);
  rect(360,645, 440,70,25);

  fill(0);
  textSize(120);
  text(noteVal, 360, 110);
 strokeWeight(20);
  line(250,645,550,645);


  rectMode(CENTER);
  fill(#2B7FD6);
  //rect(370, 233);
  textAlign(CENTER, CENTER);
  textSize(65);
  
  

  tuneButtons[0].display();
  tuneButtons[1].display();
  tuneButtons[2].display();
  tuneButtons[3].display();
  tuneButtons[4].display();
  tuneButtons[5].display();
  tuneButtons[6].display();
  tuneButtons[7].display();
  tuneButtons[8].display();
  tuneButtons[9].display();
  tuneButtons[10].display();
  tuneButtons[11].display();

  //pitch[0] = new SoundFile(this, "C5.mp3");
  //pitch[1] = new SoundFile(this, "A5.mp3");
}

void pitchMode() {
  for (int i=0; i<pitchButtons.length; i++) {
    pitchButtons[i].display();
    pitchButtons[i].hover(mouseX, mouseY);
  }
}

void metroMode() {
  //+1 BPM Button
  metroButtons[0] = new Button(362, 350, 100, 100, 25, #7FA3E0, #5E86D8, "0", "+1");
  metroButtons[0].display();
  metroButtons[0].hover(mouseX, mouseY);
  //-1 BPM Button
  metroButtons[1] = new Button(362, 600, 100, 100, 25, #7FA3E0, #5E86D8, "0", "-1");
  metroButtons[1].display();
  metroButtons[1].hover(mouseX, mouseY);
  //Play Button
  metroButtons[2] = new Button(362, 475, 100, 75, 25, #767676, #767676, "0", "PLAY");
  metroButtons[2].display();
  metroButtons[2].hover(mouseX, mouseY);
  //Hover For Buttons
  for (int i = 0; i < metroButtons.length; i++) {
    metroButtons[i].hover(mouseX, mouseY);
    metroButtons[i].display();
  }

  //Metronome Display
  rectMode(CENTER);
  fill(200);
  rect(362, 150, 420, 225, 25);

  textAlign(CENTER, CENTER);
  fill(0);
  textSize(150);
  text(metroVal, 362, 125);
}

void harmMode() {
  //Mo Spiegel | 3B
  rectMode(CORNER);
  strokeWeight(1);
  fill(255);
  rect(140, 60, 440, 120, 25);
  stroke(0);
  for (int i = 80; i <= 160; i = i + 20) {
    line(140, i, 580, i);
  }
  if (notes.size() == 0) {
    notes.add(new Note(125, 0, 220, 2, false, false, false, false));
  }
  if ( notes.size()-1 != 0) {
    if (notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x + 90 <= 490 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 90, 1, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x + 90 <= 535 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 90, 2, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x + 90 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 90, 3, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x + 45 <= 535 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 45, 2, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x + 45 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 45, 3, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x + 22 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 22, 3, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 400 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 180, 4, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 490 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 180, 1, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 535 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 180, 2, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, notes.get(notes.size()-1).x + 180, 3, false, false, false, false));
    }
  } else if (notes.size()-1 == 0) {
    if (notes.get(0).noteTog == 1 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note (125, 0, 220+90, 1, false, false, false, false));
    } else if (notes.get(0).noteTog == 2 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note (125, 0, 220+45, 2, false, false, false, false));
    } else if (notes.get(0).noteTog == 3 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note (125, 0, 220 + 22, 3, false, false, false, false));
    } else if (notes.get(0).noteTog == 4 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(125, 0, 220 +180, 4, false, false, false, false));
    }
  }
  for (int i = 0; i < notes.size(); i++) {
    notes.get(i).hover();
    notes.get(i).inputNote();
  }
  for (int i = 0; i < harmButtons.length; i++) {
    harmButtons[i].display();
    harmButtons[i].hover(mouseX, mouseY);
  }
  if (clef == 1) {
    image(noteImages[33], 170, 125);
  } else if (clef == 2) {
    image(noteImages[34], 175, 115);
  }
}

void harmonize() {
  //Ethan Tang | 3B | 11/13/25
  inputScore=new StringList();
  keyConvert.clear();
  if (clef==1) {
    keyConvert.put(14, "D");
    keyConvert.put(13, "E");
    keyConvert.put(12, "F");
    keyConvert.put(11, "G");
    keyConvert.put(10, "A");
    keyConvert.put(9, "B");
    keyConvert.put(8, "C");
    keyConvert.put(7, "D");
    keyConvert.put(6, "E");
    keyConvert.put(5, "F");
    keyConvert.put(4, "G");
  }
  if (clef==2) {
    keyConvert.put(14, "F");
    keyConvert.put(13, "G");
    keyConvert.put(12, "A");
    keyConvert.put(11, "B");
    keyConvert.put(10, "C");
    keyConvert.put(9, "D");
    keyConvert.put(8, "E");
    keyConvert.put(7, "F");
    keyConvert.put(6, "G");
    keyConvert.put(5, "A");
    keyConvert.put(4, "B");
    keyConvert.put(0, "rest");
  }
  for (int i=0; i<notes.size(); i++) {
    inputScore.append(keyConvert.get(notes.get(i).yVal()));
  }
  println(inputScore);
}

void play(String noteVal) {
  // Kai Yun Chao | 3B
  if (noteVal.equals("A")) {
    pitchA4.playFor(2);
    println("playing");
    // delay.process("A4.mp3" );
    //delay.time(1.0);
  }
  if (noteVal.equals("A#/Bb")) {
    pitchAs4.playFor(2);
    println("playing");
    //n = str(n);
  }
  if (noteVal.equals("B/Cb")) {
    pitchB4.playFor(2);
    println("playing");
  }

  if (noteVal.equals("C/B#")) {
    pitchC4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("C#/Db")) {
    pitchCs4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("D")) {
    pitchD4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("D#/Eb")) {
    pitchDs4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("E/Fb")) {
    pitchE4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("F/E#")) {
    pitchF4.playFor(2);

    println("playing");
  }
  if (noteVal.equals("F#/Gb")) {
    pitchFs4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("G")) {
    pitchG4.playFor(2);
    println("playing");
  }
  if (noteVal.equals("G#/Ab")) {
    pitchGs4.playFor(2);
    println("playing");
  }
}
