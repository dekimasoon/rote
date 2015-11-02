var riot = require('riot')
var fs = require('fs')

var tag = fs.readFileSync('./app/views/welcome/welcome.tag', 'utf-8')
console.log(tag)
console.log(riot.compile(tag))
