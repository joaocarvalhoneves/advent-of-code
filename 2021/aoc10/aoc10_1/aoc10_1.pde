String lines [];
StringList list = new StringList ();
int result = 0;
int score = 0;

void setup() {
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    list.append(lines[i]);
  }

  for (int i = 0; i < list.size(); i++) {
    IntList expect = new IntList();
    for (int j = 0; j < list.get(i).length(); j++) {
      char char1 = list.get(i).charAt(j);
      if (char1 == '(')
        expect.append('(');
      if (char1 == '[')
        expect.append('[');
      if (char1 == '{')
        expect.append('{');
      if (char1 == '<')
        expect.append('<');

      if (char1 == ')') {
        if (expect.get(expect.size()-1) != '(') {
          println("error on line" + i + ", char " + j + ". expected ')'");
          score+= 3;
          break;
        } else expect.remove(expect.size()-1);
      }

      if (char1 == ']') {
        if (expect.get(expect.size()-1) != '[') {
          println("error on line" + i + ", char " + j + ". expected ']'");
          score+= 57;
          break;
        } else expect.remove(expect.size()-1);
      }

      if (char1 == '}') {
        if (expect.get(expect.size()-1) != '{') {
          println("error on line" + i + ", char " + j + ". expected '}'");
          score+= 1197;
          break;
        } else expect.remove(expect.size()-1);
      }

      if (char1 == '>') {
        if (expect.get(expect.size()-1) != '<') {
          println("error on line" + i + ", char " + j + ". expected '>'");
          score+= 25137;
          break;
        } else expect.remove(expect.size()-1);
      }
    }
  }
  println("first * " + score);
}
