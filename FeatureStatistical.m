function [f] = FeatureStatistical(im)
im = double(im);
m = mean2(im);
s=std2(im);
f = [m s];