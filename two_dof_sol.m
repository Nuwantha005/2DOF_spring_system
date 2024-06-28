clear all
clc

%data
m1 = 1; m2 = 2;
k1 = 4; k2 =  6; k3 = 2;
I = [1 0;0 1];

m = [m1 0; 0 m2];
k = [k1+k3 -k3; -k3 k2+k3];

[v,d] = eig(k/m);
omega = diag(sqrt(rot90(d,2)),0);

r = (-m1*omega.^2+(k1+k3))/k3;
