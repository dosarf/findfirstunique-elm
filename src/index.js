'use strict';

require('material-components-elm-js-imports')
require('./index.html');
var elm = require('./Main.elm');

var app = elm.Elm.Main.init({
  node: document.getElementById('main')
});
