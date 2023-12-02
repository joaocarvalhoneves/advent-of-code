String loadString [];
IntList calibration = new IntList();
IntList newCalibration = new IntList();
int star1 = 0;
int star2 = 0;
String num [] = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
int numm [] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

loadString = loadStrings("data.txt");

for (int i = 0; i < loadString.length; i++) {
  IntList firstN = new IntList();
  IntList lastN = new IntList();
  IntList firstL = new IntList();
  IntList lastL = new IntList();

  for (int j = 0; j < loadString[i].length(); j++) {

    for (int k = 0; k < 10; k++) {
      if (str(loadString[i].charAt(j)).equals(str(k))) {
        firstN.append(j);
        firstN.append(k);
        break;
      }
    }

    for (int k = 0; k < num.length; k++) {
      if (j+num[k].length() <= loadString[i].length()) {
        if (loadString[i].substring(j, j + num[k].length()).equals(num[k])) {
          firstL.append(j);
          firstL.append(numm[k]);
        }
      }
    }
  }

  for (int j = loadString[i].length() - 1; j >= 0; j--) {
    for (int k = 0; k < 10; k++) {
      if (str(loadString[i].charAt(j)).equals(str(k))) {
        lastN.append(j);
        lastN.append(k);
        break;
      }
    }

    for (int k = 0; k < num.length; k++) {
      if (j+num[k].length() <= loadString[i].length()) {
        if (loadString[i].substring(j, j + num[k].length()).equals(num[k])) {
          lastL.append(j);
          lastL.append(numm[k]);
        }
      }
    }
  }

  calibration.append(int(firstN.get(1) + "" + lastN.get(1)));

  int finalFirst;
  int finalLast;


  if (firstL.size() > 0) {
    if (firstL.get(0) < firstN.get(0)) finalFirst = firstL.get(1);
    else finalFirst = firstN.get(1);
  } else finalFirst = firstN.get(1);

  if (lastL.size() > 0) {
    if (lastL.get(0) > lastN.get(0)) finalLast = lastL.get(1);
    else finalLast = lastN.get(1);
  } else finalLast = lastN.get(1);

 newCalibration.append(int(finalFirst + "" + finalLast));
}

  println(newCalibration.get(7));
for (int i = 0; i < calibration.size(); i++) {
  star1+= calibration.get(i);
}

for (int i = 0; i < newCalibration.size(); i++) {
  star2+= newCalibration.get(i);
}


// 1*
println(star1);
// 2*
println(star2);
