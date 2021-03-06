clear; 
close all;
% construct a test data
ndat = 10;
t = 0:0.1:2*pi
x = sin(t);
% initialize a set of frames
F(ndat) = struct('cdata',[],'colormap',[]);
for n=1:length(x)
    h = plot(5,x(n));
    set(gca,'xlim',[0 10],'ylim',[-1 1])%set x-scale
    set(h,'marker','o','markersize',24);
    F(n)=getframe(gcf);%capture a figure into F
end
% play movie
close all;
fig = figure;
movie(fig,F,10)