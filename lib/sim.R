sim <- function (s = 1, n = 10) {
  require(simr)
  effectSizes <- 1.18
  a <- c("Rest", "Exercise")
  b <- c("No blockade", "In vitro blockade", "In vivo blockade")
  beta <- c(0, effectSizes, 0, 0)  # Fixed intercept and slope
  V1 <- 1 * (effectSizes ^ 2)  # Random intercept variance; increase to be conservative
  s <- s * effectSizes  # Residual variance; increase to be conservative
  nsim <- 200
  df <- expand.grid(a = a, b = b, subject = factor(1:n))
  f <- formula(y ~ a + b + (1 | subject))
  M <- makeLmer(f, fixef = beta, VarCorr = V1, sigma = s, data = df)
  power <- powerSim(M, test = fixed("a"),
                    nsim = nsim, alpha = alpha, progress = FALSE)
  list(lme = M, power = power)
}
