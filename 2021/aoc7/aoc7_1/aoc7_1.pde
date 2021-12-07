String lines [];
StringList spanlist = new StringList();
IntList crab = new IntList();
int pos = 0;
int fuel = 999999999;
int tempfuel = 0;
int minx = 500;
int maxx = 500;

void setup() {
  size(800, 600);
  lines = loadStrings("list.txt");
  spanlist.append(split(lines[0], ','));
  for (int i = 0; i < spanlist.size(); i++) {
    crab.append(Integer.valueOf(spanlist.get(i)));
  }

  for (int i = 0; i < crab.size(); i++) {
    if (crab.get(i) > maxx) maxx = crab.get(i);
    if (crab.get(i) < minx) minx = crab.get(i);
  }

  for (int i = minx; i <= maxx; i++) {
    for (int j = 0; j < crab.size(); j++) {
      int dist = abs(i-crab.get(j));
      tempfuel+= dist;
    }
    if (tempfuel <= fuel) {
      fuel = tempfuel;
      pos = i;
    }
    tempfuel = 0;
  }
  println("first star * " + fuel);

  tempfuel = 0;
  fuel = 0;
}
