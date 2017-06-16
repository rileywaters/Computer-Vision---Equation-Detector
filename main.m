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
ItestP = ItestP > 75;

%open and close to remove noise
SE = strel('line',5, 5);
ItestP = imclose(ItestP, SE);
ItestP = imopen(ItestP, SE);

%take complement for the regionprops
ItestC = imcomplement(ItestP);
imshow(ItestC);
%% Training Image - Feature Extraction

[Ltrain,Ntrain] = bwlabel(ItrainC);
propsTrain = regionprops(Ltrain, 'all');

huTrain = zeros(1,3,Ntrain);

%% Testing Image - Feature Extraction

[LTest,Ntest] = bwlabel(ItestC);
propsTest = regionprops(LTest, 'all');

huTest = zeros(1,3,Ntest);

