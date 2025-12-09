# Mo Spiegel | 3B | Contributions Documentation

## Artifact Contributions
Helped to construct the UI mockup:

![Mock UI](https://github.com/Kai535813/Musikhelfer/blob/main/images/UIDesign.png?raw=true)

## Data Contributions
Photoshopped note, rest, and accidental images, added a custom font

## Outline of Application Contributions
1. Coded the Note Class
⋅⋅⋅⋅* Logic for note inputting for the harmonizer utility's score via the variables clickX and clickY, which detect where the user clicked and are used to create a note that snaps to the score
⋅⋅⋅⋅* Logic for note hovering that enables the user to hover over the score and see where a note will be placed
⋅⋅⋅⋅* Logic for sharp/flat toggling and the resulting accidental displaying
⋅⋅⋅⋅* Logic for rest toggling and the resulting rest dsiplaying 
2. Coded the harmMode method (screen) in the main project file
⋅⋅⋅⋅* Programically displays the input and output score for the harmonizer utility
⋅⋅⋅⋅* Programically displays an output screen that provides the notes of the harmonized chord
⋅⋅⋅⋅* Programically displays the harmonized chord on a score taking the StringList output from the harmonize method
⋅⋅⋅⋅* Calls the member methods for the harmButton array of buttons
3. Coded the harmPlay method in the main project file
⋅⋅⋅⋅* Plays inputted notes sequentially using a for loop and delay functions, calling pitches that are determined by the y position variable in each note
⋅⋅⋅⋅* Plays harmonized chord while playing harmonized notes by detecting the values in the outputted StringList from the harmonize method
4. Quality of Life Contributions
⋅⋅⋅⋅* Added custom font





