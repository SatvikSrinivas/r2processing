
class Face {

  PVector normal;
  color c;  

  Face (PVector normal, color c) {
    this.normal = normal;
    this.c = c;
  }

  void turnZ(float angle) {
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.y * sin(angle));
    v2.y = round(normal.x * sin(angle) + normal.y * cos(angle));
    v2.z = round(normal.z);
    normal = v2;
  }

  void turnY(float angle) {
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.z * sin(angle));
    v2.z = round(normal.x * sin(angle) + normal.x * cos(angle));
    v2.y = round(normal.y);
    normal = v2;
  }

  void turnX(float angle) {
    PVector v2 = new PVector();
    v2.y = round(normal.y * cos(angle) - normal.z * sin(angle));
    v2.z = round(normal.y * sin(angle) + normal.z * cos(angle));
    v2.x = round(normal.x);
    normal = v2;
  }

  void show() {
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    if (abs(normal.y) > 0) 
      rotateX(HALF_PI);
    else if (abs(normal.x) > 0) 
      rotateY(HALF_PI);
    float k = 4.01;
    translate(k*normal.x, k*normal.y, k*normal.z);
    square(0, 0, 2);
    popMatrix();
  }
}
