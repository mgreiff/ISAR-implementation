function qL = leftProduct(q)
    % ~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~
    %
    % The left handed quaternion product in a matrix form $[\cdot]_L$
    %
    %     qL = leftProduct(q)
    %
    qw = q(1); qv = q(2:4);
    qL = qw*eye(4) + [0, -qv'; qv, skew(qv)];
end

