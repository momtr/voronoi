import java.util.ArrayList;

ArrayList<Point> points;
final int anz = 50;
final int winSize = 800;
final int centroidSize = 10;

void setup() {
  size(800, 800);
  points = new ArrayList<Point>();
  for(int i = 0; i < anz; i++) {
    float x = random(width);
    float y = random(height);
    points.add(new Point(x, y));
  }
  loadPixels();
  for(int y = 0; y < winSize; y++) {
    for(int x = 0; x < winSize; x++) {
      int index = y * winSize + x;
      pixels[index] = getClosestPoint(x, y).col;
    }
  }
  updatePixels();
  for(Point i : points) {
    fill(0);
    noStroke();
    ellipse(i.x, i.y, centroidSize, centroidSize);
  }
}

Point getClosestPoint(int x, int y) {
  Point current = points.get(0);
  float currentDist = dist(current.x, current.y, x, y);
  for(Point i : points) {
    // eucledian distance
    float distance = dist(i.x, i.y, x, y);
    if(distance < currentDist) {
      currentDist = distance;
      current = i;
    }
  }
  return current;
}
