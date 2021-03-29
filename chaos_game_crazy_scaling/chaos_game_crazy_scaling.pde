float factor = 0;
int sides = 5;

ArrayList<PVector> vertices = new ArrayList<PVector>();
ArrayList<PVector> points = new ArrayList<PVector>();
PVector point;
PVector prePoint;
PVector mid;
int m = 5000;
float radius;
float angle;
int prev;

void setup() {
  size(600, 500);
  radius = min(width, height) / 2;
  angle = TWO_PI / sides;
  push();
  translate(radius + (width - radius * 2) / 2, radius);
  rotate(-HALF_PI);
  for (int i = 0; i < sides; i++) {
    float a = i * angle;
    float x = radius * cos(a);
    float y = radius * sin(a);
    vertices.add(new PVector(x, y));
  }
  pop();
  point = new PVector(width/2, height/2);
  background(0);
  noFill();
  colorMode(HSB);
}

void draw() {
  //background(0);
  translate(radius + (width - radius * 2) / 2, radius);
  rotate(-HALF_PI);
  generate(factor);
  for (PVector p : points) {
    point(p.x, p.y);
  }
  factor += 0.01;
  if (factor >= 0.5) {
    noLoop();
  }
}

PVector randomP(ArrayList<PVector> vectors) {
  return vectors.get(floor(random(vectors.size())));
}

PVector midPoint(PVector start, PVector end, float fact) {
  PVector mid = new PVector();
  mid.x = floor((start.x + end.x) * fact);
  mid.y = floor((start.y + end.y) * fact);
  return mid;
}

void generate(float fact) {
  points = new ArrayList<PVector>();
  for (int i = 0; i < m; i++) {
    int r = floor(random(vertices.size()));
    mid = midPoint(point, vertices.get(r), fact);
    if (r != prev) {
      stroke(map(r, 0, vertices.size(), 0, 255), 255, 255);
      point = mid.copy();
      points.add(mid);
    }
    prev = r; 
  }
}
