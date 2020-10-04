vsk_rvs <- function(n, Rho, P, seed = 1) {
  set.seed(seed)
  rn <- stats::rnorm(n)
  rv <- stats::pnorm((stats::qnorm(P) - sqrt(Rho) * rn) / sqrt(1 - Rho))
  return(rv)
}
