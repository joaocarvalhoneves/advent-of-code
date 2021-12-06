String lines [];
StringList spanlist = new StringList();
ArrayList <Fish> f1 = new ArrayList();
int day;

void setup() {
  size(800, 600);
  lines = loadStrings("list.txt");
  spanlist.append(split(lines[0], ','));
  for (int i = 0; i < spanlist.size(); i++) {
    f1.add(new Fish(Integer.valueOf(spanlist.get(i))));
  }
  println(sqrt(26));
}

void draw() {
  background(#050639);
  for (int i = 0; i < f1.size(); i++) {
    f1.get(i).show();
  }
}

void mousePressed() {
  day++;
  for (int i = f1.size()-1; i >= 0; i--) {
    f1.get(i).behaviour();
  }

  if (day == 120)

    println("first * " + f1.size() + " on day " + day);
}

class Fish {
  int span;
  int x;
  int y;

  Fish(int span) {
    this.span = span;
    x = int(random(width));
    y = int(random(height));
  }

  void show() {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, 4, 1);
  }

  void behaviour() {
    if (span == 0) {
      span = 6;
      f1.add(new Fish(8));
    } else if (span > 0) span--;
  }
}
