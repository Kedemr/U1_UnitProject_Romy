/* My Unit project starts off with a necklace and a pendant. Once the pendant is clicked, it zooms into a balance
 with a few glowing circles on one side. When these circles are hovered over, two red dots flow down the screen.
 */
int pendantX;
int pendantY;
int pendantR = 200;
PImage balance;
PImage glowCircle;
PImage glowCircleSpecial;
int sceneNumber = 0;
int circleNumber = 100;
int glowCircleX[];
int glowCircleY[];
int glowCircleSpecialX;
int glowCircleSpecialY;
int circleRainX[];
int circleRainY[];
int circleRainR[];
int circleRainX1[];
int circleRainY1[];
void setup()
{
  fullScreen();
  pendantX  = width/2;
  pendantY   =  height/2;
  balance = loadImage("scale.png");
  balance.resize(300, 300); 
  glowCircleX = new int[circleNumber];
  glowCircleY = new int[circleNumber];

  glowCircle =  loadImage("circle.png");
  glowCircle.resize(30, 30);

  glowCircleSpecial = loadImage("orange.png");
  glowCircleSpecialX = width/2-100;
  glowCircleSpecialY = height/2;
  glowCircleSpecial.resize(30, 30);
  for (int i=0; i< circleNumber; i++)
  {
    glowCircleX[i] = width/2-100;
    glowCircleY[i] = height/2;
  }
  circleRainX = new int[circleNumber];
  circleRainY = new int[circleNumber];
  circleRainR = new int[circleNumber];
  circleRainX1 = new int[circleNumber];
  circleRainY1 = new int[circleNumber];

  for (int i=0; i< circleNumber; i++)
  {
    circleRainX[i] = 10;
    circleRainY[i] = 10;
    circleRainR[i] = 20;
    circleRainX1[i] = width;
    circleRainY1[i] = 0;
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
  line(0, 0, width/2, height/2); 
  line(width, 0, width/2, height/2);
  ellipse(pendantX, pendantY, pendantR, pendantR);
  isCollisionSmallPendant();
}


void pendantBigDraw()
{
  ellipse(pendantX, pendantY, 500, 500);
  image(balance, width/2-150, height/2-100);
  for (int i=0; i<circleNumber; i++)
  {
    image(glowCircleSpecial, glowCircleSpecialX, glowCircleSpecialY);  // click on this one
    image(glowCircle, glowCircleX[i]-50, glowCircleY[i]+80);
    image(glowCircle, glowCircleX[i]-20, glowCircleY[i]+80);
    image(glowCircle, glowCircleX[i]+30, glowCircleY[i]+80);
    image(glowCircle, glowCircleX[i]+7, glowCircleY[i]+80);// end of bottom row
    image(glowCircle, glowCircleX[i]-10, glowCircleY[i]+55);// start of second row from bottom
    image(glowCircle, glowCircleX[i]+15, glowCircleY[i]+55);
    image(glowCircle, glowCircleX[i]-35, glowCircleY[i]+55);// end of second row from bottom
    image(glowCircle, glowCircleX[i], glowCircleY[i]+30);// start of third row from bottom
    image(glowCircle, glowCircleX[i]-20, glowCircleY[i]+30); // end of third row
    if (dist(mouseX, mouseY, glowCircleSpecialX, glowCircleSpecialY)<30)
    {
      background(0);
      fill(255, 0, 0);
      int directionX = (int)random(1, 5);
      int directionY = (int)random(1, 5);
      ellipse(circleRainX[i], circleRainY[i], circleRainR[i], circleRainR[i]);
      ellipse(circleRainX1[i], circleRainY1[i], circleRainR[i], circleRainR[i]);
      circleRainX[i] = circleRainX[i] + (directionX*50);
      circleRainY[i] = circleRainY[i] + (directionY*50); 
      circleRainX1[i] = circleRainX1[i] + (directionX*50);
      circleRainY1[i] = circleRainY1[i] + (directionY*50);
      if (circleRainY[i]>height)
      {
        circleRainY[i] = 0;
      }
      if (circleRainX[i]>width)
      {
        circleRainX[i] = 0;
      }
      if (circleRainY1[i]>height)
      {
        circleRainY1[i] = 0;
      }
      if (circleRainX1[i]>width)
      {
        circleRainX1[i] = 0;
      }
    }
  }
}


boolean isCollisionSmallPendant()
{
  if (dist(mouseX, mouseY, pendantX, pendantY)<pendantR && mousePressed)
  {
    sceneNumber = 1;
    return true;
  }
  return false;
}