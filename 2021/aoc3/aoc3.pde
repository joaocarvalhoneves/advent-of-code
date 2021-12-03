String[] lines;
String[] what;
int depth = 0;
int far = 0;
int aim = 0;

void setup() {
  size(200, 00);
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    what = split(lines[i], " ");
    if (what[0].equals("forward")) far+= Integer.valueOf(what[1]);
    if (what[0].equals("down")) depth+= Integer.valueOf(what[1]);
    if (what[0].equals("up")) depth-= Integer.valueOf(what[1]);
  }
  println("first * " + far*depth);

  far = 0;
  depth = 0;

  for (int i = 0; i < lines.length; i++) {
    what = split(lines[i], " ");
    if (what[0].equals("forward")) {
      far+= Integer.valueOf(what[1]);
      depth+=Integer.valueOf(what[1])*aim;
    }
    if (what[0].equals("down")) aim+= Integer.valueOf(what[1]);
    if (what[0].equals("up")) aim-= Integer.valueOf(what[1]);
  }
  println("second * " + depth*far);
}
