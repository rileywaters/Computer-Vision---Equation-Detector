function detected69 = Detect6or9(I)

%This function is the split recheck that occurs whenever a 6 or 9 is
%detected
I = imcomplement(I);
%Split image into top and bottom halfs
n = fix(size(I,1)/2);
top =I(1:n,:,:);
bottom =I(n+1:end,:,:);

%compute first moment (area) of top half
n20t=centralMoment(2,0,top);
n02t=centralMoment(0,2,top);
t=n20t+n02t;
topHu = -sign(t).*(log10(abs(t)));

%compute first moment (area) of bottom half
n20b=centralMoment(2,0,bottom);
n02b=centralMoment(0,2,bottom);
b=n20b+n02b;
bottomHu = -sign(b).*(log10(abs(b)));

%if the top half has more area then bottom, its a 9
if(topHu > bottomHu)
    detected69 = '9';
%if not, its a 6
    else
        detected69 = '6';
end

end