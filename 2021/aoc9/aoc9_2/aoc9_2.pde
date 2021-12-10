String lines [];
int c = 100;
int r = 100;
int list [][] = new int [r][c];
Number n [][] = new Number [r][c];
int result = 0;
IntList basinsize = new IntList ();
StringList basinsizen = new StringList ();

void setup() {
  background(255);
  textSize(10);
  size(1000, 1000);
  textAlign(CENTER, CENTER);
  lines = loadStrings("list.txt");
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      list[i][j] = char(lines[i].charAt(j)) - 48;
    }
  }

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      n[i][j] = new Number(5+j*10, 5+i*10, list[i][j]);
      n[i][j].setHigh();
    }
  }

  // CORNERS
  if (list[0][0] < list[0][1] && list[0][0] < list[1][0]) {
    result+= list[0][0]+1;
    n[0][0].setLow();
  }
  if (list[r-1][0] < list[r-2][0] && list[r-1][0] < list[r-1][1]) {
    result+= list[r-1][0]+1;
    n[r-1][0].setLow();
  }
  if (list[0][c-1] < list[0][c-2] && list[0][c-1] < list[1][c-1]) {
    result+= list[0][c-1]+1;
    n[0][c-1].setLow();
  }
  if (list[r-1][c-1] < list[r-2][c-1] && list[r-1][c-1] < list[r-1][c-2]) {
    result+= list[r-1][c-1]+1;
    n[r-1][c-1].setLow();
  }

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (!((i == 0 && j == 0) || (i == r-1 && j == 0) || (i == 0 && j == c-1) || (i == r-1 && j == c-1))) {

        // UPPER BORDER
        if (i == 0) {
          if (list[i][j] < list[i][j-1] && list[i][j] < list[i][j+1] && list[i][j] < list[i+1][j]) {
            result+= list[i][j]+1;
            n[i][j].setLow();
          }
        }

        // DOWN BORDER
        if (i == r-1) {
          if (list[i][j] < list[i][j-1] && list[i][j] < list[i][j+1] && list[i][j] < list[i-1][j]) {
            result+= list[i][j]+1;
            n[i][j].setLow();
          }
        }

        // LEFT BORDER
        if (j == 0) {
          if (list[i][j] < list[i-1][j] && list[i][j] < list[i+1][j] && list[i][j] < list[i][j+1]) {
            result+= list[i][j]+1;
            n[i][j].setLow();
          }
        }

        // RIGHT BORDER
        if (j == c-1) {
          if (list[i][j] < list[i-1][j] && list[i][j] < list[i+1][j] && list[i][j] < list[i][j-1]) {
            result+= list[i][j]+1;
            n[i][j].setLow();
          }
        }


        // REMAINING (CENTER)
        if (!(i == 0 || i == r-1 || j == 0 || j == c-1)) {
          if (list[i][j] < list[i-1][j] &&
            list[i][j] < list[i+1][j] &&
            list[i][j] < list[i][j-1] &&
            list[i][j] < list[i][j+1]) {
            result+= list[i][j]+1;
            n[i][j].setLow();
          }
        }
      }
    }
  }
  println("first * " + result);
  int basin = 0;
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (n[i][j].getMin()) {
        basin++;
        int c1;
        int c2 = 0;
        if (basin == 34)c2 = 50;
        if (basin == 50) c2 = 170;
        if (basin == 126) c2 = 255;
        n[i][j].setMost(c2);

        c1 = basin;

        ////////////////// LEFT OF MIN
        int k1 = 0;
        while (j-k1 >= 0) {
          if (n[i][j-k1].getNum() < 9) {
            n[i][j-k1].basin(c1);
            n[i][j-k1].setMost(c2);

            //// UP OF LEFT
            int h1 = 0;
            while (i-h1 >= 0) {
              if (n[i-h1][j-k1].getNum() < 9) {
                n[i-h1][j-k1].basin(c1);
                n[i-h1][j-k1].setMost(c2);


                ////// LEFT OF UP OF LEFT
                int g1 = 0;
                while (j-g1-k1 >= 0) {
                  if (n[i-h1][j-k1-g1].getNum() < 9) {
                    n[i-h1][j-k1-g1].basin(c1);
                    n[i-h1][j-k1-g1].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// RIGHT OF UP OF LEFT
                int g2 = 0;
                while (j+g2-k1 < r) {
                  if (n[i-h1][j-k1+g2].getNum() < 9) {
                    n[i-h1][j-k1+g2].basin(c1);
                    n[i-h1][j-k1+g2].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h1++;
            }

            //// DOWN OF LEFT
            int h2 = 0;
            while (i+h2 < r) {
              if (n[i+h2][j-k1].getNum() < 9) {
                n[i+h2][j-k1].basin(c1);
                n[i+h2][j-k1].setMost(c2);


                ////// LEFT OF DOWN OF LEFT
                int g1 = 0;
                while (j-g1-k1 >= 0) {
                  if (n[i+h2][j-k1-g1].getNum() < 9) {
                    n[i+h2][j-k1-g1].basin(c1);
                    n[i+h2][j-k1-g1].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// RIGHT OF DOWN OF LEFT
                int g2 = 0;
                while (j+g2-k1 < r) {
                  if (n[i+h2][j-k1+g2].getNum() < 9) {
                    n[i+h2][j-k1+g2].basin(c1);
                    n[i+h2][j-k1+g2].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h2++;
            }
          } else break;
          k1++;
        }


        ////////////////// RIGHT OF MIN
        int k2 = 0;
        while (j+k2 < c) {
          if (n[i][j+k2].getNum() < 9) {
            n[i][j+k2].basin(c1);
            n[i][j+k2].setMost(c2);

            //// UP OF RIGHT
            int h1 = 0;
            while (i-h1 >= 0) {
              if (n[i-h1][j+k2].getNum() < 9) {
                n[i-h1][j+k2].basin(c1);
                n[i-h1][j+k2].setMost(c2);

                ////// LEFT OF UP OF RIGHT
                int g1 = 0;
                while (j-g1+k2 >= 0) {
                  if (n[i-h1][j-g1+k2].getNum() < 9) {
                    n[i-h1][j-g1+k2].basin(c1);
                    n[i-h1][j-g1+k2].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// RIGHT OF UP OF RIGHT
                int g2 = 0;
                while (j+g2+k2 < c) {
                  if (n[i-h1][j+g2+k2].getNum() < 9) {
                    n[i-h1][j+g2+k2].basin(c1);
                    n[i-h1][j+g2+k2].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h1++;
            }

            //// DOWN OF RIGHT
            int h2 = 0;
            while (i+h2 < r) {
              if (n[i+h2][j+k2].getNum() < 9) {
                n[i+h2][j+k2].basin(c1);
                n[i+h2][j+k2].setMost(c2);

                ////// LEFT OF DOWN OF RIGHT
                int g1 = 0;
                while (j-g1+k2 >= 0) {
                  if (n[i+h2][j-g1+k2].getNum() < 9) {
                    n[i+h2][j-g1+k2].basin(c1);
                    n[i+h2][j-g1+k2].setMost(c2);
                  } else break;
                  g1++;
                }


                ////// RIGHT OF DOWN OF RIGHT
                int g2 = 0;
                while (j+g2+k2 < c) {
                  if (n[i+h2][j+g2+k2].getNum() < 9) {
                    n[i+h2][j+g2+k2].basin(c1);
                    n[i+h2][j+g2+k2].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h2++;
            }
          } else break;
          k2++;
        }


        ////////////////// DOWN OF MIN
        int k3 = 0;
        while (i+k3 < r) {
          if (n[i+k3][j].getNum() < 9) {
            n[i+k3][j].basin(c1);
            n[i+k3][j].setMost(c2);

            ////   LEFT OF DOWN
            int h1 = 0;
            while (j-h1 >= 0) {
              if (n[i+k3][j-h1].getNum() < 9) {
                n[i+k3][j-h1].basin(c1);
                n[i+k3][j-h1].setMost(c2);

                ////// UP OF LEFT OF DOWN
                int g1 = 0;
                while (i-g1+k3 >= 0) {
                  if (n[i-g1+k3][j-h1].getNum() < 9) {
                    n[i-g1+k3][j-h1].basin(c1);
                    n[i-g1+k3][j-h1].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// DOWN OF LEFT OF DOWN
                int g2 = 0;
                while (i+g2+k3 < r) {
                  if (n[i+g2+k3][j-h1].getNum() < 9) {
                    n[i+g2+k3][j-h1].basin(c1);
                    n[i+g2+k3][j-h1].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h1++;
            }

            //// RIGHT OF DOWN
            int h2 = 0;
            while (j+h2 < c) {
              if (n[i+k3][j+h2].getNum() < 9) {
                n[i+k3][j+h2].basin(c1);
                n[i+k3][j+h2].setMost(c2);


                ////// UP OF RIGHT OF DOWN
                int g1 = 0;
                while (i-g1+k3 >= 0) {
                  if (n[i+k3-g1][j+h2].getNum() < 9) {
                    n[i+k3-g1][j+h2].basin(c1);
                    n[i+k3-g1][j+h2].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// DOWN OF RIGHT OF DOWN
                int g2 = 0;
                while (i+g2+k3 < r) {
                  if (n[i+k3+g2][j+h2].getNum() < 9) {
                    n[i+k3+g2][j+h2].basin(c1);
                    n[i+k3+g2][j+h2].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h2++;
            }
          } else break;
          k3++;
        }

        ////////////////// UP OF MIN
        int k4 = 0;
        while (i-k4 >= 0) {
          if (n[i-k4][j].getNum() < 9) {
            n[i-k4][j].basin(c1);
            n[i-k4][j].setMost(c2);

            ////   LEFT OF UP
            int h1 = 0;
            while (j-h1 >= 0) {
              if (n[i-k4][j-h1].getNum() < 9) {
                n[i-k4][j-h1].basin(c1);
                n[i-k4][j-h1].setMost(c2);

                ////// UP OF LEFT OF UP
                int g1 = 0;
                while (i-k4-g1 >= 0) {
                  if (n[i-k4-g1][j-h1].getNum() < 9) {
                    n[i-k4-g1][j-h1].basin(c1);
                    n[i-k4-g1][j-h1].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// DOWN OF LEFT OF UP
                int g2 = 0;
                while (i+g2-k4 < r) {
                  if (n[i-k4+g2][j-h1].getNum() < 9) {
                    n[i-k4+g2][j-h1].basin(c1);
                    n[i-k4+g2][j-h1].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h1++;
            }

            //// RIGHT OF UP
            int h2 = 0;
            while (j+h2 < c) {
              if (n[i-k4][j+h2].getNum() < 9) {
                n[i-k4][j+h2].basin(c1);
                n[i-k4][j+h2].setMost(c2);

                ////// UP OF RIGHT OF UP
                int g1 = 0;
                while (i-k4-g1 >= 0) {
                  if (n[i-k4-g1][j+h2].getNum() < 9) {
                    n[i-k4-g1][j+h2].basin(c1);
                    n[i-k4-g1][j+h2].setMost(c2);
                  } else break;
                  g1++;
                }

                ////// DOWN OF RIGHT OF UP
                int g2 = 0;
                while (i+g2-k4 < r) {
                  if (n[i-k4+g2][j+h2].getNum() < 9) {
                    n[i-k4+g2][j+h2].basin(c1);
                    n[i-k4+g2][j+h2].setMost(c2);
                  } else break;
                  g2++;
                }
              } else break;
              h2++;
            }
          } else break;
          k4++;
        }
      }
    }
  }


  for (int k = 0; k < basin; k++) {
    int sum = 0;
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (n[i][j].getStroke() == k)
          sum++;
      }
    }
    basinsizen.append("" + k);
    basinsize.append(sum);
  }

  for (int i = 0; i < basinsize.size(); i++) {
    if (basinsize.get(i) > 100) {
      println(basinsize.get(i), basinsizen.get(i));
    }
  }

  int best1 = basinsize.get(34);
  int best2 = basinsize.get(50);
  int best3 = basinsize.get(126);

  println(best1, best2, best3);
  println("second * " + best1 * best2 * best3 );



  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      n[i][j].show();
    }
  }
}

void draw() {
}

void mousePressed() {
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
}

class Number {
  float x;
  float y;
  int num;
  color c;
  int strokec = 0;
  int finalc = 0;
  boolean min = false;

  Number(float x, float y, int num) {
    this.x = x;
    this.y = y;
    this.num = num;
    this.c = color(0);
  }

  void show() {
    fill(c);
    if (min) fill(0, 255, 0);
    text(num, x, y);
  }

  void setHigh() {
    if (num == 9) c = color(255, 0, 0, 0);
  }

  void setLow() {
    min = true;
  }

  void setMost(int a) {
    finalc = a;
  }

  void basin(int c1) {
    strokec = 100 + c1;
    if (finalc != 0)
      stroke(finalc, 0, 0);
    else noStroke();
    ellipse(x, y, 8, 8);
  }

  boolean getMin() {
    return min;
  }

  int getNum() {
    return num;
  }

  int getStroke() {
    return strokec - 100;
  }
}
