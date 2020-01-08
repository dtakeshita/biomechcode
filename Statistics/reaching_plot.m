function xend = reaching_plot(r1,r2,theta1,theta2)
%     close all
%     r1 = 0.5;
%     r2 = 0.5;
%     theta1 = pi/4;
%     theta2 = 3*pi/4;
    x0 = [0 0];
    x1 = r1*[cos(theta1) sin(theta1)];
    x2 = r2*[cos(theta2) sin(theta2)];
    xend = x1 + x2;
    v = [x0;x1];
    w = [x1;xend];
    %plot
    h1 = plot(v(:,1),v(:,2));
    hold on
    h2 = plot(w(:,1),w(:,2));
    h3 = plot(xend(1),xend(2));
    set([h1 h2],'color','k')
    set(h3,'color','k','marker','.','markersize',12)
    axis equal
end