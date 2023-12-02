String loadString [];
int star1 = 0;
int star2 = 0;
String impossible [][] = {{"12", "r"}, {"13", "g"}, {"14", "b"}};

loadString = loadStrings("data.txt");

for (int i = 0; i < loadString.length; i++) {
  String cubeLine = loadString[i].split(": ")[1];
  String wordsLine [] = cubeLine.split(" ");
  boolean possible = true;
  IntList amountR = new IntList();
  IntList amountG = new IntList();
  IntList amountB = new IntList();
 
  for (int j = 0; j < wordsLine.length; j++) {
    for (int k = 0; k < impossible.length; k++) {
      if (str(wordsLine[j].charAt(0)).equals(impossible[k][1])) {
        if (int(wordsLine[j-1]) > int(impossible[k][0]))
          possible = false;         
        if(k == 0) amountR.append(int(wordsLine[j-1])); else
        if(k == 1) amountG.append(int(wordsLine[j-1])); else
        if(k == 2) amountB.append(int(wordsLine[j-1]));                
      }
    }
  }
  if(possible) star1+= i + 1;
  star2+=amountR.max()*amountG.max()*amountB.max();
}

// 1*
println(star1);
// 2*
println(star2);
