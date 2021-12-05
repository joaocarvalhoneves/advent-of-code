String lines [];
String temp1 [];
String temp2 [];
StringList coords1 = new StringList ();
StringList coords2 = new StringList ();
int intersections = 0;
PImage img;

void setup() {
  size(1000, 1000);
  background(255);
  lines = loadStrings("list.txt");
  img = createImage(width, height, ARGB);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      img.set(i, j, 255);
    }
  }

  for (int i = 0; i < lines.length; i++) {
    temp1 = split(lines[i], " -> ");
    coords1.append(temp1[0]);
    coords2.append(temp1[1]);
  }
  for (int i = 0; i < coords1.size(); i++) {
    temp1 = split(coords1.get(i), ",");
    temp2 = split(coords2.get(i), ",");
    
    
    if (temp1[0].equals(temp2[0])) {
      for (int j = min(Integer.valueOf(temp1[1]), Integer.valueOf(temp2[1])); j <= max(Integer.valueOf(temp1[1]), Integer.valueOf(temp2[1])); j++) {
        color pix = img.get(Integer.valueOf(temp1[0]), j);
        if (pix == 255)
          img.set(Integer.valueOf(temp1[0]), j, 0);
        else if(pix == 0) img.set(Integer.valueOf(temp1[0]), j, color(255, 0, 0));
      }
    }
    else if (temp1[1].equals(temp2[1])) {
      for (int j = min(Integer.valueOf(temp1[0]), Integer.valueOf(temp2[0])); j <= max(Integer.valueOf(temp1[0]), Integer.valueOf(temp2[0])); j++) {
        color pix = img.get(j, Integer.valueOf(temp1[1]));
        if (pix == 255)
          img.set(j, Integer.valueOf(temp1[1]), 0);
        else if(pix == 0) img.set(j, Integer.valueOf(temp1[1]), color(255,0, 0));
      }
    }
  }
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      if (img.get(i, j) == color(255,0, 0))
        intersections++;
    }
  }
  println("first star *" + intersections);
  
  image(img, 0, 0);
}
