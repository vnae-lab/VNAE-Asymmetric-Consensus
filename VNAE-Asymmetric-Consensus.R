# ---------------------------------------------
#  VNAE Asymmetric Consensus - Minimal Example
# ---------------------------------------------

rm(list = ls())

# Number of agents
N <- 5

# Asymmetry parameters (theta_i)
theta <- c(1.2, 0.5, 1.0, 0.3, 0.8)

# Initial states
x0 <- runif(N, -2, 2)

# Time grid
dt <- 0.01
T  <- 10
time <- seq(0, T, by = dt)

# Graph Laplacian (simple ring topology)
L <- matrix(0, N, N)
for (i in 1:N) {
  L[i, i] <- 2
  L[i, ((i %% N) + 1)] <- -1
  L[i, ((i - 2 + N) %% N) + 1] <- -1
}

# Storage
X <- matrix(0, length(time), N)
X[1, ] <- x0

# Dynamics
for (t in 2:length(time)) {
  x <- X[t - 1, ]
  dx <- -L %*% x - theta * x
  X[t, ] <- x + dt * dx
}

# Plot
matplot(time, X, type = "l", lwd = 2,
        xlab = "Time", ylab = "Agent states",
        main = "Asymmetric Consensus under VNAE")
grid()




