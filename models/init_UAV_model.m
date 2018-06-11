% ~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~
%
% Parameters defineing the Crazyflie 2.0 model as well as default initial
% conditions of the system (started in the origin).

% Inertial tensor
I =  1e-6 .* [16.6 0.83 0.72;
              0.83 16.6 1.80;
              0.72 1.80 29.3];

% Mass tensor
m = 29e-3;
g = 9.81;

% Initial conditions
omega0 = [0;0;0];
q0     = [1;0;0;0];
v0     = [0;0;0];
p0     = [0;0;0];