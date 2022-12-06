var boxx = [];
var loadString;
var score = "";

function preload() {
    loadString = loadStrings('assets/data.txt');
}

function setup() {
    // LOAD BOXES
    for (let i = 0; i < 9; i++) {
        boxx[i] = [];
    }
    for (let i = 0; i < 8; i++) {
        for (let j = 0; j < loadString[0].length; j += 4) {
            if (loadString[i].charAt(j + 1) != " ")
                boxx[int(j / 4)].push(loadString[i].charAt((j + 1)));
        }
    }
    for (let i = 0; i < 9; i++) {
        reverse(boxx[i]);
    }

    // UNLOADING
    for (let i = 10; i < loadString.length; i++) {
        let spl = split(loadString[i], ' ');
        // 1*
        //  cratemover(int(spl[1]), int(spl[3]), int(spl[5]));
        // 2*
        cratemover9001(int(spl[1]), int(spl[3]), int(spl[5]));
    }
    for (let i = 0; i < boxx.length; i++) {
        score += boxx[i][boxx[i].length - 1];
    }

    console.log(score);
}

function cratemover(a, b, c) {
    for (let i = 0; i < a; i++) {
        let moving = boxx[b - 1][boxx[b - 1].length - 1];
        boxx[b - 1].splice(boxx[b - 1].length - 1, 1);
        boxx[c - 1].push(moving);
    }
}

function cratemover9001(a, b, c) {
    for (let i = a; i > 0; i--) {
        let moving = boxx[b - 1][boxx[b - 1].length - i];
        boxx[c - 1].push(moving);
    }
    for (let i = 0; i < a; i++) {
        boxx[b - 1].splice(boxx[b - 1].length - 1, 1);
    }
}