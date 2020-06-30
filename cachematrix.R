## Put comments here that give an overall description of what your
## functions do

## The below function creates a special vector which is a list containing functions to set the value of vector, 
## get the value of vector, set the value of inverse and to get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
                inv<- NULL
        set <- function(y) {
                x <<- y
                inv<<- NULL
        }
        get <- function() x
        setInv <- function(solve) inv <<- solve
        getInv <- function() inv
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)

}


## The below function calculates the inverse of the matrix and returns it. It checks if the inverse has already been calculates. 
## If yes, then it returns the cached value, else calculates the inverse

cacheSolve <- function(x, ...) {
        inv <- x$getInv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setInv(inv)
        inv
}
