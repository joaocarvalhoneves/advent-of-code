String loadString [];
int star1 = 0;
int star2 = 0;

void setup() {
  loadString = loadStrings("data.txt");

  int cardPoints [] = new int [loadString.length];

  for (int i = 0; i < cardPoints.length; i++) {
    cardPoints[i] = 1;
  }

  for (int i = 0; i < loadString.length; i++) {
    String split = split(loadString[i], ": ")[1];
    String winNumStr = split(split, " | ")[0];
    String myNumStr = split(split, " | ")[1];

    IntList winNum = new IntList();
    IntList myNum = new IntList();

    buildList(winNumStr, winNum);
    buildList(myNumStr, myNum);

    int points1 = 0;

    // Comment line 28 and 45 for *1
    for (int l = 0; l < cardPoints[i]; l++) {
      int points2 = 0;
      for (int j = 0; j < winNum.size(); j++) {
        for (int k = 0; k < myNum.size(); k++) {
          if (winNum.get(j) == myNum.get(k)) {
            points2++;
            if (points1 == 0) {
              points1++;
            } else
              points1*=2;
          }
        }
      }

      for (int j = 0; j < points2; j++) {
        cardPoints[i+1+j]++;
      }
    }

    star1+= points1;
  }

  for (int i = 0; i < cardPoints.length; i++) {
    star2+=cardPoints[i];
  }

  // 1*
  println(star1);
  // 2*
  println(star2);
}

void buildList(String toSplit, IntList toAdd) {
  String num = "";
  for (int j = 0; j < toSplit.length(); j++) {
    if (isNumber(toSplit.charAt(j)))
      num+= toSplit.charAt(j);
    else {
      if (num.length() > 0)
        toAdd.append(int(num));
      num = "";
    }
  }
  toAdd.append(int(num));
}

boolean isNumber(char a) {
  boolean r = false;
  if (a >= 46 && a <= 57)
    r = true;
  return r;
}
