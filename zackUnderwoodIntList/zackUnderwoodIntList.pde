// Create space in memory for new IntList item 
IntList demoList;

void setup() {
  // insantiate IntList
  demoList = new IntList();


  // fill the int list with number 1 - 1000, one number at a time
  for(int i = 1; i<= 1000; i++) {
    demoList.append(i);
  }
}

void draw() {
  // show in console how many items are in the IntList
  println(demoList.size());
 
  }
}
 