ArrayList<PVector> vertesies = new ArrayList<PVector>();
PVector point;
PVector prePoint;
PVector mid;
int n = 200;

void setup() {
  size(800, 700);
  vertesies.add(new PVector(width/2, 0));
  vertesies.add(new PVector(0, height));
  vertesies.add(new PVector(width, height));
  boolean found = false;
  while (!found) {
    point = new PVector(random(width), random(height));
    found = triangleContains(point);
  }
  stroke(255);
  background(0);
  noFill();
}

void draw() {
  for (int i = 0; i < n; i++) {
    mid = midPoint(point, randomP(vertesies));
    point(mid.x, mid.y);
    point = mid.copy();
  }
  saveFrame("animation/######.png");
}

PVector randomP(ArrayList<PVector> vectors) {
  return vectors.get(floor(random(vectors.size())));
}

PVector midPoint(PVector start, PVector end) {
  PVector mid = new PVector();
  mid.x = floor((start.x + end.x) / 2);
  mid.y = floor((start.y + end.y) / 2);
  return mid;
}

boolean triangleContains(PVector point) {
    float x = point.x;
    float y = point.y;
    float ax = vertesies.get(0).x;
    float ay = vertesies.get(0).y;
    float bx = vertesies.get(1).x;
    float by = vertesies.get(1).y;
    float cx = vertesies.get(2).x;
    float cy = vertesies.get(2).y;
    
    float det = (bx - ax) * (cy - ay) - (by - ay) * (cx - ax);
  
    return  det * ((bx - ax) * (y - ay) - (by - ay) * (x - ax)) > 0 &&
            det * ((cx - bx) * (y - by) - (cy - by) * (x - bx)) > 0 &&
            det * ((ax - cx) * (y - cy) - (ay - cy) * (x - cx)) > 0;

}
