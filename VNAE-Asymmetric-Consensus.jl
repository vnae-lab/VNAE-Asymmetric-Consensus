using Plots
using LinearAlgebra

# ---------------------------------------------
#  VNAE Asymmetric Consensus - Minimal Example
# ---------------------------------------------

# Number of agents
N = 5

# Asymmetry parameters (theta_i) - The structural curvature
theta = [1.2, 0.5, 1.0, 0.3, 0.8]

# Initial states (random values between -2 and 2)
x0 = rand(N) .* 4 .- 2

# Time grid
dt = 0.01
T_max = 10.0
time_seq = 0:dt:T_max
n_steps = length(time_seq)

# Graph Laplacian (simple ring topology)
L = zeros(N, N)
for i in 1:N
    L[i, i] = 2
    # Next neighbor (ring)
    next_node = (i % N) + 1
    # Previous neighbor (ring)
    prev_node = ((i - 2 + N) % N) + 1
    
    L[i, next_node] = -1
    L[i, prev_node] = -1
end

# Storage Matrix (n_steps x N)
X = zeros(n_steps, N)
X[1, :] = x0

# Dynamics Simulation (VNAE Gradient Flow)
for t in 2:n_steps
    x = X[t-1, :]
    
    # Differential equation: dx = -L*x - theta*x
    # theta * x is an element-wise multiplication in this context
    dx = -L * x - (theta .* x)
    
    # Euler integration step
    X[t, :] = x + dt * dx
end

# Visualization
plot(time_seq, X, 
     lw=2, 
     title="Asymmetric Consensus under VNAE (Julia)",
     xlabel="Time", 
     ylabel="Agent states",
     legend=:bottomright)
