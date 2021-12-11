String lines [];
StringList list = new StringList ();
Octopus o [][]= new Octopus [10][10];
int step = 0;
int flashednum = 0;
int sim;
StringList flashed = new StringList();


void setup() {
  size(460, 460);
  textSize(16);
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
  }
  textAlign(CENTER, CENTER);
  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      o[r][c] = new Octopus(50+c*40, 50+r*40, Integer.valueOf(lines[r].charAt(c)-48));
    }
  }
}

void draw() {
  background(#01295D);
  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      o[r][c].show();
    }
  }
  fill(255);
  textSize(13);
  text("After step " + step, 50, 10);
  textSize(15);
}

void mousePressed() {
  step++;
  sim = 0;
  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      o[r][c].resetF();
      o[r][c].energy();
    }
  }

  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      if (o[r][c].getE() >= 10)
        flashed.append(r + "" + c);
    }
  }


  while (flashed.size() > 0) {
    for (int i = flashed.size()-1; i >= 0; i--) {
      int row = Integer.valueOf(flashed.get(i).charAt(0)-48);
      int column = Integer.valueOf(flashed.get(i).charAt(1)-48);
      o[row][column].resetE();
      flashednum++;
      sim++;


      if (row-1 >= 0 && column-1 >= 0) o[row-1][column-1].energy();
      if (row-1 >= 0) o[row-1][column].energy();
      if (row-1 >= 0 && column+1 < 10) o[row-1][column+1].energy();
      if (column-1 >= 0) o[row][column-1].energy();
      if (column+1 < 10) o[row][column+1].energy();
      if (row+1 < 10 && column-1 >= 0) o[row+1][column-1].energy();
      if (row+1 < 10) o[row+1][column].energy();
      if (row+1 < 10 && column+1 < 10) o[row+1][column+1].energy();

      flashed.remove(i);
    }

    for (int r = 0; r < 10; r++) {
      for (int c = 0; c < 10; c++) {
        if (o[r][c].getE() >= 10) {
          if (!o[r][c].getF())
            flashed.append(r + "" + c);
          o[r][c].resetE();
        }
      }
    }
  }
  flashed.clear();

  if (step == 100) println("first * " + flashednum);
  if (sim == 100) println("second * " + step);
}



class Octopus {
  int x;
  int y;
  int num;
  boolean flashed = false;

  Octopus(int x, int y, int num) {
    this.x = x;
    this.y = y;
    this.num = num;
  }

  void show() {
    if (flashed)
      stroke(255, 0, 0);
    else
      noStroke();
    if (num == 0)
      fill(255, 255, 0);
    else
      fill(255);
    ellipse(x, y, 30, 30);
    fill(#01295D);
    text(num, x, y-2);
  }

  void energy() {
    if (!flashed)
      num++;
  }

  void resetF() {
    flashed = false;
  }

  void resetE() {
    flashed = true;
    num = 0;
  }


  int getE() {
    return num;
  }

  boolean getF() {
    return flashed;
  }
}
