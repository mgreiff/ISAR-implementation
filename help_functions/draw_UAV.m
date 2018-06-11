function draw_UAV( p, R, scale)
    % ~~~ Copyright (c) 2018 Marcus Greiff (see LICENCE.md) ~~~
    %
    % Draw a UAV at a certain configuration $(p, R) \in SO(3)$
    %
    %   draw_UAV( p, R, scale)
    %
    lightGrey = 0.8*[1 1 1];
    darkGrey = 0.7*[1 1 1];
    N=20;

    dim_body = scale.*[5,5,1];
    dim_prop = scale.*[3,3,0.3];
    off_prop = scale.*[5,5,1.5];
    dim_motor= scale.*[1,1,2];
    off_motor= scale.*[5,5,-0.5];
    [sx,sy,sz] = sphere(N-1);
    [cx,cy,cz] = cylinder(1, N-1);

    % Uav body
    body = zeros(N,N,3);
    body(:,:,1) = sx.*dim_body(1);
    body(:,:,2) = sy.*dim_body(2);
    body(:,:,3) = sz.*dim_body(3);

    prop1 = zeros(2,N,3);
    prop1(:,:,1) = cx.*dim_prop(1) - off_prop(1);
    prop1(:,:,2) = cy.*dim_prop(2);
    prop1(:,:,3) = cz.*dim_prop(3) + off_prop(3);

    prop2 = zeros(2,N,3);
    prop2(:,:,1) = cx.*dim_prop(1) + off_prop(1);
    prop2(:,:,2) = cy.*dim_prop(2);
    prop2(:,:,3) = cz.*dim_prop(3) + off_prop(3);

    prop3 = zeros(2,N,3);
    prop3(:,:,1) = cx.*dim_prop(1);
    prop3(:,:,2) = cy.*dim_prop(2) - off_prop(2);
    prop3(:,:,3) = cz.*dim_prop(3) + off_prop(3);

    prop4 = zeros(2,N,3);
    prop4(:,:,1) = cx.*dim_prop(1);
    prop4(:,:,2) = cy.*dim_prop(2) + off_prop(2);
    prop4(:,:,3) = cz.*dim_prop(3) + off_prop(3);

    motor1 = zeros(2,N,3);
    motor1(:,:,1) = cx.*dim_motor(1) - off_motor(1);
    motor1(:,:,2) = cy.*dim_motor(2);
    motor1(:,:,3) = cz.*dim_motor(3) + off_motor(3);
    motor2 = zeros(2,N,3);
    motor2(:,:,1) = cx.*dim_motor(1) + off_motor(1);
    motor2(:,:,2) = cy.*dim_motor(2);
    motor2(:,:,3) = cz.*dim_motor(3) + off_motor(3);
    motor3 = zeros(2,N,3);
    motor3(:,:,1) = cx.*dim_motor(1);
    motor3(:,:,2) = cy.*dim_motor(2) - off_motor(2);
    motor3(:,:,3) = cz.*dim_motor(3) + off_motor(3);
    motor4 = zeros(2,N,3);
    motor4(:,:,1) = cx.*dim_motor(1);
    motor4(:,:,2) = cy.*dim_motor(2) + off_motor(2);
    motor4(:,:,3) = cz.*dim_motor(3) + off_motor(3);

    parts = {body, motor1, motor2, motor3, motor4, prop1, prop2, prop3, prop4};

    hold on
    for ii = 1:length(parts)
        part = parts{ii};
        %% Rotate and translate part
        for jj = 1:length(part(:,1,1))
            for kk = 1:length(part(1,:,1))
                v(1) = part(jj,kk,1);
                v(2) = part(jj,kk,2);
                v(3) = part(jj,kk,3);
                rv = R*v' + p;
                part(jj,kk,1) = rv(1);
                part(jj,kk,2) = rv(2);
                part(jj,kk,3) = rv(3);
            end
        end

        %% Visualize part
        if ii < 6
            colorA = lightGrey;
            colorB = darkGrey;
        else
            colorA = 0.5*[1 1 1];
            colorB = 0.5*[1 1 1];
        end
        surface(part(:,:,1),part(:,:,2), part(:,:,3),'FaceColor', colorA,'EdgeColor',colorB)
        if ii > 1
            patch(part(1,:,1),part(1,:,2),part(1,:,3),0.*part(1,:,3),'FaceColor', colorA,'EdgeColor',colorB);
            patch(part(2,:,1),part(2,:,2),part(2,:,3),0.*part(1,:,3),'FaceColor', colorA,'EdgeColor',colorB);
        end
    end
    R = scale.*20.*R;
    plot3([0, R(1,1)]+p(1),...
          [0, R(2,1)]+p(2),...
          [0, R(3,1)]+p(3), 'r', 'linewidth', 2)
    plot3([0, R(1,2)]+p(1),...
          [0, R(2,2)]+p(2),...
          [0, R(3,2)]+p(3), 'b', 'linewidth', 2)
    plot3([0, R(1,3)]+p(1),...
          [0, R(2,3)]+p(2),...
          [0, R(3,3)]+p(3), 'g', 'linewidth', 2)
    axis equal
end

