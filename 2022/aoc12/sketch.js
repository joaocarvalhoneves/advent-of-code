var cols;
var rows;
var grid;
var openSet = [];
var closedSet = [];
var start;
var end;
var w, h;
var path = [];

function preload() {
  loadString = loadStrings('data.txt');
  font = loadFont('ak.OTF');
}

function setup() {
  createCanvas(500, 500);
  textAlign(CENTER, CENTER);
  textFont(font, 13);

  cols = loadString[0].length;
  rows = loadString.length;

  w = width / cols;
  h = height / rows;

  grid = new Array(cols);
  for (var i = 0; i < cols; i++) {
    grid[i] = new Array(rows);
  }

  for (var i = 0; i < cols; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j] = new Spot(loadString[j].charCodeAt(i), i, j);
      if (grid[i][j].char == 83) {
        grid[i][j].char = 97;
        start = grid[i][j];
      } else if (grid[i][j].char == 69) {
        grid[i][j].char = 122;
        end = grid[i][j];
      }
    }
  }

  for (var i = 0; i < cols; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j].addNeighbors(grid);
    }
  }
  openSet.push(start);
}

function draw() {
  background(0);
  if (openSet.length > 0) {
    var winner = 0;
    for (var i = 0; i < openSet.length; i++) {
      if (openSet[i].f < openSet[winner].f) {
        winner = i;
      }
    }
    var current = openSet[winner];

    if (current === end) {
      endedCycle = true;
      foundPath = true;
    }

    removeFromArray(openSet, current);
    closedSet.push(current);

    var neighbors = current.neighbors;
    for (var i = 0; i < neighbors.length; i++) {
      var neighbor = neighbors[i];

      if (!closedSet.includes(neighbor) && (neighbor.char - current.char) <= 1) {
        var tempG = current.g + heuristic(neighbor, current);

        var newPath = false;
        if (openSet.includes(neighbor)) {
          if (tempG < neighbor.g) {
            neighbor.g = tempG;
            newPath = true;
          }
        } else {
          neighbor.g = tempG;
          newPath = true;
          openSet.push(neighbor);
        }

        if (newPath) {
          neighbor.h = heuristic(neighbor, end);
          neighbor.f = neighbor.g + neighbor.h;
          neighbor.previous = current;
        }
      }
    }
  } else {
    console.log('no solution');
    endedCycle = true;
  }

  for (var i = 0; i < cols; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j].show(color(255), 1);
    }
  }

  for (var i = 0; i < closedSet.length; i++) {
    closedSet[i].show(color(255, 20, 147), 0);
  }

  for (var i = 0; i < openSet.length; i++) {
    openSet[i].show(color(0, 255, 0), 0);
  }

  if (current.g > 0) {
    path = [];
    var temp = current;
    path.push(temp);
    while (temp.previous) {
      path.push(temp.previous);
      temp = temp.previous;
    }
  }

  noFill();
  stroke(255);
  strokeWeight(1);
  beginShape();
  for (var i = 0; i < path.length; i++) {
    vertex(path[i].i * w + w / 2, path[i].j * h + h / 2);
  }
  endShape();

  noStroke();
  start.show(color(255, 255, 0), 0);
  end.show(color(255, 255, 0), 0);
}

function removeFromArray(arr, elt) {
  for (var i = arr.length - 1; i >= 0; i--) {
    if (arr[i] == elt) {
      arr.splice(i, 1);
    }
  }
}

function heuristic(a, b) {
  var d = abs(a.i - b.i) + abs(a.j - b.j);
  return d;
}