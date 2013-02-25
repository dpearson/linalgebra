## Function Reference ##

### Solving Systems of Linear Equations ###

	solve(matrix)

Perform Gaussian elimination on the augmented matrix `matrix` to place it in Row Echelon form before back-substituting to find the solution. Returns a solution matrix in the form `[x0, x1, ..., xn]`.

***

	backsub(matrix)

Performs back substitution on an augmented matrix to solve a system of linear equations. Returns a solution matrix in the form `[x0, x1, ..., xn]`.

### Row Reduction ###

	gelim(matrix)

Perform Gaussian elimination on `matrix` to place it in Row Echelon form.

***

	gjelim(matrix)

Perform Gauss-Jordan elimination on `matrix` to place it in Reduced Row Echelon form.

### Basic Operations ###

	add(a, b)

Adds two matrices and returns the result.

***

	multiplyScalar(matrix, mult)

Multiplies `matrix` by `mult` and returns the result. *Note: the original matrix is modified.*

***

	multiply(a, b)

Multiplies `a` and `b` before returning the result.

***

	trace(matrix)

Calculates the trace of `matrix`.

***

	transpose(matrix)

Returns a transposed copy of `matrix`.

***

	equals(matrix)

Tests two matrices for strict, elemental equality.