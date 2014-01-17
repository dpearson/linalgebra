###
	Copyright 2013 David Pearson.
	BSD License.
###

assert=require "assert"
vows=require "vows"

gelim=require "../lib/gelim"
matrix=require "../lib/matrix"

vows
	.describe("Gaussian Elimination")
	.addBatch
		"something":
			topic: ->
				gelim.gelim [[2, 1, -1, 8], [-3, -1, 2, -11], [-2, 1, 2, -3]]

			"We get a two-dimensional array": (topic) ->
				assert.isTrue Object.prototype.toString.call(topic)=="[object Array]" and topic[0]? and Object.prototype.toString.call(topic[0])=="[object Array]"

			"We get a 3x4 matrix": (topic) ->
				assert.isTrue topic.length==3 and topic[0].length==4

			"We get the correct solution": (topic) ->
				assert.isTrue matrix.equals topic, [
										[1, 0.3333333333333333, -0.6666666666666666, 3.6666666666666665]
										[0, 1, 0.4000000000000001, 2.6]
										[0, 0, 1, -0.9999999999999999]
									]

	.export(module);