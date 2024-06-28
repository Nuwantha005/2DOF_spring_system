clear all
clc

%dimensions
cw = 0.5; ch = 1; w = 2;

%data
m1 = 1; m2 = 2;
k1 = 4; k2 =  6; k3 = 2;

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

q = [-0.15; 0.65];
qdot = [0.1; -1];

U1 = U(:,1,:);
U2 = U(:,2,:);

a1 = U1.'*m*q/(U1.'*m*U1);
b1 = U1.'*m*qdot/(omega1*U1.'*m*U1);
a2 = U2.'*m*q/(U2.'*m*U2);
b2 = U2.'*m*qdot/(omega2*U2.'*m*U2);

t = linspace(0,12,600);
x = (a1*cos(omega1*t)+b1*sin(omega1*t)).*U1  + (a2*cos(omega2*t)+b2*sin(omega2*t)).*U2;
xdot = (-a1*omega1*sin(omega1*t)+b1*omega1*cos(omega1*t)).*U1 + (-a2*omega2*sin(omega2*t)+b2*omega2*cos(omega2*t)).*U2;

x1 = x(1,:,:);
x2 = x(2,:,:);
xdot1 = xdot(1,:,:);
xdot2 = xdot(2,:,:);

PolyY = [0 ch ch 0 0];
x1ID = w+cw/2; x2ID = 2*w+cw+cw/2;

f = figure('Name',"Result");
f.Position = [1920/2-1200/2 1080/2-800/2 1200 800];

for ii = 1:5:numel(t)
    subplot(2,2,1)
    plot(t,x1,t,x2)
    % yline(q(1,1))
    % yline(q(2,1))
    % xlabel('time')
    % ylabel('x')
    %legend('m1','m2')
    hold on
    plot(t(ii),x1(ii),'mo',t(ii),x2(ii),'go')
    hold off
    pause(0.002)

    subplot(2,2,2)
    plot(t,xdot1,t,xdot2)
    % yline(qdot(1,1))
    % yline(qdot(2,1))
    % xlabel('time')
    % ylabel('v')
    % legend('m1','m2')
    hold on
    plot(t(ii),xdot1(ii),'mo',t(ii),xdot2(ii),'go')
    hold off
    pause(0.002)

    subplot(2,2,[3,4])
    axis([0 3*w+2*cw 0 ch])
    plot(x1ID+[min(x1),max(x1)],[ch/2,ch/2],'--',x2ID+[min(x2),max(x2)],[ch/2,ch/2],'--')
    hold on

    x1PolyX = x1ID + [x1(ii)-cw/2 x1(ii)-cw/2 x1(ii)+cw/2 x1(ii)+cw/2 x1(ii)-cw/2 ];
    fill(x1PolyX,PolyY,'m');
    plot(x1ID+x1(ii),ch/2,'ko')
    x2PolyX = x2ID + [x2(ii)-cw/2 x2(ii)-cw/2 x2(ii)+cw/2 x2(ii)+cw/2 x2(ii)-cw/2 ];
    fill(x2PolyX,PolyY,'g');
    plot(x2ID+x2(ii),ch/2,'ko')

    plot([0,x1ID+x1(ii)-cw/2],[ch/4,ch/4],'k','linewidth',3)
    plot([x1ID+x1(ii)+cw/2,x2ID+x2(ii)-cw/2],[ch/4,ch/4],'k','linewidth',3)
    plot([0,x1ID+x1(ii)-cw/2],[ch*3/4,ch*3/4],'k','linewidth',3)
    plot([x1ID+x1(ii)+cw/2,x2ID+x2(ii)-cw/2],[ch*3/4,ch*3/4],'k','linewidth',3)
    plot([x2ID+x2(ii)+cw/2,2*cw+3*w],[ch/4,ch/4],'k','linewidth',3)
    plot([x2ID+x2(ii)+cw/2,2*cw+3*w],[ch*3/4,ch*3/4],'k','linewidth',3)

    plot([0,0],[0,ch],'k','linewidth',8)
    plot([2*cw+3*w,2*cw+3*w],[0,ch],'k','linewidth',8)

    axis off
    hold off
    pause(0.002)
end


