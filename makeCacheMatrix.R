#using to functions to find the inverse of a matrix
#there are two functions - makeCacheMatrix and cacheSolve

#makeCacheMatrix consists of set,get,setInverse,getInverse

library(MASS)
makeCacheMatrix <- function(x=martrix()){
  inv <- NULL       ##initializing inv as NULL.
  set <- function(y){
    x<<-y
    inv<<-NULL
  }
  get <- function() {x}    ##function to get the matrix
  setInverse <- function(inverse) {inv<<-inverse}
  getInverse <- function() {
    inver <- ginv(x)
    inver%*%x      #function to obtain the inverse of the matrix
  }
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

#cacheSolve is used to get the cached data

cacheSolve <- function(x,...){    ##gets the cache data
  inv <- x$getInverse()
  if(!is.null(inv)){           ##checking whether the inverse is NULL
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat,...)      ##calculate the inverse value
  x$serInverse(inv)
  inv     
}
