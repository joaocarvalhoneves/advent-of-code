String loadString [];
int score1 = 0;
int score2 = 0;

void setup() {
  loadString = loadStrings("data.txt");

  for (int i = 0; i < loadString.length; i++) {
    String A = split(loadString[i], ',')[0];
    String B = split(loadString[i], ',')[1];
    int A_ini = int(split(A, '-')[0]);
    int A_end = int(split(A, '-')[1]);
    int B_ini = int(split(B, '-')[0]);
    int B_end = int(split(B, '-')[1]);
    if((A_ini >= B_ini && A_end <= B_end) || (B_ini >= A_ini && B_end <= A_end))
    score1++;
    if(A_ini <= B_end && A_end >= B_ini)
    score2++;
  }

  //1*
  println(score1);
  //2*
  println(score2);
}
