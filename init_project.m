% ~~~~~~~~~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~~~~~~~~~
%
% This script initializes the models, sets up the paths and prints help
addpath([pwd, '/models']);
addpath([pwd, '/controllers']);
addpath([pwd, '/help_functions']);

fprintf(['~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n',...
         'This is a small stack for experimenting with the quaternion\n',...
         'controller presented at ISAR 2018. Start by entering any of\n',...
         'the example directories and running the "init.m" file.\n\n',...
         'Note that some of the examples including multiple models will\n',...
         'warn for algebraic loops. This is an artefact of the modular way\n',...
         'in which the models are implemented, and has little consequence\n',...
         'for the simulations.\n\n',...
         'A set of four examples are available, listed below:\n',...
         '   Ex. 1 - Examples of time-constant (A) and time-varying (B)\n',...
         '           reference trajectory tracking using the attitude\n',...
         '           rate controller (C4).\n',...
         '   Ex. 2 - Examples of time-constant (A) and time-varying (B)\n',...
         '           reference trajectory tracking using the attitude\n',...
         '           controller (C3).\n',...
         '   Ex. 3 - Example with the control of dynamics configured on\n',...
         '            SO(3), (C3 & C4).\n',...
         '   Ex. 3 - Example with the control of dynamics configured on\n',...
         '            SE(3), (C1 & C2 & C3 & C4).\n' ,...
         '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n']);

cd examples