color black = #0D0C0C;
color white = #F7F5F5;
color lgreen = #20A215;

void gameover() {
  background(0);
  strokeWeight(4);
  image(gamebkg, 0, 0, height, width);
  //sound
  gameover.play();

  //words
  fill(#ED187C);
  textFont(GROBOLD);
  text("GAMEOVER", 400, 200);
  text("HIGHSCORE:" + highscore, 400, 425);
  text("score:" + score, 400, 530);

  //tactile buttons
  tactileRect(100, 600, 300, 100, lgreen);
  tactileRect(400, 600, 300, 100, lgreen);

  fill(255);
  textFont(GROBOLD);
  textSize(40);
  text("PLAY AGAIN", 250, 650);
  text("MENU", 550, 650);
}

void gameoverClicks() {

  if (touchingRect(100, 600, 300, 100)) {
    mode= GAME;
    gameover.rewind();
    reset();
  }
  if (touchingRect(400, 600, 300, 100)) {
    mode=INTRO;
    theme.rewind();
    gameover.rewind();
    reset();
  }
}

//function
void reset() {
  lives =3;
  score =0;
  wordsize = 1;
}


boolean touchingRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y & mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

void tactileRect(int x, int y, int w, int h, color f) {
  //rect button
  fill(f);
  if (touchingRect(x, y, w, h)) {
    stroke(white);
  } else {
    stroke(black);
  }
  rect(x, y, w, h);
}
