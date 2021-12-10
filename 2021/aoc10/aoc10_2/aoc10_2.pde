String lines [];
StringList list = new StringList ();
StringList incomplete = new StringList ();
StringList leftchar = new StringList ();
long score = 0;
LongList finalresult = new LongList ();

void setup() {
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    list.append(lines[i]);
  }

  for (int i = 0; i < list.size(); i++) {
    StringList expect = new StringList ();
    for (int j = 0; j < list.get(i).length(); j++) {
      char char1 = list.get(i).charAt(j);
      if (char1 == '(')
        expect.append("(");
      if (char1 == '[')
        expect.append("[");
      if (char1 == '{')
        expect.append("{");
      if (char1 == '<')
        expect.append("<");

      if (char1 == ')') {
        if (expect.get(expect.size()-1) != "(") {
          break;
        } else expect.remove(expect.size()-1);
      }

      if (char1 == ']') {
        if (expect.get(expect.size()-1) != "[") {
          break;
        } else expect.remove(expect.size()-1);
      }

      if (char1 == '}') {
        if (expect.get(expect.size()-1) != "{") {
          break;
        } else expect.remove(expect.size()-1);
      }

      if (char1 == '>') {
        if (expect.get(expect.size()-1) != "<") {
          break;
        } else expect.remove(expect.size()-1);
      }
      if (j == list.get(i).length()-1) {
        if (expect.size() > 0) {
          incomplete.append(list.get(i));
        }
      }
    }
  }


  for (int i = 0; i < incomplete.size(); i++) {
    StringList expect = new StringList ();
    for (int j = 0; j < incomplete.get(i).length(); j++) {
      char char1 = incomplete.get(i).charAt(j);
      if (char1 == '(')
        expect.append("(");
      if (char1 == '[')
        expect.append("[");
      if (char1 == '{')
        expect.append("{");
      if (char1 == '<')
        expect.append("<");


      if (char1 == ')') {
        if (expect.get(expect.size()-1) != "(") {
        } else expect.remove(expect.size()-1);
      }

      if (char1 == ']') {
        if (expect.get(expect.size()-1) != "[") {
        } else expect.remove(expect.size()-1);
      }

      if (char1 == '}') {
        if (expect.get(expect.size()-1) != "{") {
        } else expect.remove(expect.size()-1);
      }

      if (char1 == '>') {
        if (expect.get(expect.size()-1) != "<") {
        } else expect.remove(expect.size()-1);
      }
    }

    if (expect.size() > 0) {
      String temp = "";
      for (int g = expect.size()-1; g >= 0; g--) {
        if (expect.get(g) == "(") temp+=")";
        if (expect.get(g) == "[") temp+="]";
        if (expect.get(g) == "{") temp+="}";
        if (expect.get(g) == "<") temp+=">";
      }
      leftchar.append(temp);
    }
  }

  for (int i = 0; i < leftchar.size(); i++) {
    score = 0;
    for (int j = 0; j < leftchar.get(i).length(); j++) {
      int add = 0;
      if (leftchar.get(i).charAt(j) == ')') add = 1;
      if (leftchar.get(i).charAt(j) == ']') add = 2;
      if (leftchar.get(i).charAt(j) == '}') add = 3;
      if (leftchar.get(i).charAt(j) == '>') add = 4;
      score = score * 5 + add;
    }
    finalresult.append(score);
  }

  finalresult.sort();

  println("second * " + finalresult.get(finalresult.size()/2));
}
