%%Taking an image
clc;
clear all;
close all;

[fname path] = uigetfile('.jpg','Open a Face Input for Training');
fname = strcat(path,fname);
im = imread(fname);
imshow(im);
title('input face');
c=input ('Enter the Class');


%%Feature Extraction
f = FeatureStatistical(im);
try
    load db;
    F = [f c];
    db = [db;f];
    save db.mat db
catch
    db=[f c];
    save db.mat db
end
    
