String loadString [];
int score = 0;
boolean stop = false;

void setup() {
  loadString = loadStrings("data.txt");
  // for (int i = 0; i < loadString[0].length()-4; i++) {
  for (int i = 0; i < loadString[0].length()-14; i++) {
    if (!stop) {
      // char check [] = new char[4];
      char check [] = new char[14];
      for (int j = 0; j < check.length; j++) {
        check[j] = loadString[0].charAt(i+j);
      }
      boolean dif = true;
      for (int j = 0; j < check.length; j++) {
        for (int k = 0; k < check.length; k++) {
          if (j != k && check[j] == check[k]) {
            dif = false;
          }
        }
      }
      if (dif) {
        stop = true;
        // score = i+4;
        score = i+14;
      }
    }
  }

  println(score);
}
