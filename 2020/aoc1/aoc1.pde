IntList num = new IntList();
String[] lines;

void setup(){
  size(200,00);
  lines = loadStrings("list.txt");
  for(int i = 0; i < lines.length; i++){
    num.append(Integer.valueOf(lines[i]));
  }
  for(int i = 0; i < num.size(); i++){
    for(int j = 0; j < num.size(); j++){
      if(i != 0 && num.get(i) + num.get(j) == 2020){
        println(num.get(i) * num.get(j));
      }
    }
  }
}
