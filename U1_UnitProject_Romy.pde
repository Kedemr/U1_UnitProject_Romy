/* My Unit project starts off with a necklace and a pendant. Once the pendant is clicked, it zooms into a balance
 with a few glowing circles on either side. When these circles are clicked ______
 */

int pendantX;
int pendantY;
int pendantR = 200;
PImage balance;
int sceneNumber = 0;
PImage glow;
int circleNumber = 6;
int glowX[];
int glowY[];
void setup()
{
  fullScreen();
  pendantX  = width/2; //1366/2; 
  pendantY   =  height/2;//768/2;
  balance = loadImage("scale.png");
  balance.resize(300, 300); 
  glowX = new int[circleNumber];
  glowY = new int[circleNumber];

  glow =  loadImage("circle.png");
  glow.resize(20, 20);

  for (int i=0; i< circleNumber; i++)
  {
    glowX[i] = width/2-100;
    glowY[i] = height/2;
  }
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
  image(balance, width/2-150, height/2-100);
  image(glow, glowX[i], glowY[i]);
  /* image(glow, width/2-200, height/2);
   image(glow, width/2-200, height/2-50);
   image(glow, width/2-200, height/2+50);
   if(mouseX == width/2-200 && mouseY == height/2 && mousePressed)
   {
   background(0); 
   }*/
}