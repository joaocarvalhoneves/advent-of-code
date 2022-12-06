String loadString [];
int score1 = 0;
int score2 = 0;

void setup() {
  loadString = loadStrings("data.txt");

  for (int i = 0; i < loadString.length; i++) {
    int got = 0;
    for (int j = 0; j < loadString[i].length()/2; j++) {
      for (int k = loadString[i].length()/2; k < loadString[i].length(); k++) {
        if (int(loadString[i].charAt(j)) == int(loadString[i].charAt(k)) && got == 0) {
          setScore(int(loadString[i].charAt(j)), 0);
          got++;
        }
      }
    }
  }

  for (int i = 0; i < loadString.length; i+=3) {
    int got = 0;
    for (int j = 0; j < loadString[i].length(); j++) {
      for (int k = 0; k < loadString[i+1].length(); k++) {
        for (int l = 0; l < loadString[i+2].length(); l++) {
          if (loadString[i].charAt(j) == loadString[i+1].charAt(k) && loadString[i+1].charAt(k) == loadString[i+2].charAt(l) && got == 0) {
            setScore(int(loadString[i].charAt(j)), 1);
            got++;
          }
        }
      }
    }
  }
  //1*
  println(score1);
  //2*
  println(score2);
}

void setScore(int num, int challenge) {
  if (challenge == 0) {
    if (num > 97) score1+= num - 96;
    else score1+= num-64+26;
  } else {
    if (num > 97) score2+= num - 96;
    else score2+= num-64+26;
  }
}
