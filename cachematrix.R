## The pair of funstions below will cache the inverse of
## a square matrix to reduce cost during matrix inversions.


# makeCacheMatrix: This function creates a special "matrix" object
# that can cache its inverse. It returns a list that gets and sets
# the matrix and sets and gets the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
      
          inv_mat <- NULL
        set <- function(y) {
                x <<- y
                inv_mat <<- NULL
                
}
        get <- function() x
        setinv <- function(inverse) inv_mat <<- inverse
        getinv <- function() inv_mat
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


# This function retrieves the inverse of the matrix that
# has already been calculatedfrom the cache, otherwise it 
# computes the inverse of the special "matrix" 
# returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
 
        inv = x$getinv()  
        
        if (!is.null(inv)){
                message("getting cached data")
                return(inv)                
}
mat_data <- x$get()
inv_mat <- solve(mat_data, ...)
x$setinv(inv_mat)
return(inv_mat)                 ## Return the inverse of the matrix.
               
}


