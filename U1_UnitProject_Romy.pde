/* My Unit project starts off with a necklace and a pendant. Once the pendant is clicked, it zooms into a balance
 with a few glowing circles on one side. When these circles are clicked a line appears above the scale.
 */
int pendantX;
int pendantY;
int pendantR = 200;
PImage balance;
PImage glowCircle;
PImage glowCircleSpecial;
int sceneNumber = 0;
int circleNumber = 6;
int glowCircleX[];
int glowCircleY[];
int glowCircleSpecialX;
int glowCircleSpecialY;
int circleRainX[];
int circleRainY[];
int circleRainR[];
int RainNumber = 100;
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
  
    for (int i=0; i< RainNumber; i++)
  {
    circleRainX[i] = 10;
    circleRainY[i] = 10;
    circleRainR[i] = 10;
  }
  colorMode(HSB);
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
  for (int i=0; i<circleNumber; i< RainNumber; i++)
  {
    image(glowCircleSpecial, glowCircleSpecialX, glowCircleSpecialY);
    //  image(glowCircle, glowCircleX[i], glowCircleY[i]); // click on this one
    image(glowCircle, glowCircleX[i]-50, glowCircleY[i]+80);
    image(glowCircle, glowCircleX[i]-20, glowCircleY[i]+80);
    image(glowCircle, glowCircleX[i]+30, glowCircleY[i]+80);
    image(glowCircle, glowCircleX[i]+7, glowCircleY[i]+80);// end of bottom row
    image(glowCircle, glowCircleX[i]-10, glowCircleY[i]+55);// start of second row from bottom
    image(glowCircle, glowCircleX[i]+15, glowCircleY[i]+55);
    image(glowCircle, glowCircleX[i]-35, glowCircleY[i]+55);// end of second row from bottom
    image(glowCircle, glowCircleX[i], glowCircleY[i]+30);// start of third row from bottom
    image(glowCircle, glowCircleX[i]-20, glowCircleY[i]+30); 
    if (dist(mouseX, mouseY, glowCircleSpecialX, glowCircleSpecialY)<30)
    {
      background(0);
        for (int i=0; i< RainNumber; i++)
  {
    fill(random(0, 500), random(0, 500), random(0, 500));
    int directionX = (int)random(-1, 2);
    int directionY = (int)random(-1, 2);
    ellipse(circleRainX[i], circleRainY[i], circleRainR[i], circleRainR[i]);
    circleRainX[i] = circleRainX[i] + (directionX*10);
    circleRainY[i] = circleRainY[i] + (directionY*10); 
    if (circleRainY[i]>height)
    {
      circleRainY[i] = 0;
    }
    if (circleRainX[i]>width)
    {
      circleRainX[i] = 0;
    }
  }
    }


    //image(glowCircle, glowCircleX[i]-50, glowCircleY[i]);
  }
  //isCollision();
}

/*  image(glowCircle, width/2-200, height/2-50);
 image(glowCircle, width/2-200, height/2+50);
 if(mouseX == width/2-200 && mouseY == height/2 && mousePressed)
 */


boolean isCollision()
{
  for (int i=0; i<circleNumber; )
  {
    if (dist(mouseX, mouseY, glowCircleX[i], glowCircleY[i])<20 && sceneNumber == 1)
    {
      background(0);
      return true;
    }
  }
  return false;
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

/*
readMe
 <h1> The Way of the Scale </h1>
 
 <h2> Description: My Unit project starts off with a necklace and a pendant. Once the pendant is clicked, it zooms into a balance
 with a few glowing circles on one side. When these circles are clicked a line appears above the scale.</h2>
 <h2> Inspiration: I found out from the past few projects that I enjoy usng circles, this time I used pictures instead though, to 
 challenge myself, as I have not used many pictures before in my projects. I used watchout4snakes to find different words that
 gave me sparks of part of an idea and after around 10 words I put this idea together. </h2>
 <h2> Screenshots: </h2>
 */