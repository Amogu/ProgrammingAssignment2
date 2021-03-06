## The pair of functions below cache the inverse of matrix
## to avoid repeating the computation if the inverse was previously computed


## The 'makeCacheMatrix' function takes a matrix as its argument and
## outputs a special matrix which in effect is a list of functions 
## (set, get, setInverse and getInverse).

makeCacheMatrix <- function(x = matrix()) { #
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x #creates an anonymous function that returns the matrix, 'x'
  setInverse <- function(Inverse) m <<- Inverse
  getInverse <- function() m # an anonymous function that returns 'm'
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse) 
  

}


## The 'cacheSolve' function computes the inverse of the 
## special matrix as generated by 'makecacheMatrix' 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
