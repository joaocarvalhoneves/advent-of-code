IntList num = new IntList();
String[] lines;
int count1;
int count2;
int sum = 0;

void setup() {
  size(200, 00);
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    num.append(Integer.valueOf(lines[i]));
  }
  for (int i = 1; i < num.size(); i++) {
    if (num.get(i) > num.get(i-1))
      count1++;
  }
  println("first * " + count1);

  for (int i = 0; i < num.size()-3; i++) {
    for (int j = 0; j < 3; j++) {
      sum-= num.get(i+j+1);
      sum+= num.get(i+j);
    }
    if (sum < 0) count2++;
    sum = 0;
  }
  println("second * " + count2);
}
