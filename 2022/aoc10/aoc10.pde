String loadString [];
int score1 = 0;
int X = 1;
int cycle = 0;
int cycleNum [] = new int [6];
boolean grid [] = new boolean [40*6];

void setup() {
  loadString = loadStrings("data.txt");
  size(800, 120);
  background(255);

  for (int i = 0; i < grid.length; i++) {
    grid[i] = false;
  }

  for (int i = 0; i < 6; i++) {
    cycleNum[i] = 20+i*40;
  }

  for (int i = 0; i < loadString.length; i++) {
    int type;
    if (split(loadString[i], ' ')[0].equals("addx"))
      type = 2;
    else type = 1;
    for (int j = 0; j < type; j++) {
      cycle++;
      int pos = cycle;

      for (int k = 1; k < 6; k++) {
        if (cycle > 40*k) pos-= 40;
      }

      if (X == pos-1 || X+1 == pos-1 || X-1 == pos-1) {
        grid[cycle-1] = true;
      }

      for (int k = 0; k < cycleNum.length; k++) {
        if (cycle == cycleNum[k])
          score1+= X*cycle;
      }

      if (j == 1) {
        X+= int(split(loadString[i], ' ')[1]);
      }
    }
  }

  println(score1);

  // Display grid
  int x = 0;
  int y = 0;
  for (int i = 0; i < grid.length; i++) {
    if (i % 40 == 0 && i != 0) {
      x = 0;
      y+=20;
    }
    if (!grid[i]) fill(0);
    else fill(0, 255, 0);
    rect(x, y, 20, 20);
    x+= 20;
  }
}
