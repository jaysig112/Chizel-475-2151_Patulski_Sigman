<<<<<<< HEAD
`
"Test";
var fs = require('fs');
var path = require('path');

var diretoryTreeToObj = function(dir, done) {
    var results = [];

    fs.readdir(dir, function(err, list) {
        if (err)
            return done(err);

        var pending = list.length;

        if (!pending)
            return done(null, {name: path.basename(dir), type: 'folder', children: results});

        list.forEach(function(file) {
            file = path.resolve(dir, file);
            //console.log(file);
            fs.stat(file, function(err, stat) {
                if (stat && stat.isDirectory()) {
                    diretoryTreeToObj(file, function(err, res) {
                        //		console.log(file);

												var str_to_match = file.match(/OneDrive/g);
                        if (str_to_match != null){
                          // fs.stat(file && function(err, stat) {
                          //   if (stat && stat.isDirectory()) {
                          //     directoryTreeToObj
                          //   }
                          // }
                          console.log(file)
                        }
                        // console.log(str_to_match);
                        // results.push({
                        //     name: path.basename(file),
                        //     type: 'folder',
                        //     children: res
                        // });
                        // if (!--pending)
                        //     done(null, results);
                    });
                }
                else {
                    results.push({
                        type: 'file',
                        name: path.basename(file)
                    });
                    if (!--pending)
                        done(null, results);
                }
            });
        });
    });
};

var dirTree = ('c:\\');

diretoryTreeToObj(dirTree, function(err, res){
    if(err)
        console.error(err);

    //console.log(res);
});
;
`
