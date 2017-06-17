function [M]= HuMoments(image)

% First Moment
n20=centralMoment(2,0,image);
n02=centralMoment(0,2,image);
a=n20+n02;
M1 = -sign(a).*(log10(abs(a)));

% Second Moment
n20=centralMoment(2,0,image);
n02=centralMoment(0,2,image);
n11=centralMoment(1,1,image);
b=(n20-n02)^2+4*n11^2;
M2 = -sign(b).*(log10(abs(b)));

% Third Moment
n30=centralMoment(3,0,image);
n12=centralMoment(1,2,image);
n21=centralMoment(2,1,image);
n03=centralMoment(0,3,image);
c=(n30-3*n12)^2+(3*n21-n03)^2;
M3 = -sign(c).*(log10(abs(c)));

%return moment vector with 0 in the marker slot
M=[M1,M2,M3,0]';