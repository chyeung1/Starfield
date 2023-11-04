Particle[] balls = new Particle[100];
PImage img;
void setup()
{
  size(500,500);
  img = loadImage("https://cdn.dekudeals.com/images/2d9f6ffaabfb6871101f29dd4d82b1ab0b537d33/w500.jpg");
  for(int i = 0; i < balls.length; i++)
  {
    if(i < 90)
    balls[i] = new Particle();
    else
    balls[i] = new OddballParticle();
  }
}
void draw()
{
  background(img);
  fill(0);
  textAlign(CENTER,CENTER); 
  textSize(25);
  text("Great game with absolutely no issues at all", 250, 450);
  text("(I was bored ok)", 250, 480);
  for(int i = 0; i < balls.length - 10; i++)
  {
    balls[i].move();
    balls[i].show();
    if(balls[i].getX() < 0 || balls[i].getX() > 500)
    {
    if(balls[i].getY() < 0 || balls[i].getY() > 500)
      {
        balls[i].setX(250);
        balls[i].setY(250);
        balls[i].setColor(color((int)(Math.random() * 255), 0, 0));
        balls[i].setSpeed(balls[i].getSpeed() *  1.1);
      }
    }
    if(balls[i].getSpeed() > 100)
    balls[i].setSpeed(Math.random() * 5);
  }
  for(int i = 90; i < balls.length ; i++)
  {
    balls[i].move();
    balls[i].show();
    if(balls[i].getX() < 0 || balls[i].getX() > 500)
    {
    if(balls[i].getY() < 0 || balls[i].getY() > 500)
      {
        balls[i].setX(250);
        balls[i].setY(250);
      }
    }
  }
}

void mousePressed()
{
  for(int i = 90; i < balls.length ; i++)
  {
      balls[i].setX(250);
      balls[i].setY(250);
      balls[i].setSpeed(Math.random() * 5);
  }
  for(int i = 0; i < balls.length - 10; i++)
  {
     balls[i].setX(250);
     balls[i].setY(250);
     balls[i].setColor(color((int)(Math.random() * 255), 0, 0));
     balls[i].setSpeed(Math.random() * 5 + 3);
  }
}

class Particle
{
  private int mySize;
  private double myX, myY, mySpeed, myAngle;
  private color myColor;
  public Particle()
  {
    mySize = 10;
    myX = 250;
    myY = 250;
    myColor = color(255, 0, 0);
    mySpeed = Math.random() * 5;
    myAngle = Math.random() * 360;
  }  
  public void move()
  {
   myX += Math.cos(myAngle) * mySpeed;
   myY += Math.sin(myAngle) * mySpeed;
  }  
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }  
  public void setX(double x)
  {
    myX = x;
  }  
  public void setY(double y)
  {
    myY = y;
  }  
  public float getX()
  {
    return (float)myX;
  }
  public float getY() 
  {
    return (float)myY;
  }
  public void setColor(color c)
  {
    myColor = c;
  }
  public double getAngle()
  {
    return myAngle;
  }
  public void setAngle(double a)
  {
    myAngle = a;
  }
  public void setSpeed(double s)
  {
    mySpeed = s;
  }
  public double getSpeed()
  {
    return mySpeed;
  }
  public void setSize(int e)
  {
    mySize = e;
  }
}

class OddballParticle extends Particle//inherits from Particle
{
 public OddballParticle()
 {
   setSize(25);
   setAngle((Math.random() * 60));
   setColor(color(255));
   setSpeed(Math.random() * 5 + 3);
 }
 
 public void move()
 {
   setX(getX() + Math.tan(getAngle()) * getSpeed());
   setY(getX() + Math.tan(getAngle()) * getSpeed());
 }
}
