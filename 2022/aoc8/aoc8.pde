String loadString [];
int score1 = 0;
int score2 = 0;
int grid [][];
int col;
int row;
IntList maxview = new IntList();

void setup() {
  size(795, 800);
  background(0);
  textAlign(CENTER, CENTER);
  textSize(8);
  loadString = loadStrings("data.txt");
  col = loadString[0].length();
  row = loadString.length;
  grid = new int [col][row];
  for (int i = 0; i < loadString.length; i++) {
    for (int j = 0; j < loadString[i].length(); j++) {
      int num = loadString[i].charAt(j) - 48;
      grid[i][j] = num;
    }
  }
  boolean check = false;
  score1+= (row * 2 + col * 2) - 4;

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      if (i != 0 && i != col-1 && j != 0 && j != row-1) {
        boolean view [] = new boolean [4];
        int around [] = new int [4];
        for (int k = 0; k < 4; k++) {
          view[k] = true;
          around[k] = 0;
        }

        // bottom
        for (int k = j+1; k < col; k++) {
          if (view[0]) {
            around[0]++;
            if (grid[i][k] >= grid[i][j])
              view[0] = false;
          }
        }

        // up
        for (int k = j-1; k >= 0; k--) {
          if (view[1]) {
            around[1]++;
            if (grid[i][k] >= grid[i][j])
              view[1] = false;
          }
        }

        // right
        for (int k = i+1; k < row; k++) {
          if (view[2]) {
            around[2]++;
            if (grid[k][j] >= grid[i][j])
              view[2] = false;
          }
        }

        // left
        for (int k = i-1; k >= 0; k--) {
          if (view[3]) {
            around[3]++;
            if (grid[k][j] >= grid[i][j])
              view[3] = false;
          }
        }

        if (view[0] || view[1] || view[2] || view[3]) {
          score1++;
          check = true;
        } else {
          check = false;
        }
        int v = around[0] * around[1] * around[2] * around[3];
        maxview.append(v);
      }

      if (check)
        fill(0, 255, 0);
      else fill(255, 0, 0);
      text(grid[i][j], i*8 + 5, j*8 + 5);
    }
  }
  
  maxview.sort();
  score2 = maxview.get(maxview.size()-1);

  // 1*
  println(score1);

  // 2*
  println(score2);
}
