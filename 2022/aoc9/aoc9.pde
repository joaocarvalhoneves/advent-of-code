String loadString [];
int score1 = 0;
int score2 = 0;
PVector body [] = new PVector [10];
ArrayList <PVector> path = new ArrayList <PVector> ();

void setup() {
  loadString = loadStrings("data.txt");
  path.add(new PVector(0, 0));

  for (int i = 0; i < body.length; i++) {
    body[i] = new PVector(0, 0);
  }

  for (int i = 0; i < loadString.length; i++) {
    for (int j = 0; j < int(split(loadString[i], ' ')[1]); j++) {
      String dir = split(loadString[i], ' ')[0];
      for (int k = 0; k < body.length-1; k++) {
        int phase;
        if (k == 0) phase = 1;
        else if (k == body.length-2) phase = 3;
        else phase = 2;
        move(dir, body[k], body[k+1], phase);
      }
      if (i == loadString.length-1) {
        println("STEP NUMBER: " + j);
        for (int o = 0; o < body.length; o++) {
          println(o + ": " + body[o]);
        }
      }
    }
  }
  
  println(path.size());
}

void move(String way, PVector infront, PVector behind, int phase) {
  if (phase == 1) {
    if (way.equals("L"))
      infront.x-= 1;
    else if (way.equals("R"))
      infront.x+= 1;
    else if (way.equals("U"))
      infront.y+= 1;
    else if (way.equals("D"))
      infront.y-= 1;
  }

  if (abs(infront.x-behind.x) > 1 || abs(infront.y-behind.y) > 1) {
    if (infront.x > behind.x)
      behind.x++;
    else if (infront.x < behind.x)
      behind.x--;
    if (infront.y > behind.y)
      behind.y++;
    else if (infront.y < behind.y)
      behind.y--;
  }
  
  if (phase == 3) {
    boolean visited = false;
    for (int i = 0; i < path.size(); i++) {
      if (behind.x == path.get(i).x && behind.y == path.get(i).y)
        visited = true;
    }

    if (!visited)
      path.add(new PVector(behind.x, behind.y));
  }
}
