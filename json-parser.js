#!/usr/bin/env node

var stdin = process.openStdin();

var data = "";

stdin.on('data', function(chunk) {
    data += chunk;
});

stdin.on('end', function() {
    console.log("::error file=app/assets/stylesheets/application.css,line=17,col=3::Something went wrong");
    // parse json
    var jsonParsed = JSON.parse(data);
    jsonParsed.forEach(function (error, _index) {
        error["warnings"].forEach(function (warning, _index) {
            console.log("::" + warning.severity +
                (" file=" + error.source + ",") +
                ("line=" + warning.line + ",") +
                ("col=" + warning.column + "::") +
                ("" + warning.text));
        });
    });
 });
