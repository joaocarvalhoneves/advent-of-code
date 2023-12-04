String loadString [];
int star1 = 0;
int star2 = 0;
int col;
int lin;
Element element [][];
IntList partNum = new IntList();
FloatList partSeeds = new FloatList();
int connect = 0;

void setup() {
  size(850, 855);
  pixelDensity(2);
  textAlign(CENTER, CENTER);
  textSize(8);

  loadString = loadStrings("data.txt");
  col = loadString.length;
  lin = loadString[0].length();
  element = new Element [col][lin];

  for (int i = 0; i < lin; i++) {
    for (int j = 0; j < col; j++) {
      boolean part = true;

      /*
      // 1*
       for (int k = 0; k < 10; k++) {
       String numS = "" + k;
       if (str(loadString[i].charAt(j)).equals(numS) || loadString[i].charAt(j) == '.')
       part = false;
       }
       element[j][i] = new Element(loadString[i].charAt(j), part);
       */

      // 2*
      if (loadString[i].charAt(j) != '*')
        part = false;
      element[j][i] = new Element(loadString[i].charAt(j), part);
    }
  }
}

boolean isNumber(int a, int b) {
  boolean c = false;
  if (a >= 0 && a < col && b >= 0 && b < lin && int(element[a][b].text) >= 48 && int(element[a][b].text) <= 57)
    c = true;
  return c;
}

void isNumber(int i, int j, int modi, int mody) {
  if (i+modi >= 0 && i+modi < col && j+mody >= 0 && j+mody < lin && int(element[i+modi][j+mody].text) >= 48 && int(element[i+modi][j+mody].text) <= 57) {
    if (modi == 0) {
      if (!(int(element[i-1][j+mody].text) >= 48 && int(element[i-1][j+mody].text) <= 57) && !(int(element[i+1][j+mody].text) >= 48 && int(element[i+1][j+mody].text) <= 57))
        connect++;
    } else connect++;
  }
}

void setNumber(int i, int j, int modi, int mody, float randomSeed) {
  if (i+modi >= 0 && i+modi < col && j+mody >= 0 && j+mody < lin && int(element[i+modi][j+mody].text) >= 48 && int(element[i+modi][j+mody].text) <= 57) {
    element[i+modi][j+mody].randomSeed = randomSeed;

    if (modi == 0) {
      if (!(int(element[i-1][j+mody].text) >= 48 && int(element[i-1][j+mody].text) <= 57) && !(int(element[i+1][j+mody].text) >= 48 && int(element[i+1][j+mody].text) <= 57)) {
        element[i][j+mody].part = true;
      }
    } else {
      element[i+modi][j+mody].part = true;
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < lin; i++) {
    for (int j = 0; j < col; j++) {
      element[i][j].draw(7 + i * 6, 7 + j * 6);
    }
  }

  /*
    // 1*
   for (int i = 0; i < lin; i++) {
   for (int j = 0; j < col; j++) {
   if (element[i][j].part && element[i][j].text != '.') {
   if (isNumber(i-1, j-1)) element[i-1][j-1].part = true;
   if (isNumber(i, j-1)) element[i][j-1].part = true;
   if (isNumber(i+1, j-1)) element[i+1][j-1].part = true;
   if (isNumber(i-1, j)) element[i-1][j].part = true;
   if (isNumber(i+1, j)) element[i+1][j].part = true;
   if (isNumber(i-1, j+1)) element[i-1][j+1].part = true;
   if (isNumber(i, j+1)) element[i][j+1].part = true;
   if (isNumber(i+1, j+1)) element[i+1][j+1].part = true;
   }
   }
   }
   */

  // 2*
  for (int i = 0; i < lin; i++) {
    for (int j = 0; j < col; j++) {
      if (element[i][j].part && element[i][j].randomSeed == 0) {
        connect = 0;
        isNumber(i, j, -1, -1);
        isNumber(i, j, 0, -1);
        isNumber(i, j, 1, -1);
        isNumber(i, j, -1, 0);
        isNumber(i, j, 1, 0);
        isNumber(i, j, -1, 1);
        isNumber(i, j, 0, 1);
        isNumber(i, j, 1, 1);
        
        if(int(element[i-1][j+1].text) >= 48 && int(element[i-1][j+1].text) <= 57 &&
        int(element[i][j+1].text) >= 48 && int(element[i][j+1].text) <= 57 &&
        int(element[i+1][j+1].text) >= 48 && int(element[i+1][j+1].text) <= 57)
        connect--;
        
         if(int(element[i-1][j-1].text) >= 48 && int(element[i-1][j-1].text) <= 57 &&
        int(element[i][j-1].text) >= 48 && int(element[i][j-1].text) <= 57 &&
        int(element[i+1][j-1].text) >= 48 && int(element[i+1][j-1].text) <= 57)
        connect--;
        
        if (connect == 2) {
          float randomSeed = random(1);
          setNumber(i, j, -1, -1, randomSeed);
          setNumber(i, j, 0, -1, randomSeed);
          setNumber(i, j, 1, -1, randomSeed);
          setNumber(i, j, -1, 0, randomSeed);
          setNumber(i, j, 1, 0, randomSeed);
          setNumber(i, j, -1, 1, randomSeed);
          setNumber(i, j, 0, 1, randomSeed);
          setNumber(i, j, 1, 1, randomSeed);
        }
      }
    }
  }

  // 1* 2*
  for (int i = 0; i < lin; i++) {
    for (int j = 0; j < col; j++) {
      if (!(int(element[i][j].text) >= 48 && int(element[i][j].text) <= 57))
        element[i][j].part = false;
    }
  }

  // 2*
  for (int i = 0; i < lin; i++) {
    for (int j = 0; j < col; j++) {
      if (element[i][j].part) {
        if (isNumber(i-1, j-1)) {
          element[i-1][j-1].part = true;
          element[i-1][j-1].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i, j-1)) {
          element[i][j-1].part = true;
          element[i][j-1].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i+1, j-1)) {
          element[i+1][j-1].part = true;
          element[i+1][j-1].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i-1, j)) {
          element[i-1][j].part = true;
          element[i-1][j].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i+1, j)) {
          element[i+1][j].part = true;
          element[i+1][j].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i-1, j+1)) {
          element[i-1][j+1].part = true;
          element[i-1][j+1].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i, j+1)) {
          element[i][j+1].part = true;
          element[i][j+1].randomSeed = element[i][j].randomSeed;
        }
        if (isNumber(i+1, j+1)) {
          element[i+1][j+1].part = true;
          element[i+1][j+1].randomSeed = element[i][j].randomSeed;
        }
      }
    }
  }



  partNum.clear();
  partSeeds.clear();

  String num = "";
  for (int j = 0; j < lin; j++) {
    if (num.length() > 0) {
      partNum.append(int(num));
      partSeeds.append(element[col-1][j-1].randomSeed);
    }
    num = "";
    for (int i = 0; i < col; i++) {
      if (element[i][j].part)
        num+= element[i][j].text;
      else {
        if (num.length() > 0) {
          partNum.append(int(num));
          partSeeds.append(element[i-1][j].randomSeed);
          num = "";
        }
      }
    }
  }
}

void mousePressed() {
  star1 = 0;
  for (int i = 0; i < partNum.size(); i++) {
    star1+= partNum.get(i);
  }

  star2 = 0;

  for (int i = 0; i < partSeeds.size(); i++) {
    for (int j = 0; j < partSeeds.size(); j++) {

      if (i != j && partSeeds.get(i) == partSeeds.get(j)) {
        star2+= partNum.get(i) * partNum.get(j);
        partNum.set(i, 0);
        partNum.set(j, 0);
      }
    }
  }

  // 1*
  println(star1);
  // 2*
  println(star2);
}

class Element {
  char text;
  boolean part;
  float randomSeed = 0;

  Element (char text, boolean part) {
    this.text = text;
    this.part = part;
  }

  void draw(float x, float y) {
    int offsetY = 0;
    if (text == '.') offsetY-= 2;
    if (part) fill(#3EFFAD);
    else fill(#FFB427);
    text(text, x, y + offsetY);
  }
}
