IntList sum = new IntList();
String loadString [];
int num = 0;

loadString = loadStrings("data.txt");
sum.append(int(loadString[0]));

for (int i = 1; i < loadString.length; i++) {
  if (loadString[i].length() == 0) {
    sum.append(0);
    num++;
  } else {
    sum.add(num, int(loadString[i]));
  }
}
sum.sort();

// 1*
println(sum.get(sum.size()-1));
// 2*
println(sum.get(sum.size()-1) + sum.get(sum.size()-2) + sum.get(sum.size()-3));
