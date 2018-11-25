float pseudoRandom() {
 return random(0,1); 
}

float perlinRandom(float seed) {
  return noise(seed);
}
