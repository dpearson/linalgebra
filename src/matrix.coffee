###
	Copyright 2013 David Pearson.
	BSD License.
###

# Adds two matrices
#
# a - The left matrix in the addition
# b - The right matrix in the addition
#
# Example:
#		add [[1, 3], [1, 0], [1, 2]], [[0, 0], [7, 5], [2, 1]]
#		 => [[1, 3], [8, 5], [3, 3]]
#
# Returns the resulting matrix or null if the dimensions differ
add=(a, b) ->
	if a.length==b.length and a[0].length==b[0].length
		c=[]
		for i of a
			c[i]=[]
			for j of a[i]
				c[i][j]=a[i][j]+b[i][j]
		c
	else
		null

# Multiplies a matrix by a scalar value
#
# a    - The matrix to scale
# mult - The scalar value to multiply by
#
# Example:
#		 multiplyScalar [[1, 3], [1, 0], [1, 2]], 5
#		 => [[5, 15], [5, 0], [5, 10]]
#
# Returns the resulting matrix
multiplyScalar=(a, mult) ->
	for i of a
		for j of a[i]
			a[i][j]*=mult
	a

# Multiplies two matrices
#
# a - The left matrix in the operation
# b - The right matrix in the operation
#
# Example:
#		 multiply [[1, 3], [1, 0]], [[7, 5], [2, 1]]
#		 => [[13, 8], [7, 5]]
#
# Returns the resulting matrix or null if the operation
# 	is undefined
multiply=(a, b) ->
	if a[0].length==b.length
		c=[]
		for i of a
			c[i]=[]
			for j of b[i]
				c[i][j]=0
				for k of b
					c[i][j]+=a[i][k]*b[k][j]
		c
	else
		null

# Calculates the trace of a matrix
#
# matrix - The matrix to calculate the trace of
#
# Example:
#		 trace [[7, 5], [2, 1]]
#		 => 8
#
# Returns the trace or NaN if the trace is undefined
trace=(matrix) ->
	if matrix.length==matrix[0].length
		tr=0
		for i of matrix
			tr+=matrix[i][i]
		tr
	else
		NaN

# Transposes a matrix
#
# matrix - The matrix to transpose
#
# Example:
#		 transpose [[1, 2]]
#		 => [[1], [2]]
#
# Returns a transposed copy of the matrix
transpose=(matrix) ->
	res=[]
	for row of matrix[0]
		res[row]=[]
	for row of matrix
		for col of matrix[row]
			res[col][row]=matrix[row][col]
	res

# Tests two matrices for strict equality
#
# a - The first matrix
# b - The second matrix
#
# Example:
#		 equals [[7, 5]], [[7, 5]]
#		 => true
#
# Returns true if each element in a is equal
# 	to its counterpart in b
equals=(a, b) ->
	if a.length==b.length and a[0].length==b[0].length
		for i of a
			for j of a[i]
				if a[i][j]!=b[i][j]
					return false
		true
	else
		false

exports.add=add
exports.multiplyScalar=multiplyScalar
exports.multiply=multiply
exports.trace=trace
exports.transpose=transpose
exports.equals=equals