
makeCacheMatrix <- function(x = matrix()) { #creating funciton that takes a matrix as a paramter and returns a list

        m <- NULL #create an empty variable called m
        
        set <- function(y) { #set is a nested function which takes one parameter
                x <<- y #here we do the cache, so that y == matrix
                m <<- NULL #inverse is still null
        }
        
        get <- function() {
                x #return x
        }
        
        setinverse <- function(inverse) {
                m <<- inverse #set m to be the inverse
        }
        
        getinverse <- function() {
                m #return m
        }
        
        #creating a list with 4 functions: set, get, setinverse and getinverse
        list(set = set, 
             get = get,
             setinverse = setinverse,
             getinverse = getinverse
             )

}


cacheSolve <- function(x) { #create a function to return a matrix that is the inverse of 'x'
        
                m <- x$getinverse() #calls our function getinverse and assigns the value to m
                if(!is.null(m)) { #if m is not null, we return the value of m
                        message("pulling cached matrix") #friendly message to user
                        return(m) #return value of m
                }
                
                data <- x$get()
                m <- solve(data)
                x$setinverse(m) #get the inverse of m
                m #return m
        
}
