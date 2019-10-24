close all;
y = sin(x);
plot(x,y,'r--')
plot(x,y,'r--o')
 y2 = cos(x);
plot(x,y2)
hold on
plot(x,y,'b:')
hold off
plot(x, y+y2)
close
plot(x,y)
figure
h = plot(x,y2)
set(h,'linewidth',2,'marker','v','markersize',20)
title('This is a test')
xlabel('Time (msec)')
ylabel('Force (N)')
set(gca,'fontsize',20,'xlim',[0 10],'xtick',0:5:10)