###
	Copyright 2013 David Pearson.
	BSD License.
###

gelim=require("./gelim").gelim

# Performs back substitution on an augmented matrix to solve a system
# 	of linear equations
#
# a - The augmented matrix
#
# Example:
#		backsub [[1, 0, 0, 2], [0, 1, 0, 3.0000000000000004],
# 				[0, 0, 1, -0.9999999999999999]]
#		 => [2, 3.0000000000000004, -0.9999999999999999]
#
# Returns an array of solution values in the format [x0...xn]
backsub=(a) ->
	vals=[]
	width=a[0].length-1

	i=a.length-1
	while i>=0
		j=width-1
		val=a[i][width]
		while j>i
			val-=a[i][j]*vals[j]
			j--
		val/=a[i][i]
		vals[i]=val
		i--

	vals

# Solves a system of linear equations
#
# a - The augmented matrix representing the system to solve
#
# Example:
#		solve [[2, 1, -1, 8], [-3, -1, 2, -11], [-2, 1, 2, -3]]
#		 => [2, 3.0000000000000004, -0.9999999999999999]
#
# Returns an array of solution values in the format [x0...xn]
solve=(a) ->
	red=gelim a
	vals=backsub red

exports.backsub=backsub
exports.solve=solve