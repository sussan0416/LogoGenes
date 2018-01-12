Population population;
Button button;

void setup() {
  size(1400, 400);
  colorMode(RGB, 1.0);
  int popMax = 4;
  float mutationRate = 0.05;
  
  population = new Population(mutationRate, popMax);
  button = new Button(15,370,160,20, "evolve new generation");
}

void draw() {
  background(1.0);
  // Display the faces
  population.display();
  population.rollover(mouseX,mouseY);
  // Display some text
  textAlign(LEFT);
  fill(0);
  text("Generation #:" + population.getGenerations(),15,350);

  // Display the button
  button.display();
  button.rollover(mouseX,mouseY);
}

// If the button is clicked, evolve next generation
void mousePressed() {
  if (button.clicked(mouseX,mouseY)) {
    population.selection();
    population.reproduction();
  }
}

void mouseReleased() {
  button.released();
}