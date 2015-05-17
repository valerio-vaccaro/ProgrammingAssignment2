## The makeCacheMatrix create all the structure for cache the matrix and the inverse and provide function for get and set this 
## elements.
##
## ARGS - The only argument is the original matrix.
## RETURN - The list of fuctions useful for set and get original and inverse matrix
##
## The makeCacheMatrix function receive a matrix, initialize the inverse cache to null and return a list with the following 
## functions (defined in the same function):
##  * set for set the original matrix (passed via argument) and erase the inverse
##  * get for get the original matrix
##  * setInverse for set the inverse matrix (passed via argument) 
##  * getInverse for get the inverse matrix 
makeCacheMatrix <- function(x = matrix()) {
        ## Set inverse matrix to NULL
        inverse <- NULL
        
        ## Define the function for set the original matrix (passed via argument) and erase the inverse 
        set <- function(y){
                x <<- y
                inverse <<- NULL
        }
        
        ## Define the function for get the original matrix
        get <- function() x
        
        ## Define the function for set the inverse matrix (passed via argument) 
        setInverse <- function(inv) inverse <<- inv
        
        ## Define the function for get the inverse matrix 
        getInverse <- function() inverse
        
        ## Return function list 
        list( set = set, get=get,
              setInverse = setInverse,
              getInverse = getInverse)
}


## The function cacheSolve calculate the inverse of a matrix using, if available, the cached result.
##
## ARGS - The argument x is the list produced by makeCacheMatrix function, ... allow you to add arguments passed to 
## other methods (actual implementation don't need usage of other arguments)
## RETURN - The inverse matrix
##
## If the inverse is cached the function return the cached result, otherwise it calculate the inverse (by Solve()), 
## store it in cache and return the result.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        ## First get the cached inverse matrix of the x matrix
        inverse <- x$getInverse()
        
        ## Check if the cached inverse matrix exist 
        if( !is.null(inverse) ) { 
                ## Exist (is not null) so I print a message and return this matrix
                message("getting cached inverse matrix")
                ## With return R exit from this function, following code will work only if inverse is null 
                ## (that means not exist a cached inverse)
                return(inverse) 
        }
        
        ##  Otherwise inverse is null, let's calculate

        ## Get original matrix  
        matrix <- x$get() 
        
        ##  Computate the inverse
        inverse <- solve(matrix)
        
        ## Store the inverse 
        x$setInverse(inverse)
        
        ## Return the inverse
        inverse  
}
