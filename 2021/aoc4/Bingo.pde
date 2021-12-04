class Bingo {
  int x;
  int y;
  int space = 0;
  int gap = 0;
  int num [][] = new int[5][5];
  boolean win [][] = new boolean[5][5];
  int size = 1;
  boolean victory = false;

  Bingo(int x, int y, int begin, StringList string) {
    this.x = x;
    this.y = y;
    for (int l = 0; l < 5; l++) {
      String [] linha = split(string.get(begin+l), ' ');
      for (int c = 0; c < 5; c++) {
        num[l][c] = int(linha[c]);
        win[l][c] = false;
      }
    }
  }

  void show() {
    
    textSize(8);
    textAlign(CENTER, CENTER);
   
    for (int l = 0; l < 5; l++) {
      for (int c = 0; c < 5; c++) {
        for (int k = 0; k < 10; k++) {
          if (x > 1520 * k) {
            if(victory){
    fill(0, 255, 0, 10);
    
    rectMode(CENTER);
    rect(x+30 - gap, y+30 + space, 100, 100);
    noFill();
    }
            space = 95 * k;
            gap = 1520 * k;
          }
        }
        fill(0);
        text(num[l][c], x + c*15 - gap, space + y + l*15);
        noFill();
      }
    }
  }

  void check(StringList bet) {
    for (int i = 0; i < size; i++) {
      for (int l = 0; l < 5; l++) {
        for (int c = 0; c < 5; c++) {
          noFill();
          noStroke();
          if (int(bet.get(i)) == num[l][c]) {
            stroke(255, 0, 0);
            win[l][c] = true;
          }
          for (int k = 0; k < 10; k++) {
            if (x > 1520 * k) {
              space = 95 * k;
              gap = 1520 * k;
            }
          }
          ellipse(x + c*15 - gap, space + y + 1 + l*15, 15, 15);
        }
      }
    }
  }

  void add() {
    size++;
  }

  void checkwinLin() {
    int count = 0;
    for (int l = 0; l < 5; l++) {
      for (int c = 0; c < 5; c++) {
        if (win[l][c]) count++;
        if (count == 5) {
       
          victory = true;
        }
      }
      count = 0;
    }
  }

  void checkwinCol() {
    int count = 0;
    for (int l = 0; l < 5; l++) {
      for (int c = 0; c < 5; c++) {
        if (win[c][l]) count++;
        if (count == 5) {
         
          victory = true;
        }
      }
      count = 0;
    }
  }
  
  int sumNotSel(){
    int val = 0;
     for (int l = 0; l < 5; l++) {
      for (int c = 0; c < 5; c++) {
        if(!win[c][l]) val+= num[c][l];
      }
     }
    return val;
  }
    
  
  int getSize(){
    return size;
  }
  
    boolean getVictory(){
    return victory;
  }
}
