class DNA {
  float[] genes;
  
  DNA(int num) {
    genes = new float[num];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = random(0, 1);
    }
  }
  
  DNA(float[] newGenes) {
    genes = newGenes;
  }
  
  DNA crossover(DNA partner) {
    float[] child = new float[genes.length];
    int crossover = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover) {
        child[i] = genes[i];
      } else {
        child[i] = partner.genes[i];
      }
    }
    DNA newGenes = new DNA(child);
    return newGenes;
  }
  
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        genes[i] = random(0, 1);
      }
    }
  }
}