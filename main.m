%%Optical Number Recognition System
close all; clear all; clc;

Itrain = imread('train.png');
ItrainC = imcomplement(Itrain);

Itest = imread('test.jpg');
ItestP = rgb2gray(Itest);

ItestP = ItestP > 80;
SE = strel('line',10, 10);

ItestP = imclose(ItestP, SE);
ItestP = imopen(ItestP, SE);
