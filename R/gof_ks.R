#' Kolmogorov-Smirnov goodness-of-fit test for the Vasicek distribution
#'
#' The function \code{gof_ks} performs Kolmogorov-Smirnov goodness-of-fit
#' test for the Vasicek distribution
#'
#' @param x   A numeric vector in the (0, 1) interval that is supposed to
#'            follow the Vasicek distribution
#' @param Rho The Rho parameter in the Vasicek distribution
#' @param P   The P parameter in the Vasicek distribution
#'
#' @return A list with statistical test result, including ks stat and p-value.
#'
#' @examples
#' x <- vsk_rvs(100, Rho = 0.2, P = 0.1)
#' gof_ks(x, Rho = 0.2, P = 0.1)

gof_ks <- function(x, Rho, P) {
  x_ <- sort(x[x > 0 & x < 1 & !is.na(x)])
  cdf0 <- stats::ecdf(x_)(x_)
  cdf1 <- vsk_cdf(x, Rho = Rho, P = P)
  ks <- stats::ks.test(cdf0, cdf1)
  return(list(ks = ks$statistic, pvalue = ks$p.value))
}
