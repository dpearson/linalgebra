## Function Reference ##

### Solving Systems of Linear Equations ###

	```javascript
	solve(matrix)

Perform Gaussian elimination on the augmented matrix `matrix` to place it in Row Echelon form before back-substituting to find the solution. Returns a solution matrix in the form `[x0, x1, ..., xn]`.

***

	```javascript
	backsub(matrix)

Performs back substitution on an augmented matrix to solve a system of linear equations. Returns a solution matrix in the form `[x0, x1, ..., xn]`.

### Row Reduction ###

	```javascript
	gelim(matrix)

Perform Gaussian elimination on `matrix` to place it in Row Echelon form.

***

	```javascript
	gjelim(matrix)

Perform Gauss-Jordan elimination on `matrix` to place it in Reduced Row Echelon form.

### Basic Operations ###

	```javascript
	add(a, b)

Adds two matrices and returns the result.

***

	```javascript
	multiplyScalar(matrix, mult)

Multiplies `matrix` by `mult` and returns the result. *Note: the original matrix is modified.*

***

	```javascript
	multiply(a, b)

Multiplies `a` and `b` before returning the result.

***

	```javascript
	trace(matrix)

Calculates the trace of `matrix`.

***

	```javascript
	transpose(matrix)

Returns a transposed copy of `matrix`.

***

	```javascript
	equals(matrix)

Tests two matrices for strict, elemental equality.