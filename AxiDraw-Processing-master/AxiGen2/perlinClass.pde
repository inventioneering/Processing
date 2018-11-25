class Perlin {
  // Data
  float currentTime;
  float currentValue;
  float delta;
  
  // Constructor
  Perlin(float seed, float delta)
  {
    this.delta = delta;
    currentTime = seed + delta;
    currentValue = noise(currentTime);
  }
  
  // Methods
  void update() {
    currentTime += this.delta;
    currentValue = noise(currentTime);
  }
  
  float getCurrentValue() {
    this.update();
    return this.currentValue;
  }
  
}
