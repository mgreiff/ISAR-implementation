function S = skew(v)
    % ~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~
    %
    % The standard skew operator, satosfying $u\times v = [u]^\land v$
    %
    %    S = skew(v)
    %
    vx = v(1); vy = v(2); vz = v(3);
    S = [0 -vz vy; vz 0 -vx; -vy vx 0];
end