float[][] polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  noFill();
  stroke(255);
  int i = 0;
  float[][] vertices = new float[npoints+1][2];
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);

    vertices[i][0] = sx;
    vertices[i][1] = sy;
    i = i+1;
  }
  endShape(CLOSE);
  return vertices;
}

int[] draw_euclidian(float x, float y, float radius, int npoints, int pulses) {
  int[] pat = bjorklund(npoints, pulses); // n, k
  float[][] polygon_v = polygon(x, y, radius, npoints);  
  for (int i=0; i<npoints; i++) {
    if (pat[i]==1) {
      fill(255);
      ellipse(polygon_v[i][0], polygon_v[i][1], 10, 10);
      noFill();
    }
  }
  return pat;
}
