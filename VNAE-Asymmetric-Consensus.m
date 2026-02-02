% --------------------------------------------------
%  VNAE Asymmetric Consensus - Minimal Example
% --------------------------------------------------
clear; clc;

% Number of agents
N = 5;

% Asymmetry parameters (theta_i) - The "Structural Friction"
% This is the key VNAE component for stability
theta = [1.2, 0.5, 1.0, 0.3, 0.8];

% Initial states (random values between -2 and 2)
% Using a fixed seed for reproducibility
rng(42);
x0 = (rand(N, 1) * 4) - 2;

% Time grid
dt = 0.01;
T_max = 10;
time_seq = 0:dt:T_max;
n_steps = length(time_seq);

% Graph Laplacian (simple ring topology)
L = zeros(N, N);
for i = 1:N
    L(i, i) = 2;
    % Next neighbor (ring)
    next_node = mod(i, N) + 1;
    % Previous neighbor (ring)
    prev_node = mod(i - 2 + N, N) + 1;
    
    L(i, next_node) = -1;
    L(i, prev_node) = -1;
end

% Storage Matrix (N x n_steps) - MATLAB prefers columns for time series
X = zeros(N, n_steps);
X(:, 1) = x0;

% Dynamics Simulation (VNAE Gradient Flow)
for t = 2:n_steps
    x = X(:, t-1);
    
    % Differential equation: dx = -L*x - theta*x
    % In MATLAB, '.*' is used for element-wise multiplication
    dx = -L*x - (theta' .* x);
    
    % Euler integration step
    X(:, t) = x + dt * dx;
end

% Visualization
figure('Color', 'w');
plot(time_seq, X, 'LineWidth', 2);
title('Asymmetric Consensus under VNAE (MATLAB)');
xlabel('Time');
ylabel('Agent states');
grid on;
legend('Agent 1','Agent 2','Agent 3','Agent 4','Agent 5');
