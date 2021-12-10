String lines [];
StringList list = new StringList();
StringList listsecond = new StringList();
StringList listthird = new StringList();
StringList listin = new StringList();
StringList listout = new StringList();
int digits = 0;

void setup() {
  size(800, 600);
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    list.append(split(lines[i], '|'));
  }
  for (int i = 1; i < list.size(); i+=2) {
    listsecond.append(list.get(i));
  }
  
    for (int i = 0; i < listsecond.size(); i++) {
    listin.append(split(listsecond.get(i), ' '));
  }
  
  for (int i = 0; i < listsecond.size(); i++) {
    listout.append(split(listsecond.get(i), ' '));
  }
  
  for (int i = 0; i < listout.size(); i++) {
    if (listout.get(i).length() == 7 ||
      listout.get(i).length() ==4 ||
      listout.get(i).length() == 2 ||
      listout.get(i).length() == 3)
      digits++;
  }
  println("first * " + digits);
}
