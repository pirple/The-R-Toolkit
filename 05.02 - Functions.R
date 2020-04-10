## Functions
# very basic
PlusSeven <- function(num){
  output <- num + 7
  return(output)
}

AddIt <- function(num1, num2){
  output <- num1 + num2
  return(output)
}

# little more involved
PailOfWater <- function(nm1, nm2){
  str <- paste0(nm1, " and ", nm2, " fetch a pail of water")
  return(str)
}


# let's play
playerCode <- function(nm){
  frst <- substr(nm, 1, regexpr(" ", nm)[1]-1)
  lst <- substr(nm, regexpr(" ", nm)[1] + 1, 999)
  initial <- substr(lst, 1, 1)
  last5 <- substr(lst, 1, 5)
  first2 <- substr(frst, 1, 2)
  ref.nm <- paste0(last5, first2, "01")
  return(ref.nm)
}