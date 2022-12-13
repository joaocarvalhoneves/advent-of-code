class Spot {
  constructor(char, i, j) {
    this.char = char;
    this.i = i;
    this.j = j;
    this.f = 0;
    this.g = 0;
    this.h = 0;
    this.neighbors = [];
    this.previous = undefined;
    this.wall = false;
  }

  show(col, a) {
    noFill();
    rect(this.i * w, this.j * h, w, h);
    noStroke();
    if (a == 1) fill(255);
    else fill(col);
    text(char(this.char), this.i * w, this.j * h, w, h);
  };

  addNeighbors(grid) {
    var i = this.i;
    var j = this.j;
    if (i < cols - 1) {
      this.neighbors.push(grid[i + 1][j]);
    }
    if (i > 0) {
      this.neighbors.push(grid[i - 1][j]);
    }
    if (j < rows - 1) {
      this.neighbors.push(grid[i][j + 1]);
    }
    if (j > 0) {
      this.neighbors.push(grid[i][j - 1]);
    }
  };
}