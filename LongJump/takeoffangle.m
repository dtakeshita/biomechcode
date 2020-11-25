clear;close all;
theta = 0:90;
Vy = 4*ones(size(theta));
Vx = Vy./tan(theta/180*pi);

idx_high = find(abs(Vx)>10);
Vx(idx_high)=10;
Vy(idx_high) = 10*tan(theta(idx_high)/180*pi);

speed = (Vx.^2 + Vy.^2).^0.5;
h=plot(theta,speed,'linewidth',2,'color','k');
xlabel('Take-off angle (deg)');ylabel('Take-off speed (m/s)');
set(gca,'xlim',[0 90],'ylim',[0 12],...
    'fontsize',18,'xtick',0:10:90,'xticklabel',0:10:90,...
    'tickdir','out','linewidth',1,'box','off');