float factor = 2;
int sides = 5;

ArrayList<PVector> vertices = new ArrayList<PVector>();
PVector point;
PVector prePoint;
PVector mid;
int m = 500;
float r;
float angle;
int prev;

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
  background(0);
  noFill();
  colorMode(HSB);
}

void draw() {
  translate(r + (width - r * 2) / 2, r);
  rotate(-HALF_PI);
  for (int i = 0; i < m; i++) {
    int r = floor(random(vertices.size()));
    mid = midPoint(point, vertices.get(r));
    if (r != prev) {
      stroke(map(r, 0, vertices.size(), 0, 255), 255, 255, 100);
      point(mid.x, mid.y);
      point = mid.copy();
    }
    prev = r; 
  }
}

PVector randomP(ArrayList<PVector> vectors) {
  return vectors.get(floor(random(vectors.size())));
}

PVector midPoint(PVector start, PVector end) {
  PVector mid = new PVector();
  mid.x = floor((start.x + end.x) / factor);
  mid.y = floor((start.y + end.y) / factor);
  return mid;
}
