






trix inversion is usually a costly computation and
## there may be some benefit to caching the inverse of a
## matrix rather than computing it repeatedly

## functions do:
## the first function creates a special objec that stores amatrix
## the second function caches it's reverse

## this function creates a special matrix object that stores it's inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) inv <<- solve
  getsolve <- function() inv
  list(set = set, get = get, 
       setsolve =setsolve,
       getsolve = getsolve)
}


## this function computes the inverse of the matrix which is produced by the above function. 
## if the inverse is in the cache, this function retrieves it.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getsolve()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setsolve(inv)
  inv
}








