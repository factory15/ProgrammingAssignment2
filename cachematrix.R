
## this function takes a matrix as its argument and sets and retrieves the inverse of that matrix
## 


makeCacheMatrix <- function(x = matrix()) {

  library(MASS)  ## include this library for the ginv() function
  m <- NULL  ## init variable
  set <- function(y = matrix()) {
    x <<- y ## sets a new matrix if called
    m <<- NULL
  }
  get <- function() x ##retrieves the original matrix
  
  setInv <- function(ginv){
    m <<- ginv
    ##set the inverse to m
    
  }
  getInv <- function() m ##pulls the inverse calculated by cachesolve
  
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}




## The function checks to see if there is a cached value of the inverse, if not it calculates the inverse
## and sets it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInv()
  if(!is.null(m)) { ## check to see if inverse was calculated before
    message("getting cached data")
    return(m)## return value
  }
  data <- x$get()## we need to calcuate, get the original matrix
  m <- ginv(data, ...)## calc the inverse
  x$setInv(m)## set the value for caching later
  m  ## return inverse
}
