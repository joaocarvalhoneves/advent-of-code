String loadString [];
ArrayList <Node> node = new ArrayList <Node> ();
StringList currentDirectory = new StringList ();
IntList less = new IntList();
int score1 = 0;
int score2 = 9999999;
int total = 0;

void setup() {
  loadString = loadStrings("data.txt");

  for (int i = 0; i < loadString.length; i++) {
    addTree(loadString[i]);
  }

  for (int i = 0; i < node.size(); i++) {
    if (node.get(i).size <= 100000)
      score1+= node.get(i).size;

    if (node.get(i).parent_folder.equals("/"))
      total+= node.get(i).size;
  }

  total = 30000000 - (70000000 - total);

  for (int i = 0; i < node.size(); i++) {
    if (node.get(i).size >= total)
      score2 = min(node.get(i).size, score2);
  }

  // 1*
   println(score1);

  // 2*
  println(score2);
}


class Node {
  String parent_folder;
  String folder;
  int size = 0;

  Node(String parent_folder, String folder) {
    this.parent_folder = parent_folder;
    this.folder = folder;
  }
}

void addTree(String entry) {
  String entryArray [] = split(entry, ' ');
  if (entryArray[0].equals("$")) {
    if (entryArray[1].equals("cd")) {
      if (!entryArray[2].equals("..")) {
        currentDirectory.append(entryArray[2]);
        if (node.size() > 0)
          node.add(new Node(currentDirectory.get(currentDirectory.size()-2),
            currentDirectory.get(currentDirectory.size()-1)));
        else  node.add(new Node("father",
          currentDirectory.get(currentDirectory.size()-1)));
      } else {
        currentDirectory.remove(currentDirectory.size()-1);
      }
    }
  } else {
    for (int i = 0; i < node.size(); i++) {
      for (int j = 1; j < currentDirectory.size(); j++) {
        if (node.get(i).folder.equals(currentDirectory.get(j)) && node.get(i).parent_folder.equals(currentDirectory.get(j-1))) {
          node.get(i).size+= int(entryArray[0]);
        }
      }
    }
  }
}
