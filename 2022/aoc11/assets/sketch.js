var loadString;
var monkey = [];
var compress;

function preload() {
    loadString = loadStrings('assets/data.txt');
}

function setup() {

    // APES START
    var apeNum = 0;

    for (let i = 0; i < loadString.length; i += 6) {

        // ITEMS
        let items = [];
        let itemsString = split(loadString[i + 1], ' ');

        for (let j = 4; j < itemsString.length; j++) {
            items.push((itemsString[j].substring(0, 2)));
        }

        // OPERATION
        let operation = split(loadString[i + 2], '= ')[1];

        // DIVISIBLE
        let divisible = split(loadString[i + 3], ' ');
        divisible = int(divisible[divisible.length - 1]);

        // THROWS
        let throw1 = split(loadString[i + 4], ' ');
        let throw2 = split(loadString[i + 5], ' ');
        throw1 = int(throw1[throw1.length - 1]);
        throw2 = int(throw2[throw2.length - 1]);

        monkey.push(new Monkey(items, divisible, operation, throw1, throw2));
        apeNum++;
    }

    // COMPRESS WORRY LVL
    compress = 1;
    for (let i = 0; i < monkey.length; i++) {
        compress *= monkey[i].divisible;
    }

    // JIGGLE
    for (let j = 0; j < 10000; j++) {
        for (let i = 0; i < monkey.length; i++) {
            monkey[i].activity();
        }
    }

    let maxTimes = [];
    for (let i = 0; i < monkey.length; i++) {
        maxTimes.push(monkey[i].times);
    }
    maxTimes = maxTimes.sort((a, b) => b - a);

 console.log(maxTimes[0]*maxTimes[1]);
}

class Monkey {
    constructor(items, divisible, operation, throw1, throw2) {
        this.items = items;
        this.divisible = divisible;
        this.operation = operation;
        this.throw1 = throw1;
        this.throw2 = throw2;
        this.times = 0;
    }

    activity() {
        let roundsize = 0;
        for (let i = 0; i < this.items.length; i++) {
            this.num1 = split(this.operation, ' ')[0];
            this.ope = split(this.operation, ' ')[1];
            this.num2 = split(this.operation, ' ')[2];
            this.items[i]%= compress;
            if (this.num1 == "old") this.num1 = this.items[i];
            else this.num1 = int(this.num1);
            if (this.num2 == "old") this.num2 = this.items[i];
            else this.num2 = int(this.num2);
            this.items[i] = oper[this.ope](this.num1, this.num2)
            //  this.items[i] = floor(this.items[i] / 3);
            if (this.items[i] % this.divisible == 0)
                monkey[this.throw1].items.push(this.items[i]);
            else monkey[this.throw2].items.push(this.items[i]);
            roundsize++;
            this.times++;
        }
        for (let i = 0; i < roundsize; i++) {
            this.items.shift();
        }
    }
}


var oper = {
    '+': function (x, y) {
        return x + y;
    },
    '-': function (x, y) {
        return x - y;
    },
    '*': function (x, y) {
        return x * y;
    }
};