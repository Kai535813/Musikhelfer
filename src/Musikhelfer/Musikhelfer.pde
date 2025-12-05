//Kai Yun Chao | 3B
import processing.sound.*;
SoundFile pitch, pitchA4, pitchAs4, pitchB4, pitchC4, pitchCs4, pitchD4, pitchDs4, pitchE4, pitchF4, pitchFs4, pitchG4, pitchGs4, pitchA5, pitchAs5, pitchB5, pitchC5, pitchCs5, pitchD5, pitchDs5, pitchE5, pitchF5, pitchFs5, pitchG5, pitchGs5;
SoundFile metroSound;
Delay delay;

//Ethan Tang | 3B | 11/4/25
import java.util.Map;
HashMap<Integer, String> keyConvert= new HashMap<Integer, String>();
HashMap<Integer, String> orderSharp= new HashMap<Integer, String>();
HashMap<Integer, String> orderFlat= new HashMap<Integer, String>();
HashMap<Integer, String> scaleDeg= new HashMap<Integer, String>();
HashMap<Integer, String> keySigConvert= new HashMap<Integer, String>();
HashMap<Integer, String> degKeys= new HashMap<Integer, String>();
HashMap<Integer, String> harmIndex= new HashMap<Integer, String>();
ArrayList<Note> notes = new ArrayList<Note>();
PImage[] noteImages = new PImage[45];
PFont font;
PImage[] musikHelferLogo = new PImage[1];
boolean mouseClicked, firstSwitch;
StringList inputScore;
StringList harmonizeRes;
StringList keySigS;
StringList keySigF;
IntList index;
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[12];
Button[] harmButtons=new Button[12];
Button[] metroButtons=new Button[3];
Button[] pitchButtons=new Button[14];
int modeTog, clef, degKey, harmKey;
char keySig;
String buttonVal, tuneNote, scoreNote, metroVal, noteVal, note;
Boolean first, added;
Boolean metroPlaying = false;
Boolean flashOn = false;
Boolean intervalActive = false;
int lastTick = 0;
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
//Simon Sakata
int interval, note1, note2;


void setup() {
  font = loadFont("GurmukhiMN-48.vlw");

  degKeys.put(1, "C");
  degKeys.put(2, "D");
  degKeys.put(3, "E");
  degKeys.put(4, "F");
  degKeys.put(5, "G");
  degKeys.put(6, "A");
  degKeys.put(7, "B");
  degKeys.put(8, "C");
  degKeys.put(9, "D");
  degKeys.put(10, "E");
  degKeys.put(11, "F");
  degKeys.put(12, "G");
  degKeys.put(13, "A");
  degKeys.put(14, "B");
  degKeys.put(15, "C");
  degKeys.put(16, "D");
  degKeys.put(17, "E");
  degKeys.put(18, "F");
  keySigConvert.put(0, "C");
  keySigConvert.put(1, "G");
  keySigConvert.put(2, "D");
  keySigConvert.put(3, "A");
  keySigConvert.put(4, "E");
  keySigConvert.put(5, "B");
  keySigConvert.put(6, "F");
  keySigConvert.put(7, "C");
  keySigConvert.put(8, "F");
  keySigConvert.put(9, "B");
  keySigConvert.put(10, "E");
  keySigConvert.put(11, "A");
  keySigConvert.put(12, "D");
  keySigConvert.put(13, "G");
  keySigConvert.put(14, "C");
  orderSharp.put(1, "F#");
  orderSharp.put(2, "C#");
  orderSharp.put(3, "G#");
  orderSharp.put(4, "D#");
  orderSharp.put(5, "A#");
  orderSharp.put(6, "E#");
  orderSharp.put(7, "B#");
  orderFlat.put(1, "Bb");
  orderFlat.put(2, "Eb");
  orderFlat.put(3, "Ab");
  orderFlat.put(4, "Db");
  orderFlat.put(5, "Gb");
  orderFlat.put(6, "Cb");
  orderFlat.put(7, "Fb");
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

  delay = new Delay(this);
  //delay.process("A4.mp3" );
  //delay.time(1.0);

  //Logo
  musikHelferLogo[0] = loadImage("Musik Helfer Logo.png");

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

  //Labels
  noteImages[35] = loadImage("Quarter Note (LABEL).png");
  noteImages[36] = loadImage("Eight Note (LABEL).png");
  noteImages[37] = loadImage("Sixteenth Note (LABEL).png");
  noteImages[38] = loadImage("Half Note (LABEL).png");
  noteImages[39] = loadImage("Whole Note (LABEL).png");
  noteImages[40] = loadImage("Flat (LABEL).png");
  noteImages[41] = loadImage("Sharp (LABEL).png");
  noteImages[42] = loadImage("rTreble Clef (LABEL).png");
  noteImages[43] = loadImage("rBass Clef (LABEL).png");
  noteImages[44] = loadImage("Rest (LABEL).png");

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

  //Labels
  noteImages[35].resize(40, 60); //Quarter
  noteImages[36].resize(40, 60); //Eight
  noteImages[37].resize(40, 60); //Sixteenth
  noteImages[38].resize(40, 60); //Half
  noteImages[39].resize(25, 25); //Whole
  noteImages[40].resize(25, 40); //Flat
  noteImages[41].resize(30, 40); //Sharp
  noteImages[32].resize(80, 160); //Play
  noteImages[42].resize(50, 110); //Treble
  noteImages[43].resize(50, 70); //Bass
  noteImages[44].resize(40, 60); //Rest

  //Logo
  musikHelferLogo[0].resize(500, 280);

  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);

  //Simon Sakata | 3B
  modeButtons[0]=new Button(60, 120, 100, 100, 25, 20, #7FA3E0, #5E86D8, #3348F2, "1", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, 25, 25, #7FA3E0, #5E86D8, #3348F2, "2", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, 25, 16, #7FA3E0, #5E86D8, #3348F2, "3", "Auto \n Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, 25, 16, #7FA3E0, #5E86D8, #3348F2, "4", "Metronome");
  mouseClicked = false;

  //Aristotle Stokes
  metroButtons[0] = new Button(362, 350, 100, 100, 25, 20, #7FA3E0, #5E86D8, #3348F2, "0", "+");
  metroButtons[1] = new Button(362, 600, 100, 100, 25, 20, #7FA3E0, #5E86D8, #3348F2, "0", "-");
  metroButtons[2] = new Button(362, 475, 100, 75, 25, 20, #D3D3D3, #767676, #3348F2, "0", "PLAY");
  metroVal = "100";
  metroSound = new SoundFile(this, "Metronome Sound.mp3");

  //Mo Spiegel
  harmButtons[0] = new Button(170, 40, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "1", "");
  harmButtons[1] = new Button(245, 40, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "2", "");
  harmButtons[2] = new Button(320, 40, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "3", "");
  harmButtons[3] = new Button(395, 40, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "4", "");
  harmButtons[4] = new Button(470, 40, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "5", "");
  harmButtons[5] = new Button(545, 40, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "6", "");
  harmButtons[6] = new Button(358, 260, 135, 60, 25, 25, #7FA3E0, #5E86D8, #3348F2, "7", "Clear" );
  harmButtons[7] = new Button(245, 260, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "8", "");
  harmButtons[8] = new Button(470, 260, 60, 60, 25, 20, #7FA3E0, #5E86D8, #3348F2, "9", "");
  harmButtons[9] = new Button(170, 290, 60, 120, 25, 20, #7FA3E0, #5E86D8, #3348F2, "10", "");
  harmButtons[10] = new Button(545, 290, 60, 120, 25, 25, #7FA3E0, #5E86D8, #3348F2, "11", "Del");
  harmButtons[11] = new Button(358, 350, 270, 90, 25, 30, #7FA3E0, #5E86D8, #3348F2, "12", "Harmonize");

  pitchButtons[0] = new Button(200, 70, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "31", "Unison");
  pitchButtons[1] = new Button(320, 140, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "31.5", "Minor 2nd");
  pitchButtons[2] = new Button(200, 140, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "32", "Major 2nd");
  pitchButtons[3] = new Button(320, 210, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "32.5", "Minor 3rd");
  pitchButtons[4] = new Button(200, 210, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "33", "Major 3rd");
  pitchButtons[5] = new Button(200, 280, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "34", "Perfect 4th");
  pitchButtons[6] = new Button(320, 350, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "34.5", "Tritone");
  pitchButtons[7] = new Button(200, 350, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "35", "Perfect 5th");
  pitchButtons[8] = new Button(320, 420, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "35.5", "Minor 6th");
  pitchButtons[9] = new Button(200, 420, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "36", "Major 6th");
  pitchButtons[10] = new Button(320, 490, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "36.5", "Minor 7th");
  pitchButtons[11] = new Button(200, 490, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "37", "Major 7th");
  pitchButtons[12] = new Button(200, 560, 100, 40, 25, 20, #7FA3E0, #5E86D8, #3348F2, "38", "Octave");
  pitchButtons[13] = new Button(200, 650, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "39", "PLAY");

  tuneButtons[0]=new Button(180, 300, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "A");
  tuneButtons[1]=new Button(300, 300, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "A#/Bb");
  tuneButtons[2]=new Button(420, 300, 80, 80, 25, 20, #7FA3E0,#5E86D8, #3348F2, "", "B/Cb");
  tuneButtons[3]=new Button(540, 300, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "C/B#");
  tuneButtons[4]=new Button(180, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "C#/Db");
  tuneButtons[5]=new Button(300, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "D");
  tuneButtons[6]=new Button(420, 420, 80, 80, 25, 20, #7FA3E0,#5E86D8, #3348F2, "", "D#/Eb");
  tuneButtons[7]=new Button(540, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "E/Fb");
  tuneButtons[8]=new Button(180, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "F/E#");
  tuneButtons[9]=new Button(300, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "F#/Gb");
  tuneButtons[10]=new Button(420, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "G");
  tuneButtons[11]=new Button(540, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "G#/Ab");
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
    } else if (keyCode == 32) {
      harmonize();
    }
  }
}

void mouseReleased() {
  //Simon Sakata
  if (pitchButtons[13].hover(mouseX, mouseY)) {
    if (!intervalActive) {
      note1 = int(random(1, 13));
      note2 = note1 + int(random(0, 13));
      interval = note2-note1;
      println("interval:" + interval);
      println("note1:" + note1);
      println("note2:" + note2);

      intervalActive = true;
    }
    playNoteNumber(note1);
    delay(800);
    playNoteNumber(note2);
  }
  for (int i = 0; i < 13; i++) {
    if (pitchButtons[i].hover(mouseX, mouseY)) {
      if (intervalActive) {
        int guessedInterval = i;

        if (guessedInterval == interval) {
          println("Correct interval");
          intervalActive = false;
        } else {
          println("wrong");
        }
      }
    }
  }
  if (pitchButtons[0].hover(mouseX, mouseY)) {
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
    if (mouseX>= 40 && mouseX<=580 && mouseY>= 80 && mouseY<=200) {
      if ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x <=490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x <=535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x <=558) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x <=400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220)) {
        notes.get(notes.size()-1).mouseClick();
        notes.get(notes.size()-1).inputNote();
        notes.get(notes.size()-1).inputted = true;
      }
    }

    mouseClicked = false;
  }
  //Metronome Buttons
  if (modeTog == 4) {
    //+1 BPM
    if (metroButtons[0].hover(mouseX, mouseY)) {
      int v = int(metroVal);
      v = v + 4;
      metroVal = str(v);
    }
    //-1 BPM
    if (metroButtons[1].hover(mouseX, mouseY)) {
      int v = int(metroVal);
      v = v -4;
      metroVal=str(v);
    }
    //PLAY
    if (metroButtons[2].hover(mouseX, mouseY)) {
      metroPlaying = !metroPlaying;
      flashOn = false;
      lastTick = millis();
    }
  }
}

void playNoteNumber(int n) {
 if (n == 1)       pitchA4.play();
  else if (n == 2)  pitchAs4.play();
  else if (n == 3)  pitchB4.play();
  else if (n == 4)  pitchC4.play();
  else if (n == 5)  pitchCs4.play();
  else if (n == 6)  pitchD4.play();
  else if (n == 7)  pitchDs4.play();
  else if (n == 8)  pitchE4.play();
  else if (n == 9)  pitchF4.play();
  else if (n == 10) pitchFs4.play();
  else if (n == 11) pitchG4.play();
  else if (n == 12) pitchGs4.play();
  else if (n == 13)  pitchA5.play();
  else if (n == 14)  pitchAs5.play();
  else if (n == 15)  pitchB5.play();
  else if (n == 16)  pitchC5.play();
  else if (n == 17)  pitchCs5.play();
  else if (n == 18)  pitchD5.play();
  else if (n == 19)  pitchDs5.play();
  else if (n == 20)  pitchE5.play();
  else if (n == 21)  pitchF5.play();
  else if (n == 22) pitchFs5.play();
  else if (n == 23) pitchG5.play();
  else if (n == 24) pitchGs5.play();
}
void mousePressed() {

  //Kai Yun Chao | 3B
  for (int i = 0; i<tuneButtons.length; i++) {
    if (tuneButtons[i].over) {
      play(tuneButtons[i].disVal);
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
    image(musikHelferLogo[0], 125, 210);
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
    
  fill(0);
  textSize(120);
   //text(noteVal,360,100);
   
   
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
  //Button Funtionality
  for (int i = 0; i < metroButtons.length; i++) {
    metroButtons[i].hover(mouseX, mouseY);
    metroButtons[i].display();
  }

  //Metronome Display
  rectMode(CENTER);

  // Flash white on beat
  if (flashOn) fill(240, 240, 255);
  else fill(200);

  rect(362, 150, 420, 225, 25);

  textAlign(CENTER, CENTER);
  fill(0);
  textSize(150);
  text(metroVal, 362, 125);


  if (metroPlaying) {
    float interval = 60000 / int(metroVal);
    if (millis() - lastTick >= interval) {
      flashOn = true;
      lastTick = millis();
      metroSound.play();
    }
    if (millis() - lastTick> 100) {
      flashOn = false;
    }
  }
}

void harmMode() {
  //Mo Spiegel | 3B

  //Draw scores
  rectMode(CORNER);
  noStroke();
  fill(60);
  rect(135, 97, 444, 120, 25);
  rect(355, 452, 224, 160, 25);
  rect(135, 452, 204, 160, 25);
  fill(255);
  rect(140, 90, 440, 120, 25);
  rect(360, 445, 220, 160, 25);
  fill(50);
  rect(140, 445, 200, 160, 25);
  strokeWeight(1);
  stroke(0);
  for (int i = 485; i <= 565; i = i + 20) {
    line(360, i, 580, i);
  }
  for (int i = 110; i <= 190; i = i + 20) {
    line(140, i, 580, i);
  }

  //Logic for note adding
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

  //Call note methods
  for (int i = 0; i < notes.size(); i++) {
    notes.get(i).hover();
    if (notes.get(i).inputted == true) {
      notes.get(i).inputNote();
    }
  }

  //Call harmonizer button methods
  for (int i = 0; i < harmButtons.length; i++) {
    harmButtons[i].display();
    harmButtons[i].hover(mouseX, mouseY);
  }

  //Display clefs
  if (clef == 1) {
    image(noteImages[33], 170, 155);
  } else if (clef == 2) {
    image(noteImages[34], 175, 145);
  }

  //Display button labels
  image(noteImages[35], 170, 40);
  image(noteImages[36], 245, 40);
  image(noteImages[37], 320, 40);
  image(noteImages[38], 395, 40);
  image(noteImages[39], 470, 40);
  image(noteImages[44], 548, 40);
  image(noteImages[41], 245, 260);
  image(noteImages[40], 468, 260);

  if (clef == 1) {
    image(noteImages[43], 170, 290);
  } else if (clef == 2) {
    image(noteImages[42], 168, 290);
  }
}

void harmonize() {
  //Ethan Tang | 3B | 11/13/25
  //Clear and reset everything
  inputScore=new StringList();
  keySigF=new StringList();
  keySigS=new StringList();
  harmonizeRes=new StringList();
  index=new IntList();
  first=true;
  keyConvert.clear();
  harmIndex.clear();
  scaleDeg.clear();
  //Change hashmap based on clef selected
  if (clef==1) {
    keyConvert.put(14, "E");
    keyConvert.put(13, "F");
    keyConvert.put(12, "G");
    keyConvert.put(11, "A");
    keyConvert.put(10, "B");
    keyConvert.put(9, "C");
    keyConvert.put(8, "D");
    keyConvert.put(7, "E");
    keyConvert.put(6, "F");
    keyConvert.put(5, "G");
    keyConvert.put(4, "A");
    keyConvert.put(0, "rest");
  }
  if (clef==2) {
    keyConvert.put(14, "G");
    keyConvert.put(13, "A");
    keyConvert.put(12, "B");
    keyConvert.put(11, "C");
    keyConvert.put(10, "D");
    keyConvert.put(9, "E");
    keyConvert.put(8, "F");
    keyConvert.put(7, "G");
    keyConvert.put(6, "A");
    keyConvert.put(5, "B");
    keyConvert.put(4, "C");
    keyConvert.put(0, "rest");
  }
  //Read all notes imputed on score
  for (int i=0; i<notes.size(); i++) {
    if (notes.get(i).yVal()!=0) {
      if (notes.get(i).sharp) {
        inputScore.append(keyConvert.get(notes.get(i).yVal())+"#");
      } else if (notes.get(i).flat) {
        inputScore.append(keyConvert.get(notes.get(i).yVal())+"b");
      } else {
        inputScore.append(keyConvert.get(notes.get(i).yVal()));
      }
    }
  }
  println(inputScore);
  //determine key signiture
  for (int i=1; i<8; i++) {
    if (inputScore.hasValue(orderSharp.get(i))) {
      keySigS.append(orderSharp.get(i));
    } else {
      keySigS.append(keySigConvert.get(i-1));
      i=9;
    }
  }
  for (int i=1; i<8; i++) {
    if (inputScore.hasValue(orderFlat.get(i))) {
      keySigF.append(orderFlat.get(i));
    } else {
      keySigF.append(keySigConvert.get(i-1+7));
      i=9;
    }
  }
  //prefer the longest key signiture, and if the key signitures are the same size, prefer the one with sharps
  if (keySigF.size()>keySigS.size()) {
    keySig='F';
  } else {
    keySig='S';
  }
  println(keySigF);
  println(keySigS);
  println(keySig);
  //determine the tonic of the scale degrees, expressed as the index for that note of degKeys
  for (int i=1; i<8; i++) {
    if (keySig=='S') {
      if (degKeys.get(i).equals(keySigS.get(keySigS.size()-1))) {
        degKey=i;
        i=9;
      }
    } else if (keySig=='F') {
      if (degKeys.get(i).equals(keySigF.get(keySigF.size()-1))) {
        degKey=i;
        i=9;
      }
    }
  }
  //Create a list for the scale degree where the tonic is at index 0
  for (int i=1; i<12; i++) {
    scaleDeg.put(i, degKeys.get(degKey+i-1));
  }
  println(scaleDeg);
  //measure the exact amount of each note using an int list and hash map with cooresponding indices, int list represents total number, the hashmap represents the note
  for (int i=0; i<inputScore.size(); i++) {
    added=false;
    if (!first) {
      //checks whether current note is already recorded
      for (int i2=0; i2<index.size(); i2++) {
        if (inputScore.get(i).equals(harmIndex.get(i2))) {
          index.add(i2, 1);
          added=true;
          break;
        }
      }
      //if not, then a new entry is created for a new note
      if (!added) {
        harmIndex.put(index.size(), str( inputScore.get(i).charAt(0)));
        index.append(1);
      }
      //first is used to prevent null pointer exception
    } else if (first) {
      harmIndex.put(index.size(), str(inputScore.get(i).charAt(0)));
      index.append(1);
      harmIndex.put(0, inputScore.get(i));
      first=false;
    }
  }
  println(harmIndex);
  println(index);
  //the note that appears the most becomes the root of the harmonizing chord and the index we have is converted to an index that works for scaleDeg
  for (int i=0; i<index.size(); i++) {
    if (index.get(i)==index.max()) {
      for (int i2=1; i2<scaleDeg.size(); i2++) {
        if (scaleDeg.get(i2).equals(harmIndex.get(i))) {
          harmKey=i2;
          break;
        }
      }
      //the chord is then built by combining the root and two notes of every other note
      println(harmKey);
      harmonizeRes.append(scaleDeg.get(harmKey));
      harmonizeRes.append(scaleDeg.get(harmKey+2));
      harmonizeRes.append(scaleDeg.get(harmKey+4));
      //for the V chord, V7 is used, so an extra note must be added
      if (harmIndex.get(i).equals(scaleDeg.get(5))) {
        harmonizeRes.append(scaleDeg.get(harmKey+6));
      }
      break;
    }
  }
  println(harmonizeRes);
  //adjust for sharps in the chord based on keysignature 
  if (keySig=='S') {
    for (int i=0; i<keySigS.size()-1; i++) {
      if (harmonizeRes.hasValue(str(keySigS.get(i).charAt(1)))) {
        for (int i2=0; i2<harmonizeRes.size(); i2++) {
          if (harmonizeRes.get(i2).equals((str(keySigS.get(i).charAt(1))))) {
            harmonizeRes.set(i2, harmonizeRes.get(i2)+"#");
            i2=harmonizeRes.size()+1;
          }
        }
      }
    }
    //adjust for flats in the chord based on key signature 
  } else if (keySig=='F') {
    for (int i=0; i<keySigF.size()-1; i++) {
      if (harmonizeRes.hasValue(str(keySigF.get(i).charAt(1)))) {
        for (int i2=0; i2<harmonizeRes.size(); i2++) {
          if (harmonizeRes.get(i2).equals((str(keySigF.get(i).charAt(1))))) {
            harmonizeRes.set(i2, harmonizeRes.get(i2)+"b");
            i2=harmonizeRes.size()+1;
          }
        }
      }
    }
  }
}

//Ethan Tang and Kai Yun Chao | 3B
void play(String noteVal) {
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
    
    println("note:" + note);
    //note = str(n);
  }
