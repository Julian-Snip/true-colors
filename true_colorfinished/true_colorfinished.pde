import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int INTERACTIONS= 4;
int mode;

//font 
PFont GROBOLD;

//sound variables
Minim minim;
AudioPlayer theme;
AudioPlayer yes;
AudioPlayer no;
AudioPlayer gameover;

//colors and words
int randomWord = (int) random(0, 5);
int randomColor = (int) random(0, 5);

//lives and scoring
int score, lives;
int highscore;

//gif setup
PImage[]gif;
int numberOfFrames;
int f=numberOfFrames;
PImage gamebkg;

void setup() {
  size(800, 800);
  mode= INTRO;
  strokeWeight(3);

  //font
  GROBOLD = createFont("GROBOLD.ttf", 100);

  //gif
  numberOfFrames = 15;
  gif = new PImage[numberOfFrames];
  int i = 0;
  while (i<numberOfFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    i=i+1;
  }

  //gameover bgk
  gamebkg = loadImage("bkg.jpg");

  //game tracking
  score = 0;
  lives = 3;

  //minim
  minim = new Minim(this);
  theme = minim.loadFile("themesong.mp3");
  yes = minim.loadFile("yes.mp3");
  no = minim.loadFile("no.mp3");
  gameover =  minim.loadFile("gameover.mp3");
}

void draw() {
  if (mode==INTRO) intro();
  else if (mode==GAME)game();
  else if (mode==GAMEOVER) gameover();
  else println ("error"+mode);
}
