var fs = require('fs');

let path = process.argv[0];
fs.readFile(path, (err, data) => process_file(data));

function process_file(data) {
    console.log(data);
}

// This whole stupid fucking thing is bullshit.
