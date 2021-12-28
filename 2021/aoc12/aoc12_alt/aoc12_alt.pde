String lines [];
StringList places = new StringList();
ArrayList <Cave> c = new ArrayList <Cave> ();
ArrayList <Cave> cave = new ArrayList <Cave> ();
StringList paths = new StringList();
int count = 0;

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

  for (int i = c.size() - 1; i >= 0; i--) {
    if (c.get(i).getN().equals("end")) c.get(i).clearC();
    for (int j = c.get(i).getC().size() - 1; j >= 0; j--) {
      if (c.get(i).getC().get(j).equals("start")) c.get(i).getC().remove(j);
    }
  }

  for (int i = 0; i < c.size(); i++) {
    if (c.get(i).getN().equals("start")) cave.add(c.get(i));
  }

  for (int i = 0; i < c.size(); i++) {
    if (!c.get(i).getN().equals("start") && !c.get(i).getN().equals("end")) cave.add(c.get(i));
  }

  for (int i = 0; i < c.size(); i++) {
    if (c.get(i).getN().equals("end")) cave.add(c.get(i));
  }

  ////////////////////

  String path = "";
  search(path, cave.get(0).getC());

  for (int i = 0; i < cave.size(); i++) {
    println("I am cave: " + cave.get(i).getN() + ". I'm connected to " + cave.get(i).getC() + ".");
  }
}


void search(String path, StringList con) {
  for (int i = 0; i < con.size(); i++) {
    if (continueSearch(con.get(i), path)) {
      path+= con.get(i)+",";
      println(path);
      if (con.get(i).equals("end")) {
        paths.append(path);
        path = "";
      }
    } 
      search(path, getCaveCon(con.get(i)));
  }
}


boolean continueSearch(String connection, String path) {
  boolean a = true;
  String [] splitted = split(path, ",");
  int whatcave = 0;
  for (int i = 0; i < splitted.length; i++) {
    for (int j = 0; j < cave.size(); j++) {
      if (cave.get(j).getN().equals(connection)) {
        whatcave = j;
      }
      if (splitted[i].equals(connection) && cave.get(whatcave).getT() == 1) a = false;
    }
  }
  return a;
}


StringList getCaveCon(String con) {
  StringList c = new StringList();

  for (int i = 0; i < cave.size(); i++) {
    if (cave.get(i).getN().equals(con))
      c.append(cave.get(i).getC());
  }
  println(c);
  return c;
}


class Cave {
  String name;
  StringList connection = new StringList();
  int type; // 1 is caps, 0 is not

  Cave(String name, int type) {
    this.name = name;
    this.type = type;
  }

  String getN() {
    return name;
  }

  int getT() {
    return type;
  }

  StringList getC() {
    return connection;
  }

  void addC(String con) {
    connection.append(con);
  }

  void clearC() {
    connection.clear();
  }
}
