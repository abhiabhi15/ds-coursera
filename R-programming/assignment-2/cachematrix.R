#In the below solution, I have used a "<<-" operator to save the variable beyond the function environment
#for the general access purpose as required.
#Below are two functions that are used to create a special object that stores a matrix vector and caches its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to

#set the value of the matrix
#get the value of the matrix
#set the value of the inverse of the matrix
#get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  # To check if the matrix vector is passed as an argument
  if(!is.matrix(x)){
    stop("Please pass the matrix vector only")
  }
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## The second function work out of the special matrix created by the above makeCacheMatrix function and
# returns the inverse of the matrix. It first checks if the inverse of the matrix already exist in the global environment using getInverse function.
#If present it returns the value or else it the computes the inverse of the matrix using solve() function and caches the result before returning it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv) && !is.na(inv)){
    message("getting cached data for inverse")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...) # With an assumption that the matrix is invertible
  x$setInverse(inv)
  inv
}
