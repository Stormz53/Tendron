class Tendril
{
  public final static int SEG_LENGTH = 4;
  private int myNumSegments, myX, myY;
  private double myAngle;


  public Tendril(int len, double theta, int x, int y)
  {
    myAngle = theta; 
    myX = x;      
    myY = y;         
    myNumSegments = len; 
  }
