source("cachematrix.R")

## Construct a test matrix
my_mat <- matrix(1:4, nrow = 2, ncol = 2)
## ... create the cache functions ...
my_mat_cache <- makeCacheMatrix(my_mat)
## ... inverse the matrix!
my_mat_inv <- cacheSolve(my_mat_cache)

## I try with another matrix ..
my_mat_2 <- matrix(c(1,0,5,2,1,6,3,4,0), nrow = 3, ncol = 3)
## ... I reuse the my_mat_cache obj setting a new matrix ...
my_mat_cache$set(my_mat_2)
## ... and computate the inverse ...
cacheSolve(my_mat_cache)
## ops I forgot to save ... I recall cacheSolve and it use the cached result!
my_mat_inv_2 <- cacheSolve(my_mat_cache)