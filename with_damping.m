clear all
clc

%data
m1 = 1; m2 = 2;
k1 = 4; k2 =  6; k3 = 2;
I = [1 0;0 1];

m = [m1 0; 0 m2];
k = [k1+k3 -k3; -k3 k2+k3];

[v,d] = eig(k/m);
omega1 = sqrt(d(2,2));
omega2 = sqrt(d(1,1));

r1 = (-m1*omega1^2+(k1+k3))/k3;
r2 = (-m1*omega2^2+(k1+k3))/k3;

u1 = [1; r1];
u2 = [1; r2];

alpha1 = sqrt(1/(transpose(u1)*m*u1));
alpha2 = sqrt(1/(transpose(u2)*m*u2));

U = [alpha1*u1 alpha2*u2];

q = [-0.75; 0.25];
qdot = [1; -0.5];

U1 = U(:,1,:);
U2 = U(:,2,:);

a1 = U1.'*m*q/(U1.'*m*U1);
b1 = U1.'*m*qdot/(omega1*U1.'*m*U1);
a2 = U2.'*m*q/(U2.'*m*U2);
b2 = U2.'*m*qdot/(omega2*U2.'*m*U2);


t = linspace(0,8,800);
x = (a1*cos(omega1*t)+b1*sin(omega1*t)).*U1  + (a2*cos(omega2*t)+b2*sin(omega2*t)).*U2;
xdot = (-a1*omega1*sin(omega1*t)+b1*omega1*cos(omega1*t)).*U1 + (-a2*omega2*sin(omega2*t)+b2*omega2*cos(omega2*t)).*U2;

subplot(2,1,1)
plot(t,x(1,:,:),t,x(2,:,:))
% yline(q(1,1))
% yline(q(2,1))
xlabel('time')
ylabel('x')
legend('m1','m2')

subplot(2,1,2)
plot(t,xdot(1,:,:),t,xdot(2,:,:))
% yline(qdot(1,1))
% yline(qdot(2,1))
xlabel('time')
ylabel('v')
legend('m1','m2')




