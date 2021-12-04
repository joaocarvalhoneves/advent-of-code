String betsload = "18,99,39,89,0,40,52,72,61,77,69,51,30,83,20,65,93,88,29,22,14,82,53,41,76,79,46,78,56,57,24,36,38,11,50,1,19,26,70,4,54,3,84,33,15,21,9,58,64,85,10,66,17,43,31,27,2,5,95,96,16,97,12,34,74,67,86,23,49,8,59,45,68,91,25,48,13,28,81,94,92,42,7,37,75,32,6,60,63,35,62,98,90,47,87,73,44,71,55,80";
String lines [];
String betsarray [];
StringList bets = new StringList();
StringList bingos = new StringList();
int numbingos;
int firststar;
int secondstar;
int closed = 0;
Bingo b [] = new Bingo [9999];

void setup() {
  size(1525, 800);
  betsarray = split(betsload, ",");
  for (int i = 0; i < betsarray.length; i++) {
    bets.append(betsarray[i]);
  }
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    bingos.append(lines[i]);
  }

  numbingos=bingos.size()/6;

  for (int i = 0; i < numbingos; i++) {
    b[i] = new  Bingo (20 + i * 95, 20, 6*i, bingos);
  }

  println(numbingos);

  println("print * " + "");
}

void draw() {
  background(255);
  for (int i = 0; i < numbingos; i++) {
    b[i].show();
    b[i].check(bets);
    b[i].checkwinLin();
    b[i].checkwinCol();
    
  }
  fill(0);
  textSize(40);
  text(bets.get(b[0].getSize()-1), width-40, height-40);
  noFill();
  
    for (int i = 0; i < numbingos; i++) {
      if(b[i].getVictory()){
        closed++;
        firststar = b[i].sumNotSel() * int(bets.get(b[0].getSize()-1));
        if(closed == 98)
        secondstar = b[i].sumNotSel();
      }
    }
    println(closed);
    println("first * " + firststar);
    
    println("second * " + secondstar);
    closed = 0;
}

void mousePressed() {
  for (int i = 0; i < numbingos; i++) {
    b[i].add();
  }
}
