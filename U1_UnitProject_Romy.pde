int pendantX;
int pendantY;
int pendantR = 200;
PImage balance;
int sceneNumber = 0;

void setup()
{
  fullScreen();
  pendantX  = width/2; //1366/2; 
  pendantY   =  height/2;//768/2;
  balance = loadImage("scale.png");
  balance.resize(100, 100);
}

void draw()
{
  if (sceneNumber == 0)
  {
    pendant();
  }
  if (sceneNumber == 1)
  {
    pendantBigDraw();
  }
}

void pendant()
{
  if (mousePressed)
  {
    sceneNumber = 1;
  }
  line(0, 0, width/2, height/2); 
  line(width, 0, width/2, height/2);
  ellipse(pendantX, pendantY, pendantR, pendantR);
}

void pendantBigDraw()
{
  ellipse(pendantX, pendantY, 500, 500);
  image(balance, 200, 200);
}