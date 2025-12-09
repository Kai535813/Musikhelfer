void mousePressed() {
  // ... keep other mouse logic above if needed ...

  for (int i = 0; i < tuneButtons.length; i++) {
    if (!tuneButtons[i].over) continue;

    // compute volume
    tuneVolume = map(tuneVolumeX, tuneVolumeMin, tuneVolumeMax, 0.0, 1.0);

    // map label to SoundFile
    String label = tuneButtons[i].disVal;
    if (label == null) label = "";
    label = label.trim();

    SoundFile next = null;
    if ("A4.mp3".equals(label)) next = pitchA4;
    else if ("As4.mp3".equals(label)) next = pitchAs4;
    // ... other mappings ...

    if (next == null) {
      println("No SoundFile mapped for: '" + label + "'");
      break;
    }

    // stop the currently playing sound
    if (currentSound != null && currentSound.isPlaying()) {
      currentSound.stop();
      currentSound.cue(0);
    }

    // play the new sound and remember it
    next.amp(tuneVolume);
    next.play();
    currentSound = next;

    break; // handled the click
  }

  // ... keep other mouse logic below if needed ...
}
