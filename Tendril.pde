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

  public void show()
  {
    int startX = myX;
    int startY = myY;

    stroke(0, 255 - (myNumSegments * 50), 40);

    for (int i = 0; i < myNumSegments; i++)
    {
     
      myAngle += Math.random() * 0.4 - 0.2;
      // Calculate the end position of the current segment
      int endX = (int)(startX + Math.cos(myAngle) * SEG_LENGTH);
      int endY = (int)(startY + Math.sin(myAngle) * SEG_LENGTH);

      if (i > myNumSegments - 3) {
        stroke((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
      }

      line(startX, startY, endX, endY);


      startX = endX;
      startY = endY;
    }

    if (myNumSegments >= 3) {
      new Cluster(myNumSegments / 3, startX, startY); 
    }
  }
}

class Cluster
{
  public final static int NUM_STEMS = 7; 

  public Cluster(int len, int x, int y)
  {

    for (int i = 0; i < NUM_STEMS; i++) {

      Tendril t = new Tendril(len, i * ((2 * Math.PI) / NUM_STEMS), x, y);
      t.show(); 
    }
  }
}


void setup() {
  size(600, 600); 
 
  Tendril t = new Tendril(20, 0, 300, 300);
  t.show();


  Cluster c = new Cluster(10, 300, 300); 
}

