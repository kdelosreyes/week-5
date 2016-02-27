//flappy bird inprogress
float[] values;
int index;
int test = 0;
int y = 100;

float maybeRandomHeight() {
  if (random(10) < 1) {
    return random(height/3, 2*height/3);
  } else {
    return 0;
  }
}

void setup() {
  size(600, 250);
  background(0);

  values = new float[width/3];
  index = 0;
}

void draw() {
  background(255);

  values[index] = maybeRandomHeight();
  index = index + 1;
  if (index >= values.length) {
    index = 0;
    test = test+1;// In 10 seconds, the variable index reset to 0 is 3 times

    int variable = index;
  }
  if (millis() <= 10000) {

    println("test"+ test);
  }
  for (int i = 0; i < values.length; ++i) {
    int realIndex = index + i;
    if (realIndex >= values.length) {
      realIndex -= values.length;
    }
    line(i*3, height-values[realIndex], i*3, height);






    //println("realIndex" + test);//the heightest of realIndex is 199
  }
      stroke(0);
    ellipse (30, y, 20, 20);
    y = y+1;
    if (mousePressed){
      ellipse (30, y, 20, 20);
        //if(y>250) {
          
    y = y-10;
}
}
