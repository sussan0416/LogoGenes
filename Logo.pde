class Logo {
  DNA dna;
  float fitness;
  float x, y;
  int wh = 150;
  boolean isRollover;
  Rectangle r;
  
  Logo(DNA dna_, float x_, float y) {
    dna = dna_;
    x = x_;
    y = y_;
    fitness = 1;
    r = new Rectangle(int(x - wh / 2), int(y - wh / 2), wh, wh);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    
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
    if (isRollover) {
      fill(0);
    } else {
      fill(0.25);
    }
    text(int(fitness), x, y + 100);
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
      fitness + 0.25;
    } else {
      isRollover = false;
    }
  }
}