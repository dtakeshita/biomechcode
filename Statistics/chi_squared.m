clear; close all;
NW = [17 8];
W = [18 28];
%35 guarding and 36 penetrating trials - 71 trials 
eNW = sum(NW)*[35 36]/71;%expected G & P trials for NW 
chiNW = sum((NW-eNW).^2./eNW);
eW = sum(W)*[35 36]/71;%expected G & P trials for W 
chiW = sum((W-eW).^2./eW); 
chi = chiNW + chiW