String lines [];
StringList places = new StringList();
ArrayList <Cave> c = new ArrayList <Cave> ();
StringList paths = new StringList();

void setup() {
  lines = loadStrings("list.txt");

  for (int i = 0; i < lines.length; i++) {
    places.append(split(lines[i], '-'));
  }

  for (int i = 0; i < places.size(); i++) {
    boolean exist = false;
    for (int j = 0; j < c.size(); j++) {
      if (places.get(i).equals(c.get(j).getN()))
        exist = true;
    }
    if (!exist) {
      int type;
      if (places.get(i).charAt(0) >= 65 && places.get(i).charAt(0) <= 90)
        type = 1;
      else type = 0;
      c.add(new Cave(places.get(i), type));
    }
  }

  for (int i = 0; i < places.size(); i++) {
    if (i%2==0) {
      for (int j = 0; j < c.size(); j++) {
        if (places.get(i).equals(c.get(j).getN()))
          c.get(j).addC(places.get(i+1));
      }
    } else {
      for (int j = 0; j < c.size(); j++) {
        if (places.get(i).equals(c.get(j).getN()))
          c.get(j).addC(places.get(i-1));
      }
    }
  }
}

/*
void search(Cave o, String path) {
 for (int j = 0; j < o.getC().size(); j++) {
 println(path);
 if (o.getC().get(j).equals("end")) {
 String temp = path + o.getC().get(j);
 paths.append(temp);
 j++;
 } else {
 boolean askContinue = true;
 String splitted[] = split(path, ",");
 for (int k = 0; k < splitted.length; k++) {
 if (k != 0 && o.getC().get(j).equals("start")) {
 askContinue = false;
 path="start,";
 j++;
 }
 if (splitted[k].equals(o.getC().get(j)) && o.getC().get(j).charAt(0) >= 97 && o.getC().get(j).charAt(0) <= 122) {
 askContinue = false;
 path="start,";
 j++;
 }
 }
 
 if (askContinue) {
 for (int g = 0; g < c.size(); g++) {
 if (c.get(g).getN() == o.getC().get(j)) {
 path+=c.get(g).getN()+",";
 search(c.get(g), path);
 }
 }
 }
 }
 }
 }
 */





class Cave {
  String name;
  StringList connection = new StringList();
  int caps;

  Cave(String name, int caps) {
    this.name = name;
    this.caps = caps;
  }

  String getN() {
    return name;
  }

  int getT() {
    return caps;
  }

  StringList getC() {
    return connection;
  }

  void addC(String con) {
    connection.append(con);
  }
}
