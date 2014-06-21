## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  InvMatrix<-NULL
  
  SetMatrix<-function(y)
  {
    InvMatrix<-NULL
    x<<-y
  }
  
  GetMatrix<-function() x
  
  SetInvMatrix<-function(im) InvMatrix<<-im
  
  GetInvMatrix<-function() InvMatrix
  
  list(SetMatrix=SetMatrix, GetMatrix= GetMatrix,
       SetInvMatrix=SetInvMatrix,GetInvMatrix=GetInvMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  InvMatrix<-x$GetInvMatrix()
  if(!is.null(InvMatrix))
  {
    message("getting cached data")
  }
  else
  {
    message("no cached data")
    InvMatrix<-solve(x$GetMatrix())
    x$SetMatrix(InvMatrix)
  }

  InvMatrix
}
