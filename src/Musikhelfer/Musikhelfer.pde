//Kai Yun Chao | 3B
import processing.sound.*;

//Sounds
SoundFile pitch, pitchA4, pitchAs4, pitchB4, pitchC4, pitchCs4, pitchD4, pitchDs4, pitchE4, pitchF4, pitchFs4, pitchG4, pitchGs4, pitchA5, pitchAs5, pitchB5, pitchC5, pitchCs5, pitchD5, pitchDs5, pitchE5, pitchF5, pitchFs5, pitchG5, pitchGs5, pitchC3, pitchCs3, pitchD3, pitchDs3, pitchE3, pitchF3, pitchFs3, pitchG3, pitchGs3, pitchA3, pitchAs3, pitchB3, pitchE2, pitchF2, pitchFs2, pitchG2, pitchGs2, pitchA2, pitchAs2, pitchB2;

//Duplicate sounds used for playing the harmonized chord and inputted notes simeltaneously for the auto-harmonizer tool, prevents cuttoff of harmonized chord sound
SoundFile pitchA42, pitchAs42, pitchB42, pitchF42, pitchFs42, pitchG42, pitchGs42, pitchC52, pitchCs52, pitchD52, pitchDs52, pitchE52, pitchF52, pitchE42;

SoundFile metroSound;

Delay delay;

//Ethan Tang | 3B | 11/4/25
import java.util.Map;

//Images and fonts
PImage[] noteImages = new PImage[45];
PImage[] musikHelferLogo = new PImage[1];
PFont font;

HashMap<Integer, String> keyConvert= new HashMap<Integer, String>();
HashMap<Integer, String> orderSharp= new HashMap<Integer, String>();
HashMap<Integer, String> orderFlat= new HashMap<Integer, String>();
HashMap<Integer, String> scaleDeg= new HashMap<Integer, String>();
HashMap<Integer, String> keySigConvert= new HashMap<Integer, String>();
HashMap<Integer, String> degKeys= new HashMap<Integer, String>();
HashMap<Integer, String> harmIndex= new HashMap<Integer, String>();

//Note array list
ArrayList<Note> notes = new ArrayList<Note>();

StringList inputScore;
StringList harmonizeRes;
StringList keySigS;
StringList keySigF;
IntList index;

//Button arrays for each screen
Button[] modeButtons=new Button[4];
Button[] tuneButtons=new Button[12];
Button[] harmButtons=new Button[13];
Button[] metroButtons=new Button[3];
Button[] pitchButtons=new Button[14];

int modeTog; //Tracks current screen/mode
int degKey, harmKey;
int lastTick = 0;
int Y_AXIS = 1;
int X_AXIS = 2;
int interval, note1, note2;

char keySig;

String buttonVal, tuneNote, scoreNote, metroVal, noteVal, note;

Boolean first, added;
Boolean metroPlaying = false;
Boolean flashOn = false;
Boolean intervalActive = false;
boolean firstSwitch;
boolean clef; //Tracks the clef: true = treble clef, false = bass clef

color c1, c2;


void setup() {

  font = loadFont("GurmukhiMN-48.vlw");
  clef = true;
  size(600, 700);
  c1 = color(#5E86D8);
  c2 = color(#6C6C6C);
  harmonizeRes=new StringList();

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
  pitchC3 = new SoundFile(this, "C3.mp3");
  pitchCs3 = new SoundFile(this, "Cs3.mp3");
  pitchD3 = new SoundFile(this, "D3.mp3");
  pitchDs3 = new SoundFile(this, "Ds3.mp3");
  pitchE3 = new SoundFile(this, "E3.mp3");
  pitchF3 = new SoundFile(this, "F3.mp3");
  pitchFs3 = new SoundFile(this, "Fs3.mp3");
  pitchG3 = new SoundFile(this, "G3.mp3");
  pitchGs3 = new SoundFile(this, "Gs3.mp3");
  pitchA3 = new SoundFile(this, "A3.mp3");
  pitchAs3 = new SoundFile(this, "As3.mp3");
  pitchB3 = new SoundFile(this, "B3.mp3");
  pitchE2 = new SoundFile(this, "E2.mp3");
  pitchF2 = new SoundFile(this, "F2.mp3");
  pitchFs2 = new SoundFile(this, "Fs2.mp3");
  pitchG2 = new SoundFile(this, "G2.mp3");
  pitchGs2 = new SoundFile(this, "Gs2.mp3");
  pitchA2 = new SoundFile(this, "A2.mp3");
  pitchAs2 = new SoundFile(this, "As2.mp3");
  pitchB2 = new SoundFile(this, "B2.mp3");
  
  //Duplicate sounds for chord
  pitchA42 = new SoundFile(this, "A4.mp3");
  pitchAs42 = new SoundFile(this, "A#4.mp3");
  pitchB42 = new SoundFile(this, "B4.mp3");
  pitchE42 = new SoundFile(this, "E4.mp3");
  pitchF42 = new SoundFile(this, "F4.mp3");
  pitchFs42 = new SoundFile(this, "F#4.mp3");
  pitchG42 = new SoundFile(this, "G4.mp3");
  pitchGs42 = new SoundFile(this, "G#4.mp3");
  pitchC52 = new SoundFile(this, "C5.mp3");
  pitchCs52 = new SoundFile(this, "Cs5.mp3");
  pitchD52 = new SoundFile(this, "D5.mp3");
  pitchDs52 = new SoundFile(this, "Ds5.mp3");
  pitchE52 = new SoundFile(this, "E5.mp3");
  pitchF52 = new SoundFile(this, "F5.mp3");


  delay = new Delay(this);
  //delay.process("A4.mp3" );
  //delay.time(1.0);

  //Images

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
  noteImages[18].resize(30, 70);
  noteImages[19].resize(30, 70);
  noteImages[20].resize(19, 30);
  noteImages[21].resize(19, 30);
  noteImages[22].resize(20, 45);
  noteImages[23].resize(20, 45);
  noteImages[24].resize(48, 90);
  noteImages[25].resize(48, 90);
  noteImages[26].resize(48, 90);
  noteImages[27].resize(48, 90);
  noteImages[28].resize(17, 27);
  noteImages[29].resize(17, 27);
  noteImages[30].resize(17, 25);
  noteImages[31].resize(17, 25);
  noteImages[32].resize(80, 160);
  noteImages[33].resize(65, 140);
  noteImages[34].resize(60, 96);
  noteImages[35].resize(40, 60);
  noteImages[36].resize(40, 60);
  noteImages[37].resize(40, 60);
  noteImages[38].resize(40, 60);
  noteImages[39].resize(25, 25);
  noteImages[40].resize(25, 40);
  noteImages[41].resize(30, 40);
  noteImages[32].resize(80, 160);
  noteImages[42].resize(50, 110);
  noteImages[43].resize(50, 70);
  noteImages[44].resize(40, 60);
  musikHelferLogo[0].resize(500, 280);

  //Buttons

  //Simon Sakata | 3B
  modeButtons[0]=new Button(60, 120, 100, 100, 25, 20, #7FA3E0, #5E86D8, #3348F2, "1", "Pitch Ear Training");
  modeButtons[1]=new Button(60, 270, 100, 100, 25, 25, #7FA3E0, #5E86D8, #3348F2, "2", "Tuner");
  modeButtons[2]=new Button(60, 420, 100, 100, 25, 16, #7FA3E0, #5E86D8, #3348F2, "3", "Auto \n Harmonizer");
  modeButtons[3]=new Button(60, 570, 100, 100, 25, 16, #7FA3E0, #5E86D8, #3348F2, "4", "Metronome");

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
  harmButtons[12] = new Button(240, 495, 160, 100, 25, 30, #7FA3E0, #5E86D8, #3348F2, "13", "Play");

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
  tuneButtons[2]=new Button(420, 300, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "B/Cb");
  tuneButtons[3]=new Button(540, 300, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "C/B#");
  tuneButtons[4]=new Button(180, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "C#/Db");
  tuneButtons[5]=new Button(300, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "D");
  tuneButtons[6]=new Button(420, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "D#/Eb");
  tuneButtons[7]=new Button(540, 420, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "E/Fb");
  tuneButtons[8]=new Button(180, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "F/E#");
  tuneButtons[9]=new Button(300, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "F#/Gb");
  tuneButtons[10]=new Button(420, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "G");
  tuneButtons[11]=new Button(540, 540, 80, 80, 25, 20, #7FA3E0, #5E86D8, #3348F2, "", "G#/Ab");
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

//Mo Spiegel
void keyPressed() {
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 3) {
    if (keyCode == 8 || keyCode == 127) { //Backspace functionality
      if (notes.size()-1 >= 0) {
        //Removes only the last note if the entire score is filled (therefore causing another note to be added which is just a hovering version of the last note)
        if (notes.get(notes.size()-1).inputted == true && ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x == 490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x == 535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x >= 550) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x == 400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220))) {
          notes.remove(notes.size()-1);
        } else if (notes.size()-1 != 0) { //Removes the two last notes if the score is not filled, therefore causing the note before the currently hovering one to be removed and become hovering
          notes.remove(notes.size()-2);
          notes.remove(notes.size()-1);
        }
      }
    } else if (keyCode == 32) { //Hotkeys harmonize to the space bar
      harmonize();
    }
  }
}

void mouseReleased() {

  //Simon Sakata

  //Screen switch button functionality
  for (int i=0; i<modeButtons.length; i++) {
    if (modeButtons[i].hover(mouseX, mouseY)) {
      modeTog=int(modeButtons[i].val);
      firstSwitch=true;
    }
  }

  //Ear training button functionality
  if (modeTog==1&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 1) {
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
  }

  //Mo Spiegel 3B

  //Harmonizer button functionality
  if (modeTog==3&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 3) {
    for (int i = 0; i < harmButtons.length; i++) {
      if (harmButtons[i].hover(mouseX, mouseY) == true) {
        if (harmButtons[i] == harmButtons[0]) { //Changes current note to quarter
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 1;
          }
        } else if (harmButtons[i] == harmButtons[1]) { //Changes current note to eighth
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 2;
          }
        } else if (harmButtons[i] == harmButtons[2]) { //Changes current note to sixteenth
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 3;
          }
        } else if (harmButtons[i] == harmButtons[3]) { //Changes current note to half
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 4;
          }
        } else if (harmButtons[i] == harmButtons[4]) { //Changes current note to whole
          if (notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).noteTog = 5;
          }
        } else if (harmButtons[i] == harmButtons[5]) { //Toggles between rests
          if (notes.get(notes.size()-1).inputted == false && notes.get(notes.size()-1).restMode == false) {
            notes.get(notes.size()-1).restMode = true;
          } else if (notes.get(notes.size()-1).inputted == false && notes.get(notes.size()-1).restMode == true) {
            notes.get(notes.size()-1).restMode = false;
          }
        } else if (harmButtons[i] == harmButtons[6]) { //Clears score and harmonizer result
          notes.clear();
          harmonizeRes.clear();
        } else if (harmButtons[i] == harmButtons[7]) { //Toggles between sharping the current note
          if (notes.get(notes.size()-1).sharp == false && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).flat = false;
            notes.get(notes.size()-1).sharp = true;
          } else if (notes.get(notes.size()-1).sharp == true && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).sharp = false;
          }
        } else if (harmButtons[i] == harmButtons[8]) { //Toggles between flatting the current note
          if (notes.get(notes.size()-1).flat == false && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).sharp = false;
            notes.get(notes.size()-1).flat = true;
          } else if (notes.get(notes.size()-1).flat == true && notes.get(notes.size()-1).restMode == false && notes.get(notes.size()-1).inputted == false) {
            notes.get(notes.size()-1).flat = false;
          }
        } else if (harmButtons[i] == harmButtons[9]) { //Toggles between clefs
          if (clef == true) {
            clef = false;
          } else if (clef == false) {
            clef = true;
          }
        } else if (harmButtons[i] == harmButtons[10]) {
          if (notes.size()-1 >= 0) {
            //Removes only the last note if the entire score is filled (therefore causing another note to be added which is just a hovering version of the last note)
            if (notes.get(notes.size()-1).inputted == true && ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x == 490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x == 535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x >= 550) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x == 400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220))) {
              notes.remove(notes.size()-1);
            } else if (notes.size()-1 != 0) { //Removes the two last notes if the score is not filled, therefore causing the note before the currently hovering one to be removed and become hovering
              notes.remove(notes.size()-2);
              notes.remove(notes.size()-1);
            }
          }
        } else if (harmButtons[i] == harmButtons[11]) { //Harmonizes the notes
          harmonize();
        } else if (harmButtons[i] == harmButtons[12]) { //Plays the notes
          harmPlay();
        }
      }
    }

    //Note inputting on score
    if (mouseX>= 40 && mouseX<=580 && mouseY>= 95 && mouseY<=205) { //Score hitbox

      //Checks to see if there is enough room in the score to input the selected note value
      if ((notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x <=490) || (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x <=535) || (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x <=558) || (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x <=400) || (notes.get(notes.size()-1).noteTog == 5 && notes.get(notes.size()-1).x == 220)) {
        notes.get(notes.size()-1).inputNote();
        notes.get(notes.size()-1).inputted = true;
      }
    }
  }

  //Aristotle Stokes

  //Metronome button functionality
  if (modeTog==4&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 4) {
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

  //Kai Yun Chao | 3B\

  //Tuner button functionality
  if (modeTog==2&&firstSwitch==true) {
    firstSwitch=false;
  } else if (firstSwitch == false && modeTog == 2) {
    for (int i = 0; i<tuneButtons.length; i++) {
      if (tuneButtons[i].over) {
        play(tuneButtons[i].disVal);
      }
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

//Kai Yun Chao
void tunerMode() {

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

  for (int i = 0; i < tuneButtons.length; i++) {
    tuneButtons[i].display();
  }

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

//Mo Spiegel
void harmMode() {
  rectMode(CORNER);
  noStroke();

  //Drop shadows
  fill(60);
  rect(135, 97, 444, 120, 25);
  rect(355, 452, 224, 160, 25);
  rect(157, 564, 160, 100, 25);

  //Draw scores
  fill(255);
  rect(140, 90, 440, 120, 25);
  rect(360, 445, 220, 160, 25);

  //Draw chord output box
  fill(50);
  rect(160, 560, 160, 100, 25);
  fill(255);
  textMode(CENTER);
  textSize(20);
  text("Chord:", 240, 590);
  textSize(30);
  if (harmonizeRes.size()>3) {
    text(harmonizeRes.get(0) +  ", " + harmonizeRes.get(1) + ", " + harmonizeRes.get(2) + ", " + harmonizeRes.get(3), 240, 620);
  } else if (harmonizeRes.size()> 0) {
    text(harmonizeRes.get(0) +  ", " + harmonizeRes.get(1) + ", " + harmonizeRes.get(2), 240, 620);
  }

  //Draw score lines
  strokeWeight(1);
  stroke(0);
  for (int i = 485; i <= 565; i = i + 20) {
    line(360, i, 580, i);
  }
  for (int i = 110; i <= 190; i = i + 20) {
    line(140, i, 580, i);
  }

  //Logic for note adding
  if (notes.size() == 0) { //Adds first note, hovering
    notes.add(new Note(220, 2, false, false, false, false));
  }
  if ( notes.size()-1 != 0) {
    //Checks for threshold at which quarter notes can't fit in the score, adds quarter notes once a note is inputted prior to this; same principle with rest of lines
    if (notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x + 90 <= 490 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 90, 1, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x + 90 <= 535 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 90, 2, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 1 && notes.get(notes.size()-1).x + 90 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 90, 3, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x + 45 <= 535 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 45, 2, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 2 && notes.get(notes.size()-1).x + 45 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 45, 3, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 3 && notes.get(notes.size()-1).x + 22 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 22, 3, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 400 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 180, 4, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 490 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 180, 1, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 535 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 180, 2, false, false, false, false));
    } else if (notes.get(notes.size()-1).noteTog == 4 && notes.get(notes.size()-1).x + 180 <= 558 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(notes.get(notes.size()-1).x + 180, 3, false, false, false, false));
    }
    //Adds the second note if the first note is inputted
  } else if (notes.size()-1 == 0) {
    if (notes.get(0).noteTog == 1 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note (220+90, 1, false, false, false, false));
    } else if (notes.get(0).noteTog == 2 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note (220+45, 2, false, false, false, false));
    } else if (notes.get(0).noteTog == 3 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note (220 + 22, 3, false, false, false, false));
    } else if (notes.get(0).noteTog == 4 && notes.get(notes.size()-1).inputted == true) {
      notes.add(new Note(220 +180, 4, false, false, false, false));
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
  if (clef == true) {
    image(noteImages[33], 170, 155);
  } else if (clef == false) {
    image(noteImages[34], 175, 145);
  }
  image(noteImages[33], 390, 530);

  //Display button labels
  image(noteImages[35], 170, 40);
  image(noteImages[36], 245, 40);
  image(noteImages[37], 320, 40);
  image(noteImages[38], 395, 40);
  image(noteImages[39], 470, 40);
  image(noteImages[44], 548, 40);
  image(noteImages[41], 245, 260);
  image(noteImages[40], 468, 260);

  //Image changing logic on clef-toggle button
  if (clef == true) {
    image(noteImages[43], 170, 290);
  } else if (clef == false) {
    image(noteImages[42], 168, 290);
  }

  //Display outputted chord

  //A
  if (harmonizeRes.hasValue("A")) {
    if (harmonizeRes.hasValue("B") || harmonizeRes.hasValue("B#") || harmonizeRes.hasValue("Bb") || harmonizeRes.hasValue("G") || harmonizeRes.hasValue("G#") || harmonizeRes.hasValue("Gb")) {
      image(noteImages[16], 495, 535);
    } else {
      image(noteImages[16], 480, 535);
    }
  }
  if (harmonizeRes.hasValue("A#")) {
    if (harmonizeRes.hasValue("B") || harmonizeRes.hasValue("B#") || harmonizeRes.hasValue("Bb") || harmonizeRes.hasValue("G") || harmonizeRes.hasValue("G#") || harmonizeRes.hasValue("Gb")) {
      image(noteImages[16], 495, 535);
      image(noteImages[30], 460, 535);
    } else {
      image(noteImages[16], 480, 535);
      image(noteImages[30], 460, 535);
    }
  }
  if (harmonizeRes.hasValue("Ab")) {
    if (harmonizeRes.hasValue("B") || harmonizeRes.hasValue("B#") || harmonizeRes.hasValue("Bb") || harmonizeRes.hasValue("G") || harmonizeRes.hasValue("G#") || harmonizeRes.hasValue("Gb")) {
      image(noteImages[16], 495, 535);
      image(noteImages[28], 455, 535);
    } else {
      image(noteImages[16], 480, 535);
      image(noteImages[28], 455, 535);
    }
  }

  //B
  if (harmonizeRes.hasValue("B")) {
    image(noteImages[16], 480, 525);
  }
  if (harmonizeRes.hasValue("B#")) {
    image(noteImages[16], 480, 525);
    if (harmonizeRes.hasValue("A#") || harmonizeRes.hasValue("Ab") || harmonizeRes.hasValue("C#") || harmonizeRes.hasValue("Cb")) {
      image(noteImages[30], 440, 525);
    } else {
      image(noteImages[30], 460, 525);
    }
  }
  if (harmonizeRes.hasValue("Bb")) {
    image(noteImages[16], 480, 525);
    if (harmonizeRes.hasValue("A#") || harmonizeRes.hasValue("Ab") || harmonizeRes.hasValue("C#") || harmonizeRes.hasValue("Cb")) {
      image(noteImages[28], 435, 525);
    } else {
      image(noteImages[28], 455, 525);
    }
  }

  //C
  if (harmonizeRes.hasValue("C")) {
    if (harmonizeRes.hasValue("B") || harmonizeRes.hasValue("B#") || harmonizeRes.hasValue("Bb") || harmonizeRes.hasValue("D") || harmonizeRes.hasValue("D#") || harmonizeRes.hasValue("Db")) {
      image(noteImages[16], 495, 515);
    } else {
      image(noteImages[16], 480, 515);
    }
  }
  if (harmonizeRes.hasValue("C#")) {
    if (harmonizeRes.hasValue("B") || harmonizeRes.hasValue("B#") || harmonizeRes.hasValue("Bb") || harmonizeRes.hasValue("D") || harmonizeRes.hasValue("D#") || harmonizeRes.hasValue("Db")) {
      image(noteImages[16], 495, 515);
      image(noteImages[30], 460, 515);
    } else {
      image(noteImages[16], 480, 515);
      image(noteImages[30], 460, 515);
    }
  }
  if (harmonizeRes.hasValue("Cb")) {
    if (harmonizeRes.hasValue("B") || harmonizeRes.hasValue("B#") || harmonizeRes.hasValue("Bb") || harmonizeRes.hasValue("D") || harmonizeRes.hasValue("D#") || harmonizeRes.hasValue("Db")) {
      image(noteImages[16], 495, 515);
      image(noteImages[28], 455, 515);
    } else {
      image(noteImages[16], 480, 515);
      image(noteImages[28], 455, 515);
    }
  }

  //D
  if (harmonizeRes.hasValue("D")) {
    image(noteImages[16], 480, 505);
  }
  if (harmonizeRes.hasValue("D#")) {
    image(noteImages[16], 480, 505);
    if (harmonizeRes.hasValue("C#") || harmonizeRes.hasValue("Cb") || harmonizeRes.hasValue("E#") || harmonizeRes.hasValue("Eb")) {
      image(noteImages[30], 440, 505);
    } else {
      image(noteImages[30], 460, 505);
    }
  }
  if (harmonizeRes.hasValue("Db")) {
    image(noteImages[16], 480, 505);
    if (harmonizeRes.hasValue("C#") || harmonizeRes.hasValue("Cb") || harmonizeRes.hasValue("E#") || harmonizeRes.hasValue("Eb")) {
      image(noteImages[28], 435, 505);
    } else {
      image(noteImages[28], 455, 505);
    }
  }

  //E
  if (harmonizeRes.hasValue("E")) {
    if (harmonizeRes.hasValue("D") || harmonizeRes.hasValue("D#") || harmonizeRes.hasValue("Db")) {
      image(noteImages[16], 495, 495);
    } else {
      image(noteImages[16], 480, 495);
    }
  }
  if (harmonizeRes.hasValue("E#")) {
    if (harmonizeRes.hasValue("D") || harmonizeRes.hasValue("D#") || harmonizeRes.hasValue("Db")) {
      image(noteImages[16], 495, 495);
      image(noteImages[30], 460, 495);
    } else {
      image(noteImages[16], 480, 495);
      image(noteImages[30], 460, 495);
    }
  }
  if (harmonizeRes.hasValue("Eb")) {
    if (harmonizeRes.hasValue("D") || harmonizeRes.hasValue("D#") || harmonizeRes.hasValue("Db")) {
      image(noteImages[16], 495, 495);
      image(noteImages[28], 455, 495);
    } else {
      image(noteImages[16], 480, 495);
      image(noteImages[28], 455, 495);
    }
  }

  //F
  if (harmonizeRes.hasValue("F")) {
    if (harmonizeRes.hasValue("G") || harmonizeRes.hasValue("G#") || harmonizeRes.hasValue("Gb")) {
      image(noteImages[16], 495, 555);
    } else {
      image(noteImages[16], 480, 555);
    }
  }
  if (harmonizeRes.hasValue("F#")) {
    if (harmonizeRes.hasValue("G") || harmonizeRes.hasValue("G#") || harmonizeRes.hasValue("Gb")) {
      image(noteImages[16], 495, 555);
      image(noteImages[30], 460, 555);
    } else {
      image(noteImages[16], 480, 555);
      image(noteImages[30], 460, 555);
    }
  }
  if (harmonizeRes.hasValue("Fb")) {
    if (harmonizeRes.hasValue("G") || harmonizeRes.hasValue("G#") || harmonizeRes.hasValue("Gb")) {
      image(noteImages[16], 495, 555);
      image(noteImages[28], 455, 555);
    } else {
      image(noteImages[16], 480, 555);
      image(noteImages[28], 455, 555);
    }
  }

  //G
  if (harmonizeRes.hasValue("G")) {
    image(noteImages[16], 480, 545);
  }
  if (harmonizeRes.hasValue("G#")) {
    image(noteImages[16], 480, 545);
    if (harmonizeRes.hasValue("F#") || harmonizeRes.hasValue("Fb") || harmonizeRes.hasValue("A#") || harmonizeRes.hasValue("Ab")) {
      image(noteImages[30], 440, 545);
    } else {
      image(noteImages[30], 460, 545);
    }
  }
  if (harmonizeRes.hasValue("Gb")) {
    image(noteImages[16], 480, 545);
    if (harmonizeRes.hasValue("F#") || harmonizeRes.hasValue("Fb") || harmonizeRes.hasValue("A#") || harmonizeRes.hasValue("Ab")) {
      image(noteImages[28], 435, 545);
    } else {
      image(noteImages[28], 455, 545);
    }
  }
}

//Mo Spiegel
void harmPlay() {

  //Plays harmonized chord
  if (harmonizeRes.hasValue("A")) {
    pitchA42.play();
  }
  if (harmonizeRes.hasValue("A#")) {
    pitchAs42.play();
  }
  if (harmonizeRes.hasValue("Ab")) {
    pitchGs42.play();
  }
  if (harmonizeRes.hasValue("B")) {
    pitchB42.play();
  }
  if (harmonizeRes.hasValue("B#")) {
    pitchC52.play();
  }
  if (harmonizeRes.hasValue("Bb")) {
    pitchAs42.play();
  }
  if (harmonizeRes.hasValue("C")) {
    pitchC52.play();
  }
  if (harmonizeRes.hasValue("C#")) {
    pitchCs52.play();
  }
  if (harmonizeRes.hasValue("Cb")) {
    pitchB42.play();
  }
  if (harmonizeRes.hasValue("D")) {
    pitchD52.play();
  }
  if (harmonizeRes.hasValue("D#")) {
    pitchDs52.play();
  }
  if (harmonizeRes.hasValue("Db")) {
    pitchCs52.play();
  }
  if (harmonizeRes.hasValue("E")) {
    pitchE52.play();
  }
  if (harmonizeRes.hasValue("E#")) {
    pitchF52.play();
  }
  if (harmonizeRes.hasValue("Eb")) {
    pitchDs52.play();
  }
  if (harmonizeRes.hasValue("F")) {
    pitchF42.play();
  }
  if (harmonizeRes.hasValue("F#")) {
    pitchFs42.play();
  }
  if (harmonizeRes.hasValue("Fb")) {
    pitchE42.play();
  }
  if (harmonizeRes.hasValue("G")) {
    pitchG42.play();
  }
  if (harmonizeRes.hasValue("G#")) {
    pitchGs42.play();
  }
  if (harmonizeRes.hasValue("Gb")) {
    pitchFs42.play();
  }

  //Plays inputted notes
  for (int i = 0; i < notes.size(); i ++) {
    if (clef == true) { //Treble Clef
      if (notes.get(i).restMode == false) {
        if (notes.get(i).y == 95) { //Each one of these blocks detects the y-position of the ith note and its accidentals, and determines what pitch to play
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchG5.play();
          } else if (notes.get(i).sharp == true) {
            pitchGs5.play();
          } else if (notes.get(i).flat == true) {
            pitchFs5.play();
          }
        } else if (notes.get(i).y == 105) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchF5.play();
          } else if (notes.get(i).sharp == true) {
            pitchFs5.play();
          } else if (notes.get(i).flat == true) {
            pitchE5.play();
          }
        } else if (notes.get(i).y == 115) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchE5.play();
          } else if (notes.get(i).sharp == true) {
            pitchF5.play();
          } else if (notes.get(i).flat == true) {
            pitchDs5.play();
          }
        } else if (notes.get(i).y == 125) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchD5.play();
          } else if (notes.get(i).sharp == true) {
            pitchDs5.play();
          } else if (notes.get(i).flat == true) {
            pitchCs5.play();
          }
        } else if (notes.get(i).y == 135) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchC5.play();
          } else if (notes.get(i).sharp == true) {
            pitchCs5.play();
          } else if (notes.get(i).flat == true) {
            pitchB4.play();
          }
        } else if (notes.get(i).y == 145) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchB4.play();
          } else if (notes.get(i).sharp == true) {
            pitchC5.play();
          } else if (notes.get(i).flat == true) {
            pitchAs4.play();
          }
        } else if (notes.get(i).y == 155) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchA4.play();
          } else if (notes.get(i).sharp == true) {
            pitchAs4.play();
          } else if (notes.get(i).flat == true) {
            pitchGs4.play();
          }
        } else if (notes.get(i).y == 165) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchG4.play();
          } else if (notes.get(i).sharp == true) {
            pitchGs4.play();
          } else if (notes.get(i).flat == true) {
            pitchFs4.play();
          }
        } else if (notes.get(i).y == 175) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchF4.play();
          } else if (notes.get(i).sharp == true) {
            pitchFs4.play();
          } else if (notes.get(i).flat == true) {
            pitchE4.play();
          }
        } else if (notes.get(i).y == 185) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchE4.play();
          } else if (notes.get(i).sharp == true) {
            pitchF4.play();
          } else if (notes.get(i).flat == true) {
            pitchDs4.play();
          }
        } else if (notes.get(i).y == 195) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchD4.play();
          } else if (notes.get(i).sharp == true) {
            pitchDs4.play();
          } else if (notes.get(i).flat == true) {
            pitchCs4.play();
          }
        }
      }
    } else if (clef == false) { //Bass clef
      if (notes.get(i).restMode == false) {
        if (notes.get(i).y == 95) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchB3.play();
          } else if (notes.get(i).sharp == true) {
            pitchC4.play();
          } else if (notes.get(i).flat == true) {
            pitchAs3.play();
          }
        } else if (notes.get(i).y == 105) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchA3.play();
          } else if (notes.get(i).sharp == true) {
            pitchAs3.play();
          } else if (notes.get(i).flat == true) {
            pitchGs3.play();
          }
        } else if (notes.get(i).y == 115) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchG3.play();
          } else if (notes.get(i).sharp == true) {
            pitchGs3.play();
          } else if (notes.get(i).flat == true) {
            pitchFs3.play();
          }
        } else if (notes.get(i).y == 125) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchF3.play();
          } else if (notes.get(i).sharp == true) {
            pitchFs5.play();
          } else if (notes.get(i).flat == true) {
            pitchE3.play();
          }
        } else if (notes.get(i).y == 135) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchE3.play();
          } else if (notes.get(i).sharp == true) {
            pitchF3.play();
          } else if (notes.get(i).flat == true) {
            pitchDs3.play();
          }
        } else if (notes.get(i).y == 145) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchD3.play();
          } else if (notes.get(i).sharp == true) {
            pitchDs3.play();
          } else if (notes.get(i).flat == true) {
            pitchCs3.play();
          }
        } else if (notes.get(i).y == 155) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchC3.play();
          } else if (notes.get(i).sharp == true) {
            pitchCs3.play();
          } else if (notes.get(i).flat == true) {
            pitchB2.play();
          }
        } else if (notes.get(i).y == 165) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchB2.play();
          } else if (notes.get(i).sharp == true) {
            pitchC3.play();
          } else if (notes.get(i).flat == true) {
            pitchAs2.play();
          }
        } else if (notes.get(i).y == 175) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchA2.play();
          } else if (notes.get(i).sharp == true) {
            pitchAs2.play();
          } else if (notes.get(i).flat == true) {
            pitchGs2.play();
          }
        } else if (notes.get(i).y == 185) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchG2.play();
          } else if (notes.get(i).sharp == true) {
            pitchGs2.play();
          } else if (notes.get(i).flat == true) {
            pitchFs2.play();
          }
        } else if (notes.get(i).y == 195) {
          if (notes.get(i).sharp == false && notes.get(i).flat == false) {
            pitchF2.play();
          } else if (notes.get(i).sharp == true) {
            pitchFs2.play();
          } else if (notes.get(i).flat == true) {
            pitchE2.play();
          }
        }
      }
    }

    //Depending on the note length, delays the for loop for a certain time to sustain the sound
    if (notes.get(i).noteTog == 1) {
      delay(1000);
    } else if (notes.get(i).noteTog == 2) {
      delay(500);
    } else if (notes.get(i).noteTog == 3) {
      delay(250);
    } else if (notes.get(i).noteTog == 4) {
      delay(2000);
    } else if (notes.get(i).noteTog == 5) {
      delay(4000);
    }

    //Halts all sounds
    pitchA4.stop();
    pitchAs4.stop();
    pitchB4.stop();
    pitchC4.stop();
    pitchCs4.stop();
    pitchD4.stop();
    pitchDs4.stop();
    pitchE4.stop();
    pitchF4.stop();
    pitchFs4.stop();
    pitchG4.stop();
    pitchGs4.stop();
    pitchA5.stop();
    pitchAs5.stop();
    pitchB5.stop();
    pitchC5.stop();
    pitchCs5.stop();
    pitchD5.stop();
    pitchDs5.stop();
    pitchE5.stop();
    pitchF5.stop();
    pitchFs5.stop();
    pitchG5.stop();
    pitchGs5.stop();
    pitchC3.stop();
    pitchCs3.stop();
    pitchD3.stop();
    pitchDs3.stop();
    pitchE3.stop();
    pitchF3.stop();
    pitchFs3.stop();
    pitchG3.stop();
    pitchGs3.stop();
    pitchA3.stop();
    pitchAs3.stop();
    pitchB3.stop();
    pitchF2.stop();
    pitchFs2.stop();
    pitchE2.stop();
    pitchG2.stop();
    pitchGs2.stop();
    pitchA2.stop();
    pitchAs2.stop();
    pitchB2.stop();
    
    //For loop repeats, moves onto the next note, plays all notes seqeuentially
  }

  //Halts all sounds (from harmonized chord) following the completion of the for loop (i.e. all notes have been played through)
  pitchA42.stop();
  pitchAs42.stop();
  pitchB42.stop();
  pitchE42.stop();
  pitchF42.stop();
  pitchFs42.stop();
  pitchG42.stop();
  pitchGs42.stop();
  pitchC52.stop();
  pitchCs52.stop();
  pitchD52.stop();
  pitchDs52.stop();
  pitchE52.stop();
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
  if (clef==true) {
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
    keyConvert.put(0, "rest");
  }
  if (clef==false) {
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
      if (harmonizeRes.hasValue(str(keySigS.get(i).charAt(0)))) {
        for (int i2=0; i2<harmonizeRes.size(); i2++) {
          if (harmonizeRes.get(i2).equals((str(keySigS.get(i).charAt(0))))) {
            harmonizeRes.set(i2, harmonizeRes.get(i2)+"#");
            i2=harmonizeRes.size()+1;
          }
        }
      }
    }
    //adjust for flats in the chord based on key signature
  } else if (keySig=='F') {
    for (int i=0; i<keySigF.size()-1; i++) {
      if (harmonizeRes.hasValue(str(keySigF.get(i).charAt(0)))) {
        for (int i2=0; i2<harmonizeRes.size(); i2++) {
          if (harmonizeRes.get(i2).equals((str(keySigF.get(i).charAt(0))))) {
            harmonizeRes.set(i2, harmonizeRes.get(i2)+"b");
            i2=harmonizeRes.size()+1;
          }
        }
      }
    }
  }
  println(harmonizeRes);
  println("NEW HARMONY");
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
