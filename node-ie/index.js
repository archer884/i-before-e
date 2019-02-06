var fs = require('fs');
var pattern = /c?ei/g;

let path = process.argv[2];
fs.readFile(path, "utf8", (err, data) => process_file(data, err));

function process_file(data, err) {
    if (err) {
        console.error(err);
        return;
    }

    let content = data.toString();
    
    // Apparently, this regular expression splits on windows or unix line endings.
    //
    // ...because that's a thing you need for node.
    let lines = content.split(/\r?\n/);
    lines.forEach(item => {
        if (!is_valid(item)) {
            console.log(item);
        }
    });
}

function is_valid(s) {
    let captures = pattern.exec(s);
    if (!captures) {
        return true;
    }

    for (let i = 0; i < captures.length; ++i) {
        let capture = captures[i];

        if (!capture.startsWith('c')) {
            return false;
        }
    }
    return true;
}
