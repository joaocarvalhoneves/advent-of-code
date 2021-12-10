String lines [];
StringList inputOutput = new StringList ();
StringList input = new StringList ();
StringList output = new StringList ();
StringList inputLSorted = new StringList();
StringList inputSorted = new StringList();
StringList endResult = new StringList();
int result = 0;

void setup() {
  lines = loadStrings("list.txt");
  for (int i = 0; i < lines.length; i++) {
    inputOutput.append(split(lines[i], '|'));
  }

  for (int i = 0; i < inputOutput.size(); i+=2) {
    input.append(inputOutput.get(i));
  }

  // Sort input by length
  for (int i = 0; i < input.size(); i++) {
    String endString = "";
    String pos [] = new String [10];
    String temp [] = split(input.get(i), ' ');
    for (int k = 0; k < temp.length; k++) {
      int numLen = temp[k].length();
      // IF 1
      if (numLen == 2) {
        pos[0] = temp[k];
      }
      // IF 7
      if (numLen == 3)
        pos[1] = temp[k];
      // IF 4
      if (numLen == 4)
        pos[2] = temp[k];
      // IF 5, 2, 3
      if (numLen == 5) {
        if (pos[3] == null) pos[3] = temp[k];
        else if (pos[4] == null) pos[4] = temp[k];
        else if (pos[5] == null) pos[5] = temp[k];
      }
      // IF 0, 6, 9
      if (numLen == 6) {
        if (pos[6]  == null) pos[6] = temp[k];
        else if (pos[7] == null) pos[7] = temp[k];
        else if (pos[8] == null) pos[8] = temp[k];
      }
      // IF 8
      if (numLen == 7)
        pos[9] = temp[k];
    }
    for (int u = 0; u < 10; u++) {
      endString+= pos[u] + ' ';
    }

    inputLSorted.append(endString);
  }

  // Sort by number
  for (int i = 0; i < input.size(); i++) {
    String endString = "";
    String pos [] = new String [10];
    String temp [] = split(inputLSorted.get(i), ' ');

    pos[1] = temp[0];
    pos[7] = temp[1];
    pos[4] = temp[2];
    pos[8] = temp[9];


    char char1 = temp[0].charAt(0); // a or b
    char char2 = temp[0].charAt(1); // a or b
    char char3 = 'z';
    for (int j = 0; j < temp[1].length(); j++) {
      if (temp[1].charAt(j) != char1 && temp[1].charAt(j) != char2)
        char3 = temp[1].charAt(j); // d
    }
    char char4 = 'z';
    char char5 = 'z';
    for (int j = 0; j < temp[2].length(); j++) {
      if (temp[2].charAt(j) != char1 &&
        temp[2].charAt(j) != char2) {
        if (char4 == 'z') char4 = temp[2].charAt(j);
        else char5 = temp[2].charAt(j);
      }
    }


    for (int u = 3; u < 6; u++) {
      int count = 0;
      int count1 = 0;
      for (int j = 0; j < temp[u].length(); j++) {
        if (temp[u].charAt(j) == char1) {
          count++;
        }
        if (temp[u].charAt(j) == char2) {
          count++;
        }
        if (temp[u].charAt(j) == char3) count++;
        if (temp[u].charAt(j) == char4) count1++;
        if (temp[u].charAt(j) == char5) count1++;
      }
      if (count == 3) pos[3] = temp[u];
      if (count == 2 && count1 == 1) pos[2] = temp[u];
    }

    for (int u = 6; u < 9; u++) {
      int count1 = 0;
      int count2 = 0;
      for (int j = 0; j < temp[u].length(); j++) {
        if (temp[u].charAt(j) == char1) {
          count2++;
        }
        if (temp[u].charAt(j) == char2) {
          count2++;
        }
        if (temp[u].charAt(j) == char4) {
          count1++;
          count2++;
        }
        if (temp[u].charAt(j) == char5) {
          count1++;
          count2++;
        }
      }
      if (count1 == 1) pos[0] = temp[u];
      if (count2 == 4) pos[9] = temp[u];
    }

    for (int u = 6; u < 9; u++) {
      if (temp[u] != pos[0] && temp[u] != pos[9]) pos[6] = temp[u];
    }

    for (int u = 3; u < 6; u++) {
      if (temp[u] != pos[2] && temp[u] != pos[3]) pos[5] = temp[u];
    }



    endString+= pos[0] +
      ' ' + pos[1] +
      ' ' + pos[2] +
      ' ' + pos[3] +
      ' ' + pos[4] +
      ' ' + pos[5] +
      ' ' + pos[6] +
      ' ' + pos[7] +
      ' ' + pos[8] +
      ' ' + pos[9];
    inputSorted.append(endString);
  }

  for (int i = 1; i < inputOutput.size(); i+=2) {
    output.append(inputOutput.get(i));
  }

  //println(inputSorted);
  //  println(output);


  for (int i = 0; i < output.size(); i++) {
    String inputtemp [] = split(inputSorted.get(i), ' ');
    String outputtemp [] = split(output.get(i), ' ');
    String lol = "";
    for (int j = 0; j < outputtemp.length; j++) {
      for (int u = 0; u < inputtemp.length; u++) {
        if (inputtemp[u].length() == outputtemp[j].length()) {
          char char1 [] = new char[8];
          for (int o = 0; o < outputtemp[j].length(); o++) {
            char1[o] = outputtemp[j].charAt(o);
          }
          int count = 0;

          for (int o = 0; o < inputtemp[u].length(); o++) {

            for (int h = 0; h < char1.length; h++) {
              if (inputtemp[u].charAt(o) == char1[h]) count++;
            }
            if (count == inputtemp[u].length()) {
              lol+= u;
            }
          }
        }
      }
    }

    endResult.append(lol);
  }


  for (int i = 0; i < endResult.size(); i++) {
    result+= Integer.valueOf(endResult.get(i));
  }

  println("second * " + result);
}
