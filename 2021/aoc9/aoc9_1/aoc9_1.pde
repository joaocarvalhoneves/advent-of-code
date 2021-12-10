String lines [];
int c = 100;
int r = 100;
int list [][] = new int [100][100];
int result = 0;

void setup() {
  lines = loadStrings("list.txt");
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      list[i][j] = char(lines[i].charAt(j)) - 48;
    }
  }

// CORNERS
  if (list[0][0] < list[0][1] && list[0][0] < list[1][0]) result+= list[0][0]+1;
  if (list[r-1][0] < list[r-2][0] && list[r-1][0] < list[r-1][1]) result+= list[r-1][0]+1;
  if (list[0][c-1] < list[0][c-2] && list[0][c-1] < list[1][c-1]) result+= list[0][c-1]+1;
  if (list[r-1][c-1] < list[r-2][c-1] && list[r-1][c-1] < list[r-1][c-2]) result+= list[r-1][c-1]+1;

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (!((i == 0 && j == 0) || (i == r-1 && j == 0) || (i == 0 && j == c-1) || (i == r-1 && j == c-1))) {

        // UPPER BORDER
        if (i == 0) {
          if (list[i][j] < list[i][j-1] && list[i][j] < list[i][j+1] && list[i][j] < list[i+1][j]) result+= list[i][j]+1;
        }

        // DOWN BORDER
        if (i == r-1) {
          if (list[i][j] < list[i][j-1] && list[i][j] < list[i][j+1] && list[i][j] < list[i-1][j]) result+= list[i][j]+1;
        }

        // LEFT BORDER
        if (j == 0) {
          if (list[i][j] < list[i-1][j] && list[i][j] < list[i+1][j] && list[i][j] < list[i][j+1]) result+= list[i][j]+1;
        }

        // RIGHT BORDER
        if (j == c-1) {
          if (list[i][j] < list[i-1][j] && list[i][j] < list[i+1][j] && list[i][j] < list[i][j-1]) result+= list[i][j]+1;
        }


        // REMAINING (CENTER)
        if (!(i == 0 || i == r-1 || j == 0 || j == c-1)) {
          if (list[i][j] < list[i-1][j] &&
            list[i][j] < list[i+1][j] &&
            list[i][j] < list[i][j-1] &&
            list[i][j] < list[i][j+1])
            result+= list[i][j]+1;
        }
      }
    }
  }
  println("first * " + result);
}
