%%Vision Proj Riley Waters
close all; clear all; clc;
warning('off', 'Images:initSize:adjustingMag');
%% Training Image - Preprocessing

%take the input training image complement for regionprops
Itrain = imread('train.png');
ItrainC = imcomplement(Itrain);
imshow(ItrainC);

%% Testing Image - Preprocessing

%take in the testing image
Itest = imread('test.jpg');
ItestP = rgb2gray(Itest);

%threshold to binarize
ItestP = ItestP > 80;

%open and close to remove noise
SE = strel('line',10, 10);
ItestP = imclose(ItestP, SE);
ItestP = imopen(ItestP, SE);

%take complement for the regionprops
ItestC = imcomplement(ItestP);
imshow(ItestC);


%% Training Image - Feature Extraction

%label the regions, find their props
[Ltrain,Ntrain] = bwlabel(ItrainC);
propsTrain = regionprops(Ltrain, 'all');

%initialize Training Hus. First 3 are Hu moments, Last is a marker slot
huTrain = zeros(1,4,Ntrain);


imshow(Itrain);
for i=1:Ntrain
    %for each object, show boundingbox and take 3 hu moments
    rectangle('Position',propsTrain(i).BoundingBox,'EdgeColor','r')
    huTrain(:,:,i) = HuMoments((propsTrain(i).Image));
    
end    

%% Testing Image - Feature Extraction

%label the regions, find their props
[LTest,Ntest] = bwlabel(ItestC);
propsTest = regionprops(LTest, 'all');

%initialize Testing Hus. First 3 are Hu moments, Last is a marker slot
huTest = zeros(1,4,Ntest);

imshow(Itest);
for i=1:Ntest
    %for each object, show boundingbox and take 3 hu moments
    rectangle('Position',propsTest(i).BoundingBox,'EdgeColor','r')
    huTest(:,:,i) = HuMoments((propsTest(i).Image));
    
end 
