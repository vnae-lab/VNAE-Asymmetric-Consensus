import numpy as np
import matplotlib.pyplot as plt

# ---------------------------------------------
#  VNAE Asymmetric Consensus - Minimal Example
# ---------------------------------------------

# Number of agents
N = 5

# Asymmetry parameters (theta_i) - The VNAE "engine"
# Represents the structural friction of each node in the network
theta = np.array([1.2, 0.5, 1.0, 0.3, 0.8])

# Initial states (random values between -2 and 2)
np.random.seed(42)
x0 = np.random.uniform(-2, 2, N)

# Time grid
dt = 0.01
T_max = 10
time_seq = np.arange(0, T_max + dt, dt)
n_steps = len(time_seq)

# Graph Laplacian (simple ring topology)
L = np.zeros((N, N))
for i in range(N):
    L[i, i] = 2
    # Next neighbor (ring) - Python index starts at 0
    next_node = (i + 1) % N
    # Previous neighbor (ring)
    prev_node = (i - 1 + N) % N
    
    L[i, next_node] = -1
    L[i, prev_node] = -1

# Storage Matrix (n_steps x N)
X = np.zeros((n_steps, N))
X[0, :] = x0

# Dynamics Simulation (VNAE Gradient Flow)
for t in range(1, n_steps):
    x = X[t-1, :]
    
    # Differential equation: dx = -L*x - theta*x
    # In Python/Numpy, the '*' operator on arrays is element-wise
    dx = -L.dot(x) - (theta * x)
    
    # Euler integration step
    X[t, :] = x + dt * dx

# Visualization
plt.figure(figsize=(10, 6))
for i in range(N):
    plt.plot(time_seq, X[:, i], label=f'Agent {i+1}', linewidth=2)

plt.title("Asymmetric Consensus under VNAE (Python)")
plt.xlabel("Time")
plt.ylabel("Agent states")
plt.legend(loc='best')
plt.grid(True)
plt.show()
