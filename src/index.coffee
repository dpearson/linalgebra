###
	Copyright 2013 David Pearson.
	BSD License.
###

gelim=require "./gelim"
exports.gelim=gelim.gelim
exports.gjelim=gelim.gjelim

solve=require "./solve"
exports.backsub=solve.backsub
exports.solve=solve.solve

ops=require "./matrix"
exports.add=ops.add
exports.multiplyScalar=ops.multiplyScalar
exports.multiply=ops.multiply
exports.trace=ops.trace
exports.transpose=ops.transpose
exports.equals=ops.equals