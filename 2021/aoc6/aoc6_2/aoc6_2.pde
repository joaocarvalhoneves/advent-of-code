String lines [];
StringList spanList = new StringList();
long fishNum [] = new long [10];
int day;
long totalFish;

void setup() {
  size(300, 300);
  lines = loadStrings("list.txt");
  spanList.append(split(lines[0], ','));
  for (int i = 0; i < spanList.size(); i++) {
    fishNum[Integer.valueOf(spanList.get(i))]++;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < fishNum.length-1; i++) {
  text("second * " + fishNum[i] + " on day " + day, 20, 25+20*i);
}
text(totalFish, 20, 25+250);
}

void mousePressed() {
  totalFish = 0;
  day++;
  fishNum[9] = fishNum[0];
  for (int i = 0; i < fishNum.length-1; i++) {
    fishNum[i] = fishNum[i+1];
    if (i == 6) fishNum[i]+= fishNum[9];
    totalFish+=fishNum[i];
  }
  
  

}
