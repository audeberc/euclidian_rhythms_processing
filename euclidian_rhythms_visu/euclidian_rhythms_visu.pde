float angle;
int MAXSTEP = 16;
int SPEEDFAC = 12;
int step = 0;
float anglestep = TWO_PI / (SPEEDFAC * float(MAXSTEP)); 
int ticks = 0;
int c0 = 0;
int c1 = 0;
import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus


void setup() {
  size(800, 800);
  MidiBus.list();
  myBus = new MidiBus(this, -1, 1);
  background(0);
  translate(width*0.5, height*0.5);
  rotate(- PI / 2.0);

  angle = - PI / 2.0 + anglestep;
}

void draw() {
  background(0);

  angle = angle + anglestep;

  translate(width*0.5, height*0.5);
  rotate(angle);
  int[] pat1 = draw_euclidian(0, 0, 200, 9, 4);
  draw_euclidian(0, 0, 100, 4, 3);
  int[] pat = draw_euclidian(0, 0, 300,  MAXSTEP, 11);

  ticks = ticks +1 ;
  if(ticks % SPEEDFAC == 0){
    c0 +=1;
    c1 +=1;
    if(c0 == 16){
      c0 = 0;
    }
    if (pat[c0]==1){
  
      myBus.sendNoteOn(0,  64, 127); // Send a Midi noteOn 
    }
    
    if(c1 == 9){
      c1 = 0;
    }
    if (pat1[c1]==1){
   
      myBus.sendNoteOn(1,  92, 127); // Send a Midi noteOn 
    }
    
  }

// 1 turn = 2PI/0.005, 1 step = (2PI/0.005) / MAXLENGTH
}
