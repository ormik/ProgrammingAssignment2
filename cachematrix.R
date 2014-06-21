## Creating object for caching matrix inverse

## The following f creates object - a list - with f. for setting
## matrix, getting it, setting inverse and getting it

makeCacheMatrix <- function(x = matrix()) {
  
  InvMatrix<-NULL
  
  SetMatrix<-function(y) #set or change inpuet matrix
  {
    InvMatrix<<-NULL
    x<<-y
  }
  
  GetMatrix<-function() x # get input matrix
  
  SetInvMatrix<-function(im) InvMatrix<<-im #set inv matrix
  
  GetInvMatrix<-function() InvMatrix #get inv matrix
  
  list(SetMatrix= SetMatrix,GetMatrix= GetMatrix,
       SetInvMatrix=SetInvMatrix,GetInvMatrix=GetInvMatrix)
}


## F. cache solve function result, input should be created using makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  InvMatrix<-x$GetInvMatrix() #get current state of inv matrix
  if(!is.null(InvMatrix))
  {
    #it is not null so it can be used
    message("getting cached data") 
  }
  else                            
  {
    #inv has not been calculated so do it
    message("no cached data")
    InvMatrix<-solve(x$GetMatrix())
    x$SetInvMatrix(InvMatrix)
  }

  InvMatrix
}
