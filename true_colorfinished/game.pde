//colors
color blue = #0F24D6;
color green = #40D60F;
color red = #D60F0F;
color purple = #A2319B;
color yellow = #F4F51E;
//true calculator
boolean same;
//text size increaser
int wordsize = 1;
//true/false calculator
String[] words= {"RED", "GREEN", "BLUE", "PURPLE", "YELLOW", };
color[] colors = {red, green, blue, purple, yellow};
int fiftysplit =  (int) random(0, 2);

void game() {

  strokeWeight(10);
  textAlign(CENTER, CENTER);

  //sound control
  theme.pause();
  gameover.pause();

  //tacttile buttons
  tactileRectg(0, 0, 400, 800, 255);
  tactileRectg(400, 0, 400, 800, 0);



  //true not true setup
  fill(0);
  text("False", 200, 100);
  //rect(400, 0, 400, 800);
  fill(255);
  text("True", 575, 100);

  //words
  wordsize=wordsize+ 1;
  fill(colors[randomColor]);
  textSize(wordsize);
  text(words[randomWord], width/2, height/2);

  //Game scroing/lives
  fill(#11F2F0);
  textSize(40);
  text("Score:" + score, 700, 50);
  text("Lives:" +lives, 700, 100);
  text("HIGH SCORE: " + highscore, 400, 700);
  if (score > highscore) {
    highscore = score ;
  }

  //gameover
  if (lives==0) {
    mode=GAMEOVER;
  }
  if (wordsize == 100) {
    fiftysplit = (int) random (0, 2);
    randomWord = (int) random(0, 5);
    randomColor = (int) random(0, 5);
    lives=lives-1;
    wordsize= 1;
  }

  //50/50 slpit
  if (fiftysplit==1) {
    randomWord = randomColor;
  }

  while (fiftysplit== 0 && randomWord== randomColor) {
    randomWord = (int) random(0, 5);
    randomColor = (int) random(0, 5);
  }

  //true calculator
  if (randomColor==randomWord) {
    same= true;
  } else {
    same=false;
  }
}


void keyPressed() {
  wordsize=1;
  fiftysplit = (int) random (0, 2);
  randomWord = (int) random(0, 5);
  randomColor = (int) random(0, 5);

  if (keyCode ==LEFT && same== false) {
    score = score+1;
    yes.rewind();
    yes.play();
  }
  if (keyCode ==LEFT && same== true) {
    lives= lives -1;
    no.rewind();
    no.play();
  } 
  if (keyCode ==RIGHT && same == true) {
    score = score+1;
    yes.rewind();
    yes.play();
  } 
  if (keyCode ==RIGHT && same == false) {
    lives=lives-1;
    no.rewind();
    no.play();
  }
}

void gameClicks() {

  //color and word randomizer
  wordsize=1;
  fiftysplit = (int) random (0, 2);
  randomWord = (int) random(0, 5);
  randomColor = (int) random(0, 5);

  //scoring and lives value
  if     (touchingRectg(400, 0, 400, 800) && same ==true) {  
    score = score+1;

    yes.rewind();
    yes.play();
  } else if (touchingRectg(0, 0, 400, 800) && same ==false) {    
    score=score+1;
    yes.rewind();
    yes.play();
  } else if    (touchingRectg(400, 0, 400, 800) && same ==false) {     
    lives=lives-1;
    no.rewind();
    no.play();
  } else if      (touchingRectg(0, 0, 400, 800) && same ==true) {                       
    lives=lives-1;
    no.rewind();
    no.play();
  }
}


boolean touchingRectg(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y & mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

void tactileRectg(int x, int y, int w, int h, color f) {
  //rect button
  fill(f);
  if (touchingRectg(x, y, w, h)) {
    stroke(#ED18EA);
  } else {
    stroke(black);
  }
  rect(x, y, w, h);
}
