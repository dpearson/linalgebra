###
	Copyright 2013 David Pearson.
	BSD License.
###

assert=require "assert"
vows=require "vows"

matrix=require "../lib/matrix"

matrixOne=[[1, 3], [1, 0], [1, 2]]
matrixTwo=[[0, 0], [7, 5], [2, 1]]

vows
	.describe("Basic matrix operations")
	.addBatch
		"Addition":
			topic: ->
				matrix.add matrixOne, matrixTwo

			"We get a two-dimensional array": (topic) ->
				assert.isTrue Object.prototype.toString.call(topic)=="[object Array]" and topic[0]? and Object.prototype.toString.call(topic[0])=="[object Array]"

			"We get a 3x2 matrix": (topic) ->
				assert.isTrue topic.length==3 and topic[0].length==2

			"We get the correct solution": (topic) ->
				assert.isTrue matrix.equals topic, [[1, 3], [8, 5], [3, 3]]
	.addBatch
		"Scalar multiplication":
			topic: ->
				matrix.multiplyScalar matrixOne, 5

			"We get a two-dimensional array": (topic) ->
				assert.isTrue Object.prototype.toString.call(topic)=="[object Array]" and topic[0]? and Object.prototype.toString.call(topic[0])=="[object Array]"

			"We get a 3x2 matrix": (topic) ->
				assert.isTrue topic.length==3 and topic[0].length==2

			"We get the correct solution": (topic) ->
				assert.isTrue matrix.equals topic, [[5, 15], [5, 0], [5, 10]]
	.addBatch
		"Matrix multiplication":
			topic: ->
				matrix.multiplyScalar matrixOne, 5

			"We get a two-dimensional array": (topic) ->
				assert.isTrue Object.prototype.toString.call(topic)=="[object Array]" and topic[0]? and Object.prototype.toString.call(topic[0])=="[object Array]"

			"We get a 3x2 matrix": (topic) ->
				assert.isTrue topic.length==3 and topic[0].length==2

			"We get the correct solution": (topic) ->
				assert.isTrue matrix.equals topic, [[5, 15], [5, 0], [5, 10]]

	.export(module);