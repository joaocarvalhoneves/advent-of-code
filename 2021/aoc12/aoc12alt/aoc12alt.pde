String lines [];
StringList places = new StringList();
int cave [][] = new int [7][7];
int savecave [][] = new int [7][7];
boolean activated [][] = new boolean [7][7];
StringList cavesSorted = new StringList();
StringList path = new StringList();
String search = "0";
int a = 0;

void setup() {
  textAlign(CENTER, CENTER);
  size(330, 300);
  background(255);
  fill(0);
  lines = loadStrings("list.txt");

  for (int i = 0; i < lines.length; i++) {
    places.append(split(lines[i], '-'));
  }

  cavesSorted.append("start");
  for (int i = 0; i < places.size(); i++) {
    if (!places.get(i).equals("end") && !places.get(i).equals("start")) {
      boolean addcave = true;
      for (int j = 0; j < cavesSorted.size(); j++) {
        if (cavesSorted.get(j).equals(places.get(i))) addcave = false;
      }
      if (addcave)
        cavesSorted.append(places.get(i));
    }
  }
  cavesSorted.append("end");

  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 7; j++) {
      cave[i][j] = 0;
      activated[i][j] = false;
    }
  }

  for (int i = 0; i < places.size(); i++) {
    if (i%2==0) {
      for (int j = 0; j < cavesSorted.size(); j++) {
        if (places.get(i).equals(cavesSorted.get(j))) {
          for (int k = 0; k < cavesSorted.size(); k++) {
            if (places.get(i+1).equals(cavesSorted.get(k)))
              cave[j][k] = 1;
          }
        }
      }
    } else {
      for (int j = 0; j < cavesSorted.size(); j++) {
        if (places.get(i).equals(cavesSorted.get(j))) {
          for (int k = 0; k < cavesSorted.size(); k++) {
            if (places.get(i-1).equals(cavesSorted.get(k)))
              cave[j][k] = 1;
          }
        }
      }
    }
  }

  for (int i = 0; i < cavesSorted.size(); i++) {
    cave[i][0] = 0;
    cave[cavesSorted.size()-1][i] = 0;
  }

  for (int i = 0; i < 7; i++) {
    for (int j = 0; j < 7; j++) {
      savecave[i][j] = cave[i][j];
    }
  }
}


void draw() {
  background(255);

  for (int i = 0; i < cavesSorted.size(); i++) {
    text(cavesSorted.get(i), 30, i*30+40);
  }

  for (int i = 0; i < cavesSorted.size(); i++) {
    text(cavesSorted.get(i), 35 + 30 + i*40, 15);
  }

  for (int i = 0; i < cavesSorted.size(); i++) {
    for (int j = 0; j < cavesSorted.size(); j++) {
      text(cave[j][i], 35 + 30 + i*40, j*30+40);
    }
  }

  for (int i = 0; i < path.size(); i++) {
    text(path.size() + "last path: " + path.get(i), width/2-textWidth("last path: " + path.get(path.size()-1)), 260+i*20);
  }
}

void mousePressed() {
  a = 0;
  search = "0";
  boolean iterate = true;
  while (iterate) {
    for (int i = 0; i < cavesSorted.size(); i++) {
      if (cave[a][i] == 1) {
        if (i == 1 || i == 3 || i == 5) {
          for (int j = 0; j < cavesSorted.size(); j++)
            cave[j][i] = -1;
        }
        search+=i;
        a = i;
        if (i != 6) {
          i = 0;
        } else {
          for (int k = 0; k < 7; k++) {
            for (int g = 0; g < 7; g++) {
              cave[k][g] = savecave[k][g];
            }
          }
          path.append(search);

          iterate = false;
        }
      } else {
        if (cave[a][i] == 0 && i == 6) {
          for (int k = 0; k < 7; k++) {
            for (int g = 0; g < 7; g++) {
              cave[k][g] = savecave[k][g];
            }
          }
          iterate = false;
        }
      }
    }

    println(search);
  }
}
