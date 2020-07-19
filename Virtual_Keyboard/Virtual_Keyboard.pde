import themidibus.*; 
import javax.sound.midi.MidiMessage; 



// SimpleMidi.pde

 //Import the library
 

MidiBus myBus; 

int currentColor = 0;
int midiDevice  = 2;
PImage backScore;
boolean[] notes = new boolean[110];
int y = 0;
int absNote = 0;
int shiftNote = 0;
int playedNotes = 0;
int akkord[] = new int[3];
String akkordName = "";

public void setup() {
  size(396, 460);
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
  backScore = loadImage("score.PNG");
  
  for(int i = 0; i<110; i++){
    notes[i] = false;
  }
  
}

public void draw() {
  //Score
  image(backScore, 0, 0);
  for(int i = 0; i<5; i++){
      line(5, 100+i*25, width-200, 100+i*25);
  }
  for(int i = 0; i<5; i++){
      line(5, 250+i*25, width-200, 250+i*25);
  }
  strokeWeight(4);
  line(width-200, 100, width-200, 350);
  strokeWeight(1);
  
  
  //Akkord
  textSize(32);
  if(akkordName != ""){
      textSize(64);
    text(split(akkordName, " ")[0], 250, 200);
      textSize(32);
    text(split(akkordName, " ")[1], 250, 300);
  }
  
  
  //Notes
  fill(0);
  for(int i = 0; i<110; i++){
    if(notes[i] == true){
       switch(i){
       case 36:  ellipse(140, 400, 25, 25); line(120, 375, 160, 375); line(120, 400, 160, 400); break;
       case 37:  ellipse(140, 400, 25, 25); line(120, 375, 160, 375); line(120, 400, 160, 400); text("#", 105, 411); break;
       case 38:  ellipse(175, 388, 25, 25); line(160, 375, 195, 375); line(160, 400, 195, 400); break;
       case 39:  ellipse(175, 388, 25, 25); line(160, 375, 195, 375); line(160, 400, 195, 400); text("#", 105, 399); break;
       case 40:  ellipse(140, 375, 25, 25); line(120, 375, 160, 375); break;
       case 41:  ellipse(175, 363, 25, 25); line(160, 375, 195, 375); break;
       case 42:  ellipse(175, 363, 25, 25); line(160, 375, 195, 375); text("#", 105, 374); break;
       case 43:  ellipse(140, 350, 25, 25); break;
       case 44:  ellipse(140, 350, 25, 25); text("#", 105, 361); break;
       case 45:  ellipse(175, 338, 25, 25); break;
       case 46:  ellipse(175, 338, 25, 25); text("#", 105, 349); break;
       case 47:  ellipse(140, 325, 25, 25); break;
       case 48:  ellipse(175, 313, 25, 25); break;
       case 49:  ellipse(175, 313, 25, 25); text("#", 105, 324); break;
       case 50:  ellipse(140, 300, 25, 25); break;
       case 51:  ellipse(140, 300, 25, 25); text("#", 105, 311); break;
       case 52:  ellipse(175, 288, 25, 25); break;
       case 53:  ellipse(140, 275, 25, 25); break;
       case 54:  ellipse(140, 275, 25, 25); text("#", 105, 286); break;
       case 55:  ellipse(175, 263, 25, 25); break;
       case 56:  ellipse(175, 263, 25, 25); text("#", 105, 274); break;
       case 57:  ellipse(140, 250, 25, 25); break;
       case 58:  ellipse(140, 250, 25, 25); text("#", 105, 261); break;
       case 59:  ellipse(175, 238, 25, 25); line(160, 225, 195, 225); break;   
       case 60:  ellipse(140, 225, 25, 25); line(120, 225, 160, 225); break;
       case 61:  ellipse(140, 225, 25, 25); line(120, 225, 160, 225); text("#", 105, 236); break;
       case 62:  ellipse(175, 213, 25, 25); line(160, 225, 195, 225); break;
       case 63:  ellipse(175, 213, 25, 25); line(160, 225, 195, 225); text("#", 105, 224); break;
       case 64:  ellipse(140, 200, 25, 25); break;
       case 65:  ellipse(175, 188, 25, 25); break;
       case 66:  ellipse(175, 188, 25, 25); text("#", 105, 199); break;
       case 67:  ellipse(140, 175, 25, 25); break;
       case 68:  ellipse(140, 175, 25, 25); text("#", 105, 186); break;
       case 69:  ellipse(175, 163, 25, 25); break;
       case 70:  ellipse(175, 163, 25, 25); text("#", 105, 174); break;
       case 71:  ellipse(140, 150, 25, 25); break;
       case 72:  ellipse(175, 138, 25, 25); break;
       case 73:  ellipse(175, 138, 25, 25); text("#", 105, 149); break;
       case 74:  ellipse(140, 120, 25, 25); break;
       case 75:  ellipse(140, 120, 25, 25); text("#", 105, 136); break;
       case 76:  ellipse(175, 113, 25, 25); break;
       case 77:  ellipse(140, 100, 25, 25); break;
       case 78:  ellipse(140, 100, 25, 25); text("#", 105, 111); break;
       case 79:  ellipse(175, 88, 25, 25); line(160, 75, 195, 75); break;
       case 80:  ellipse(175, 88, 25, 25); line(160, 75, 195, 75); text("#", 105, 99); break;
       case 81:  ellipse(140, 75, 25, 25); line(120, 75, 160, 75); break;
       case 82:  ellipse(140, 75, 25, 25); line(120, 75, 160, 75); text("#", 105, 86); break;
       case 83:  ellipse(175, 63, 25, 25); line(160, 75, 195, 75); line(160, 50, 195, 50); break;
       case 84:  ellipse(140, 50, 25, 25); line(120, 75, 160, 75); line(120, 50, 160, 50); break;
       case 85:  ellipse(140, 50, 25, 25); line(120, 75, 160, 75); line(120, 50, 160, 50); text("#", 105, 61); break;
       case 86:  ellipse(175, 33, 25, 25); line(160, 75, 195, 75); line(160, 50, 195, 50); line(160, 25, 195, 25); break;
       case 87:  ellipse(175, 33, 25, 25); line(160, 75, 195, 75); line(160, 50, 195, 50); line(160, 25, 195, 25); text("#", 105, 44); break;
       case 88:  ellipse(140, 25, 25, 25); line(120, 75, 160, 75); line(120, 50, 160, 50); line(120, 25, 160, 25);  break;
       case 89:  ellipse(175, 12, 25, 25); line(160, 75, 195, 75); line(160, 50, 195, 50); line(160, 25, 195, 25);  break;
       }
    }
  }
  for(int i = 0; i<110; i++){ //62
    if(notes[i] == true){
         playedNotes++;
    }
  }
  absNote = 0;
  shiftNote = 0;
  
  
  
  //Akkord
  if(playedNotes == 3) {
    //Gespielte Noten
    int j = 0;
    for(int i = 0; i<110; i++){
      if(notes[i] == true){
         akkord[j] = i;
         j++;
      }
      if(j == 3) break;
    }
 //<>//
    //Gleiche Oktave?
    while(akkord[2] - akkord[0] > 7 && akkord[0] > 0){
      //Umstellen: Oberster Ton eine Oktave nach unten
      int tmp = akkord[2];
      akkord[2] = akkord[1];
      akkord[1] = akkord[0];
      akkord[0] = tmp-12;
    }

   //Name des Akkords
   int relNote = akkord[0]%12;
   switch(relNote){
     case 0: akkordName = "C"; break;
     case 1: akkordName = "Cis"; break;
     case 2: akkordName = "D"; break;
     case 3: akkordName = "Dis"; break;
     case 4: akkordName = "E"; break;
     case 5: akkordName = "F"; break;
     case 6: akkordName = "Fis"; break;
     case 7: akkordName = "G"; break;
     case 8: akkordName = "Gis"; break;
     case 9: akkordName = "A"; break;
     case 10: akkordName = "Bb"; break;
     case 11: akkordName = "B"; break;
   }
   
   //Dur oder Moll?
   if(akkord[1] - akkord[0] == 4 && akkord[2]- akkord[1] ==3){
     //Dur
     akkordName = akkordName + " Dur";
   }
   else {
      if(akkord[1] - akkord[0] == 3 && akkord[2]- akkord[1] == 4){
        //Moll
       akkordName = akkordName + " Moll";
     }
     else{akkordName = "";}
    }      
  }
  else{akkordName = "";}
  
  playedNotes = 0;
}


void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  
  notes[pitch] = true;
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  
 notes[pitch] = false;
}
 
