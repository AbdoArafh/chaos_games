ArrayList<PVector> vertices = new ArrayList<PVector>();
PVector point;
PVector prePoint;
PVector mid;
int m = 500;
int sides = 3;
float r;
float angle;

void setup() {
  size(600, 500);
  r = min(width, height) / 2;
  angle = TWO_PI / sides;
  push();
  translate(r + (width - r * 2) / 2, r);
  rotate(-HALF_PI);
  for (int i = 0; i < sides; i++) {
    float a = i * angle;
    float x = r * cos(a);
    float y = r * sin(a);
    vertices.add(new PVector(x, y));
  }
  pop();
  point = new PVector(width/2, height/2);
  stroke(255);
  background(0);
  noFill();
}

void draw() {
  translate(r + (width - r * 2) / 2, r);
  rotate(-HALF_PI);
  for (int i = 0; i < m; i++) {
    mid = midPoint(point, randomP(vertices));
    point(mid.x, mid.y);
    point = mid.copy();
  }
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

//boolean triangleContains(PVector point) {
//    float x = point.x;
//    float y = point.y;
//    float ax = vertices.get(0).x;
//    float ay = vertices.get(0).y;
//    float bx = vertices.get(1).x;
//    float by = vertices.get(1).y;
//    float cx = vertices.get(2).x;
//    float cy = vertices.get(2).y;
    
//    float det = (bx - ax) * (cy - ay) - (by - ay) * (cx - ax);
  
//    return  det * ((bx - ax) * (y - ay) - (by - ay) * (x - ax)) > 0 &&
//            det * ((cx - bx) * (y - by) - (cy - by) * (x - bx)) > 0 &&
//            det * ((ax - cx) * (y - cy) - (ay - cy) * (x - cx)) > 0;

//}
