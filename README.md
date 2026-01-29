# VNAE-Asymmetric-Consensus
Minimal R implementation of asymmetric consensus dynamics inspired by the Victoria-Nash Asymmetric Equilibrium (VNAE) framework

This repository presents a minimal R implementation of an asymmetric consensus system
inspired by the VNAE (Victoria–Nash Asymmetric Equilibrium)* framework.

The model extends a classical Laplacian-based consensus dynamic by introducing
agent-specific asymmetric dissipation parameters.

> “This example illustrates how asymmetric dissipation induces global convergence
> in a classical consensus system, providing an operational manifestation of
> positive curvature in the VNAE framework.”

## Model

For a network of N agents, the dynamics are given by:

dx/dt = −Lx − Θx

where:
- L is the graph Laplacian,
- Θ = diag(θ₁,…,θₙ) introduces asymmetry across agents.

## Interpretation

Despite heterogeneity, the system converges to a common equilibrium.
This convergence is not imposed by symmetry, but emerges from asymmetry itself.

Again, as we can see, this is a linear, minimal realization of the VNAE principle: asymmetry-induced stability in a distributed system. It reflects the operational regime of positive curvature without explicitly computing it.

## Scope

- Educational and conceptual example  
- Software-level reference for control and multi-agent systems  
- Basis for extensions to higher dimensions and real-world implementations

## Reference

Pereira, D. H. (2025). Riemannian Manifolds of Asymmetric Equilibria: The Victoria-Nash Geometry.



