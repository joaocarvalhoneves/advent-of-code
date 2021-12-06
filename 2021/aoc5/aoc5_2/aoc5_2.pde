String lines [];
String temp1 [];
String temp2 [];
StringList coords1 = new StringList ();
StringList coords2 = new StringList ();
PImage img;
int intersections = 0;
int x1, x2, y1, y2;

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
  stroke(0, 50);
  for (int i = 0; i < coords1.size(); i++) {
    temp1 = split(coords1.get(i), ",");
    temp2 = split(coords2.get(i), ",");


    x1 = Integer.valueOf(temp1[0]);
    y1 = Integer.valueOf(temp1[1]);
    x2 = Integer.valueOf(temp2[0]);
    y2 = Integer.valueOf(temp2[1]);


    if (temp1[0].equals(temp2[0])) {
      for (int j = min(y1, y2); j <= max(y1, y2); j++) {
        color pix = img.get(x1, j);
        if (pix == 255)
          img.set(x1, j, 0);
        else if (pix == 0) img.set(x1, j, color(255, 0, 0));
      }
    } else if (temp1[1].equals(temp2[1])) {
      for (int j = min(x1, x2); j <= max(x1, x2); j++) {
        color pix = img.get(j, y1);
        if (pix == 255)
          img.set(j, y1, 0);
        else if (pix == 0) img.set(j, y1, color(255, 0, 0));
      }
    }

    if (y1 < y2 && x1 < x2) {
      for (int j = x1; j <= x2; j++) {
        color pix = img.get(x1+j-x1, y1+j-x1);
        if (pix == 255)
          img.set(x1+j-x1, y1+j-x1, 0);
        else if (pix == 0) img.set(x1+j-x1, y1+j-x1, color(255, 0, 0));
      }
    }
    if (y1 < y2 && x1 > x2) {
      for (int j = x2; j <= x1; j++) {
        color pix = img.get(x2+j-x2, y2-j+x2);
        if (pix == 255)
          img.set(x2+j-x2, y2-j+x2, 0);
        else if (pix == 0) img.set(x2+j-x2, y2-j+x2, color(255, 0, 0));
      }
    }

    if (y1 > y2 && x1 < x2) {
      for (int j = x1; j <= x2; j++) {
        color pix = img.get(x1+j-x1, y1-j+x1);
        if (pix == 255)
          img.set(x1+j-x1, y1-j+x1, 0);
        else if (pix == 0) img.set(x1+j-x1, y1-j+x1, color(255, 0, 0));
      }
    }

    if (y1 > y2 && x1 > x2) {
      for (int j = x2; j <= x1; j++) {
        color pix = img.get(x2+j-x2, y2+j-x2);
        if (pix == 255)
          img.set(x2+j-x2, y2+j-x2, 0);
        else if (pix == 0) img.set(x2+j-x2, y2+j-x2, color(255, 0, 0));
      }
    }
  }
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      if (img.get(i, j) == color(255, 0, 0))
        intersections++;
    }
  }

  println("second star *" + intersections);
  image(img, 0, 0);
}
