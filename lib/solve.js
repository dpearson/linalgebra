// Generated by CoffeeScript 1.6.3
/*
	Copyright 2013 David Pearson.
	BSD License.
*/


(function() {
  var backsub, gelim, solve;

  gelim = require("./gelim").gelim;

  backsub = function(a) {
    var i, j, val, vals, width;
    vals = [];
    width = a[0].length - 1;
    i = a.length - 1;
    while (i >= 0) {
      j = width - 1;
      val = a[i][width];
      while (j > i) {
        val -= a[i][j] * vals[j];
        j--;
      }
      val /= a[i][i];
      vals[i] = val;
      i--;
    }
    return vals;
  };

  solve = function(a) {
    var red, vals;
    red = gelim(a);
    return vals = backsub(red);
  };

  exports.backsub = backsub;

  exports.solve = solve;

}).call(this);
