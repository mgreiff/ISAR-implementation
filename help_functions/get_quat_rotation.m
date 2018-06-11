function [q, wellPosedness] = get_quat_rotation(v1, v2)
    % ~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~
    %
    % Get the (quaternion) shortest arc on S^3 rotating v1 to v2.
    %
    %   [q, wellPosedness] = get_quat_rotation(v1, v2)
    %
    q = zeros(4,1);
    q(2:4) = cross(v2,v1);
    q(1)   = 1 + dot(v2,v1);
    q = q./norm(q);
    wellPosedness = norm(cross(v2,v1));
end