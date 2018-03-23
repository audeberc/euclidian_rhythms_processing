float angle;
int MAXSTEP = 16;
int SPEEDFAC = 32;
int step = 0;
float anglestep = TWO_PI / (SPEEDFAC * float(MAXSTEP)); 
int ticks = 0;
int c0 = 0;
void setup() {
  size(800, 800);
  background(0);
  translate(width*0.5, height*0.5);
  rotate(- PI / 2.0);

  angle = 0;
}

void draw() {
  background(0);

  angle = angle + anglestep;

  translate(width*0.5, height*0.5);
  rotate(angle);
  draw_euclidian(0, 0, 200, 9, 4);
  draw_euclidian(0, 0, 100, 4, 3);
  int[] pat = draw_euclidian(0, 0, 300,  MAXSTEP, 11);
  
  ticks = ticks +1 ;
  if(ticks % 32 == 0){
    c0 +=1;
    if(c0 == 32){
      c0 = 0;
    }
    println("tick");
    if (pat[c0]==1){
      println("plop");
    }
    
  }
// 1 turn = 2PI/0.005, 1 step = (2PI/0.005) / MAXLENGTH
}
