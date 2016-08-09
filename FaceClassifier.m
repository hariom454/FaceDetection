%%Test Trainer's Face
clc;
clear all;
close all;

[fname path] = uigetfile('.jpg','Provide a Face for testing');
fname = strcat(path,fname);
im = imread(fname);
imshow(im);
title('input face');


%%to find out which class it belongs
Ftest=FeatureStatistical(im);

%%Compare with Database
load db;
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
dist=sum(abs(Ftrain(1,:)-Ftest));
end
Min=min(dist);
if(Min<3)
m=find(dist==min(dist),1);
det_class=Ctrain(m);
msgbox(strcat('Detected Class',num2str(det_class)));
else
    msgbox('This Trainer is not registered');
end

