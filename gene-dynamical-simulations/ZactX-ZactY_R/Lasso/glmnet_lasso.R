glmnet_lasso <- function(X, Y, lambda)
{
    n <- dim(Y)[2]
    B <- foreach(i=1:n, .combine='cbind') %dopar%
    {
        # In a foreach loop automatic print is closed
        #print(i)
        # Y is a vector.
        # using matrix to change it
        ycol <- Y[,i]
    
        ret <- glmnet(X, ycol, family='gaussian', standardize=FALSE, lambda=lambda, intercept=FALSE)
        return(matrix(ret$beta))
    }
    return(B)
}
