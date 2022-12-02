String loadString [];
int score1 = 0;
int score2 = 0;

void setup() {
  loadString = loadStrings("data.txt");

  for (int i = 0; i < loadString.length; i++) {
    score1+= getScore(loadString[i].charAt(0), loadString[i].charAt(2));
    score2+= elfWoke(loadString[i].charAt(0), loadString[i].charAt(2));
  }

  //1*
  println(score1);
  //2*
  println(score2);
}

int elfWoke(char a, char b) {
  int output = 0;
  if (a == 'A') {
    if (b == 'X') output = 3;
    else if (b == 'Y') output = 4;
    else if (b == 'Z') output = 8;
  } else if (a == 'B') {
    if (b == 'X') output = 1;
    else  if (b == 'Y')  output = 5;
    else if (b == 'Z')  output = 9;
  } else if (a == 'C') {
    if (b == 'X')  output = 2;
    else if (b == 'Y') output = 6;
    else if (b == 'Z')  output = 7;
  }
  return output;
}

int getScore(char a, char b) {
  int output = 0;
  if (a == 'A') {
    if (b == 'X') output+= 3+1;
    else if (b == 'Y') output+= 6+2;
    else if (b == 'Z') output+= 3;
  } else if (a == 'B') {
    if (b == 'X') output+= 1;
    else  if (b == 'Y') output+= 3+2;
    else if (b == 'Z') output+= 6+3;
  } else if (a == 'C') {
    if (b == 'X') output+= 6+1;
    else if (b == 'Y') output+= 2;
    else if (b == 'Z') output+= 3+3;
  }
  return output;
}
