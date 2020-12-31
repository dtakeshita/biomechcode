clear; close all;
NW = [17 8];
W = [18 28];
eNW = sum(NW)*[35 36]/71;
chiNW = sum((NW-eNW).^2./eNW);
eW = sum(W)*[35 36]/71;
chiW = sum((W-eW).^2./eW); 
chi = chiNW + chiW