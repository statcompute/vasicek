vsk_imm <- function(x) {
  x_ <- x[x > 0 & x < 1 & !is.na(x)]
  mu <- mean(qnorm(x_))
  s2 <- mean((qnorm(x_)) ** 2) - mu * mu
  p_ <- pnorm(mu / sqrt(1 + s2))
  r_ <- s2 / (1 + s2)
  return(list(Rho = r_, P = p_))
}
