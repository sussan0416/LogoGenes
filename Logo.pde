class Logo {
  DNA dna;
  float fitness;
  float x, y;
  int wh = 250;
  boolean isRollover;
  Rectangle r;
  PFont helvetica;
  PFont nomal;
  
  Logo(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_;
    y = y_;
    fitness = 1;
    r = new Rectangle(int(x - wh / 2), int(y - wh / 2), wh, wh);
    helvetica = createFont("HelveticaNeue-Bold", 40);
    nomal = createFont("SansSerif", 12);
  }
  
  void display() {
    int safeArea = wh / 2 - 10;
    int maxRectSize = 30;
    float textX = map(dna.genes[0], 0, 1, -safeArea, safeArea);
    float textY = map(dna.genes[1], 0, 1, -safeArea, safeArea);
    float textSize = map(dna.genes[2], 0, 1, 5, 40);
    float rectX = map(dna.genes[3], 0, 1, -safeArea, safeArea);
    float rectY = map(dna.genes[4], 0, 1, -safeArea, safeArea);
    float rectSize = map(dna.genes[5], 0, 1, 5, maxRectSize);
    float rectX2 = map(dna.genes[6], 0, 1, -safeArea, safeArea);
    float rectY2 = map(dna.genes[7], 0, 1, -safeArea, safeArea);
    float rectSize2 = map(dna.genes[8], 0, 1, 5, maxRectSize);
    float rectX3 = map(dna.genes[9], 0, 1, -safeArea, safeArea);
    float rectY3 = map(dna.genes[10], 0, 1, -safeArea, safeArea);
    float rectSize3 = map(dna.genes[11], 0, 1, 5, maxRectSize);
    float rectHue = map(dna.genes[12], 0, 1, 0, 360);
    float rectHue2 = map(dna.genes[13], 0, 1, 0, 360);
    float rectHue3 = map(dna.genes[14], 0, 1, 0, 360);
    
    pushMatrix();
    translate(x, y);
    
    float dist21 = dist(rectX, rectY, rectX2, rectY2);
    float dist31 = dist(rectX, rectY, rectX3, rectY3);
    float dist32 = dist(rectX2, rectY2, rectX3, rectY3);
    
    float dist = 100;
    
    colorMode(RGB, 255);
    
    float max = dist32;
    if (dist21 >= dist32) {
      max = dist21;
    }
    if (dist31 >= max) {
      max = dist31;
    }
    if (max <= dist) {
      noStroke();
      fill(156, 156, 157, 255 - map(max, 0, dist, 0, 255));
      triangle(rectX, rectY, rectX2, rectY2, rectX3, rectY3);
    }
    
    strokeWeight(0.5);
    if (dist21 < dist) {
      int stroke = int(map(dist21, 0, dist, 100, 255));
      stroke(stroke);
      line(rectX, rectY, rectX2, rectY2);
    }
    if (dist31 < dist) {
      int stroke = int(map(dist31, 0, dist, 100, 255));
      stroke(stroke);
      line(rectX, rectY, rectX3, rectY3);
    }
    if (dist32 < dist) {
      int stroke = int(map(dist32, 0, dist, 100, 255));
      stroke(stroke);
      line(rectX2, rectY2, rectX3, rectY3);
    }
    
    colorMode(HSB, 360, 100, 100);
    noStroke();
    rectMode(CENTER);
    fill(rectHue, 100, 80);
    rect(rectX, rectY, rectSize, rectSize);
    fill(rectHue2, 100, 80);
    rect(rectX2, rectY2, rectSize2, rectSize2);
    fill(rectHue3, 100, 80);
    rect(rectX3, rectY3, rectSize3, rectSize3);
    
    colorMode(RGB, 1.0);
    
    fill(0);
    textAlign(CENTER);
    textFont(helvetica);
    textSize(textSize);
    text("Hello World.", textX, textY);
    
    rectMode(CENTER);
    
    stroke(0.25);
    if (isRollover) {
      fill(0, 0.25);
    } else {
      noFill();
    }
    rectMode(CENTER);
    rect(0, 0, wh, wh);
    
    popMatrix();
    
    textAlign(CENTER);
    textFont(nomal);
    if (isRollover) {
      fill(0);
    } else {
      fill(0.25);
    }
    textSize(12);
    text(int(fitness), x, y + wh / 2 + 20);
  }
  
  float getFitness() {
    return fitness;
  }
  
  DNA getDNA() {
    return dna;
  }
  
  void rollover(int mx, int my) {
    if (r.contains(mx, my)) {
      isRollover = true;
      fitness += 0.25;
    } else {
      isRollover = false;
    }
  }
}