void setup() {
  size(600, 600); 
 
  Tendril t = new Tendril(20, 0, 300, 300);
  t.show();


  Cluster c = new Cluster(10, 300, 300); 
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
