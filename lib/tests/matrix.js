// Generated by CoffeeScript 1.6.3
/*
	Copyright 2013 David Pearson.
	BSD License.
*/


(function() {
  var assert, matrix, matrixOne, matrixTwo, vows;

  assert = require("assert");

  vows = require("vows");

  matrix = require("../lib/matrix");

  matrixOne = [[1, 3], [1, 0], [1, 2]];

  matrixTwo = [[0, 0], [7, 5], [2, 1]];

  vows.describe("Basic matrix operations").addBatch({
    "Addition": {
      topic: function() {
        return matrix.add(matrixOne, matrixTwo);
      },
      "We get a two-dimensional array": function(topic) {
        return assert.isTrue(Object.prototype.toString.call(topic) === "[object Array]" && (topic[0] != null) && Object.prototype.toString.call(topic[0]) === "[object Array]");
      },
      "We get a 3x2 matrix": function(topic) {
        return assert.isTrue(topic.length === 3 && topic[0].length === 2);
      },
      "We get the correct solution": function(topic) {
        return assert.isTrue(matrix.equals(topic, [[1, 3], [8, 5], [3, 3]]));
      }
    }
  }).addBatch({
    "Scalar multiplication": {
      topic: function() {
        return matrix.multiplyScalar(matrixOne, 5);
      },
      "We get a two-dimensional array": function(topic) {
        return assert.isTrue(Object.prototype.toString.call(topic) === "[object Array]" && (topic[0] != null) && Object.prototype.toString.call(topic[0]) === "[object Array]");
      },
      "We get a 3x2 matrix": function(topic) {
        return assert.isTrue(topic.length === 3 && topic[0].length === 2);
      },
      "We get the correct solution": function(topic) {
        return assert.isTrue(matrix.equals(topic, [[5, 15], [5, 0], [5, 10]]));
      }
    }
  }).addBatch({
    "Matrix multiplication": {
      topic: function() {
        return matrix.multiplyScalar(matrixOne, 5);
      },
      "We get a two-dimensional array": function(topic) {
        return assert.isTrue(Object.prototype.toString.call(topic) === "[object Array]" && (topic[0] != null) && Object.prototype.toString.call(topic[0]) === "[object Array]");
      },
      "We get a 3x2 matrix": function(topic) {
        return assert.isTrue(topic.length === 3 && topic[0].length === 2);
      },
      "We get the correct solution": function(topic) {
        return assert.isTrue(matrix.equals(topic, [[5, 15], [5, 0], [5, 10]]));
      }
    }
  })["export"](module);

}).call(this);