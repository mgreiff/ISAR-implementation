### ISAR - Controller Implementation

This is a small stack for experimenting with the hybrid attitude controller 
for controlling mechanical control systems with rotational degrees of
freedom presented at ISAR 2018. It has been tested with Matlab 2016b
and requires a simulink installation (but no toolboxes). 

The controller is synthesised by partitioning the S^3-sphere into two
hemispheres and creating a discontinuous control law using a special
sign() function. See e.g. the work of Fjellstad (1994),  Thienel (2003),
Teel (2011) and Brescanini (2013) for discussions on robustness
and heuristics which may be used in a real-time implementation.

The purpose of this stack is to investigate convergence properties and
perform experiments with a modified version of the above mentioned
controllers. For this purpose, four examples are available, listed below:

   Ex. 1 - Examples of time-constant (A) and time-varying (B)
           reference trajectory tracking using the attitude
           rate controller (C4).
   Ex. 2 - Examples of time-constant (A) and time-varying (B)
           reference trajectory tracking using the attitude
           controller (C3).
   Ex. 3 - Example with the control of dynamics configured on
            SO(3), (C3 & C4).
   Ex. 3 - Example with the control of dynamics configured on
            SE(3), (C1 & C2 & C3 & C4).

The exponential convergence is clearly demonstrated in the logarithmic
error-norm plots of example 1-3, as well as providing a functional
implementation of UAV control, here tuned for the Crazyflie 2.0.
The full paper describing the mathematics behind the controller and the
theoretical convergence bounds is can be found in the proceedings of ISAR
2018. Academic citation is much appreciated, and can be done using the
following bibtex entry,

