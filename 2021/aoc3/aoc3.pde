String lines [];
StringList ox = new StringList();
StringList co = new StringList();
String gamma = "";
String epsilon = "";
int num0 = 0;
int num1 = 0;

void setup() {
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines[0].length(); i++) {
    for (int j = 0; j < lines.length; j++) {
      if (lines[j].charAt(i) == '0') num0++;
      if (lines[j].charAt(i) == '1') num1++;
    }
    if (num0 > num1) {
      gamma+= "0";
      epsilon+= "1";
    } else {
      gamma+="1";
      epsilon+= "0";
    }
    num0 = 0;
    num1 = 0;
  }
  
  println("first * " + unbinary(gamma)*unbinary(epsilon));

// pt2

  for (int i = 0; i < lines.length; i++) {
    ox.append(lines[i]);
    co.append(lines[i]);
  }


  for (int i = 0; i < lines[0].length(); i++) {
    if (ox.size() > 1) {
      num0 = 0;
      num1 = 0;

      for (int j = 0; j < ox.size(); j++) {
        if (ox.get(j).charAt(i) == '0') num0++;
        if (ox.get(j).charAt(i) == '1') num1++;
      }
      if (num0 > num1) {
        for (int k = ox.size() - 1; k >= 0; k--) {
          if (ox.get(k).charAt(i) == '1') {
            ox.remove(k);
          }
        }
      } else {
        for (int k = ox.size() - 1; k >= 0; k--) {
          if (ox.get(k).charAt(i) == '0') {
            ox.remove(k);
          }
        }
      }
    }
  }

  for (int i = 0; i < lines[0].length(); i++) {
    if (co.size() > 1) {
      num0 = 0;
      num1 = 0;
      for (int j = 0; j < co.size(); j++) {
        if (co.get(j).charAt(i) == '0') num0++;
        if (co.get(j).charAt(i) == '1') num1++;
      }

      if (num0 <= num1) {
        for (int k = co.size() - 1; k >= 0; k--) {
          if (co.get(k).charAt(i) == '1') {
            co.remove(k);
          }
        }
      } else {
        for (int k = co.size() - 1; k >= 0; k--) {
          if (co.get(k).charAt(i) == '0') {
            co.remove(k);
          }
        }
      }
    }
  }
  
    println("second * " + unbinary(ox.get(0))* unbinary(co.get(0)));
}
