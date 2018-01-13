class Population {
  float mutationRate;
  Logo[] population;
  ArrayList<Logo> matingPool;
  int generations;
  int wh = 250;
  
  Population(float m, int num) {
    mutationRate = m;
    population = new Logo[num];
    matingPool = new ArrayList<Logo>();
    generations = 0;
    for (int i = 0; i < population.length; i++) {
      population[i] = new Logo(new DNA(16), 10 + wh / 2 + i * (wh + 10), 10 + wh / 2);
    }
  }
  
  void display() {
    for (int i = 0; i < population.length; i++) {
      population[i].display();
    }
  }
  
  void rollover(int mx, int my) {
    for (int i = 0; i < population.length; i++) {
      population[i].rollover(mx, my);
    }
  }
  
  void selection() {
    matingPool.clear();
    
    float maxFitness = getMaxFitness();
    
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }
  
  void reproduction() {
    for (int i = 0; i < population.length; i++) {
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      Logo mom = matingPool.get(m);
      Logo dad = matingPool.get(d);
      DNA momGenes = mom.getDNA();
      DNA dadGenes = dad.getDNA();
      DNA child = momGenes.crossover(dadGenes);
      child.mutate(mutationRate);
      population[i] = new Logo(child, 10 + wh / 2 + i * (wh + 10), 10 + wh / 2);
    }
    generations++;
  }
  
  int getGenerations() {
    return generations;
  }
  
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].getFitness() > record) {
        record = population[i].getFitness();
      }
    }
    return record;
  }
}