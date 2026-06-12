# Figure Notes

## Figure 01
- Status: recovered
- File: `figures/figure-01-image-by-martidaniel-via-wikimedia-commons-cc-by.jpg`
- What it shows: MareNostrum racks inside the Torre Girona chapel, establishing the physical scale and setting of the supercomputer.
- Why it matters: It grounds the article’s central contrast between spectacular hardware and mundane operational access.

## Figure 02
- Status: recovered
- File: `figures/figure-02-fat-tree-architecture-by-horizzon-commonswiki-vi.jpg`
- What it shows: Fat-tree network topology diagram used to explain why HPC networking, not just compute, determines performance.
- Why it matters: It supports the claim that distributed workloads are bounded by network topology and latency.

## Figure 03
- Status: recovered
- File: `figures/figure-03-photo-by-planet-volumes-on-unsplash.jpg`
- What it shows: Illustrative compute/server-room image placed near the login-node and infrastructure discussion.
- Why it matters: It provides visual context for the hardware and login-node section, though it is less argument-bearing than the diagrams.

## Figure 04
- Status: recovered
- File: `figures/figure-04-the-airgap-on-mn-v-by-author-using-inkscape.png`
- What it shows: Airgap diagram for MareNostrum V, showing the separation between external access, login nodes, storage, and compute nodes.
- Why it matters: It explains why dependencies, datasets, and packages must be staged before job submission.

## Figure 05
- Status: recovered
- File: `figures/figure-05-initial-terminal-view-after-login-by-author.png`
- What it shows: Initial login terminal screenshot, emphasizing that access to a €200M machine begins as an ordinary Linux shell.
- Why it matters: It reinforces the operational point that researchers interact with the supercomputer through standard SSH and shell tooling.

## Figure 06
- Status: recovered
- File: `figures/figure-06-slurm-schema-on-mn-v-by-author-using-inkscape.svg`
- What it shows: SLURM scheduling diagram for MareNostrum V, showing how jobs move from user scripts into queues and compute nodes.
- Why it matters: It is central to the article’s practical claim that SLURM, not direct execution, is how code actually runs on HPC.

## Figure 07
- Status: recovered
- File: `figures/figure-07-example-flow-around-one-of-the-3d-meshes-by-auth.png`
- What it shows: ParaView visualization of flow around a 3D mesh from the author’s OpenFOAM CFD workload.
- Why it matters: It ties the abstract scheduling discussion to the author’s concrete CFD simulation use case.

## Figure 08
- Status: recovered
- File: `figures/figure-08-example-underside-pressure-on-one-of-the-3d-mesh.png`
- What it shows: ParaView underside pressure visualization from one CFD case, illustrating the simulation outputs later used for ML tensors.
- Why it matters: It shows the kind of scientific output the batch pipeline generates and later converts for ML use.

## Figure 09
- Status: recovered
- File: `figures/figure-09-time-as-resources-increase-for-different-n-by-au.png`
- What it shows: Runtime-vs-resources plot for different N values, illustrating Amdahl’s law and communication overhead limits.
- Why it matters: It visualizes why adding cores can slow small workloads and why supercomputer programming is compute-to-communication tradeoff management.
