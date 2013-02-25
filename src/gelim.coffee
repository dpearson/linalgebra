###
	Copyright 2013 David Pearson.
	BSD License.
###

# Private: Switches two rows in a matrix
#
# a - The matrix in which to switch rows
# x - The first row's index (zero-offset)
# y - The second row's index (zero-offset)
#
# Example:
#		swap [[1], [2], [3]], 0, 2
#		 => [[3], [2], [1]]
#
# Returns a modified version of a with the rows swapped
swap=(a, x, y) ->
	tmp=a[y]
	a[y]=a[x]
	a[x]=tmp

	a

# Performs Gaussian elimination on a matrix to place it
# 	into Row Echelon Form
#
# a - The matrix to row reduce
#
# Example:
#		gelim [[2, 1, -1, 8], [-3, -1, 2, -11], [-2, 1, 2, -3]]
#		 => [[1, 0.3333333333333333, -0.6666666666666666,
# 			3.6666666666666665], [0, 1, 0.4000000000000001,
# 			2.6], [0, 0, 1, -0.9999999999999999]]
#
# Returns a modified version of a in Row Echelon Form
gelim=(a) ->
	x=0
	while x<a.length
		max=x
		i=x
		while i<a.length
			if Math.abs(a[i][x])>Math.abs(a[max][x])
				max=i
			i++
		if a[max][x]==0
			console.log "Not happening..."
		swap a, x, max

		i=x+1
		while i<a.length
			j=x+1
			k=a[i][x]/a[x][x]
			while j<a[max].length
				a[i][j]-=a[x][j]*k
				j++
			a[i][x]=0
			i++
		x++

	aug=a[0].length-1
	row=0
	while row<a.length
		mult=1/a[row][row]
		col=row
		while col<=aug
			a[row][col]*=mult
			col++
		row++

	a

# Performs Gauss-Jordan elimination on a matrix to place it
# 	into Reduced Row Echelon Form
#
# a - The matrix to row reduce
#
# Example:
#		gjelim [[2, 1, -1, 8], [-3, -1, 2, -11], [-2, 1, 2, -3]]
#		 => [[1, 0, 0, 2], [0, 1, 0, 3.0000000000000004],
# 			[0, 0, 1, -0.9999999999999999]]
#
# Returns a modified version of a in Reduced Row Echelon Form
gjelim=(a) ->
	x=0
	while x<a.length
		max=x
		i=x
		while i<a.length
			if Math.abs(a[i][x])>Math.abs(a[max][x])
				max=i
			i++
		if a[max][x]==0
			console.log "Not happening..."
		swap a, x, max

		i=0
		while i<x
			j=x+1
			k=a[i][x]/a[x][x]
			while j<a[max].length
				a[i][j]-=a[x][j]*k
				j++
			a[i][x]=0
			i++

		i=x+1
		while i<a.length
			j=x+1
			k=a[i][x]/a[x][x]
			while j<a[max].length
				a[i][j]-=a[x][j]*k
				j++
			a[i][x]=0
			i++
		x++

	aug=a[0].length-1
	row=0
	while row<a.length
		mult=1/a[row][row]
		a[row][row]*=mult
		a[row][aug]*=mult
		row++

	a

exports.gelim=gelim
exports.gjelim=gjelim