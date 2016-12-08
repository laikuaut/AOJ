'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function (line)
{
    var x = parseInt(line.trim(), 10);
    console.log(Math.pow(x, 3));
});
