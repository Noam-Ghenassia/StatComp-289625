peeking <- function(a=25,b=10,c=7,d=5){
  x <- rnorm(25)
  Tstat <- mean(x)/sd(x)*sqrt(length(x))
  if(abs(Tstat) > qt(0.975,length(x)-1)){
    return(Tstat)
  }else{
    x <- append(x, rnorm(b))
    Tstat <- mean(x)/sd(x)*sqrt(length(x))
    if(abs(Tstat) > qt(0.975,length(x)-1)){
      return(Tstat)
    }else{
      x <- append(x,rnorm(c))
      Tstat <- mean(x)/sd(x)*sqrt(length(x))
      if(abs(Tstat) > qt(0.975,length(x)-1)){
        return(Tstat)
      }else{
        x <- append(x,rnorm(d))
        Tstat <- mean(x)/sd(x)*sqrt(length(x))
        return(Tstat)
      }
    }
  }
}
set.seed(517)
Tstats <- sapply(1:10000,peeking)
mean(I(abs(Tstats) > qnorm(0.975)))


