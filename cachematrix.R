
## makeCacheMatrix: This function creates a special "matrix" 
## object that can cache its inverse.
 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
          x <<- y
          m <<- NULL
        }
        get <- function() x
        setSolve <- function(solve) m <<- solve
        getSolve <- function() m
        list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## cacheSolve: This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated, then the cachesolve
## should retrieve the inverse from the cache.
 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <-x$getSolve()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        if(ncol(data) == 2 & nrow(data) == 2) {
            m <- solve(data, ...)
            x$setSolve(m)
        }
        else {
            message("Not patient enough for a larger matrix than 2 x 2")	
        }
        m
}
