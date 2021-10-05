function M2_2Dplot(D)

x = M2_CalcX(D);

PhiDot = D(:,1);
Phi = D(:,2);
T = D(:,3);
minPhiDot = min(PhiDot);
maxPhiDot = max(PhiDot);
minPhi = min(Phi);
maxPhi = max(Phi);
minT = min(T);
maxT = max(T);
meanPhiDot = mean(PhiDot);
meanT = mean(T);
meanPhi = mean(Phi);


%Temp constant against Kf values with min max and mean phi and phidot
Temp = linspace(minT,maxT);
Kf1 =x(10).*exp(x(1).*Temp).*(minPhiDot.^(x(2)+(x(5).*Temp)+(x(6).*minPhi))).*(minPhi.^(x(3)+(x(7).*Temp)+(x(8).*minPhiDot))).*(exp((x(4).*minPhi) + (x(9).*minPhiDot)));
Kf2 =x(10).*exp(x(1).*Temp).*(maxPhiDot.^(x(2)+(x(5).*Temp)+(x(6).*maxPhi))).*(maxPhi.^(x(3)+(x(7).*Temp)+(x(8).*maxPhiDot))).*(exp((x(4).*maxPhi) + (x(9).*maxPhiDot)));
Kf3 =x(10).*exp(x(1).*Temp).*(meanPhiDot.^(x(2)+(x(5).*Temp)+(x(6).*meanPhi))).*(meanPhi.^(x(3)+(x(7).*Temp)+(x(8).*meanPhiDot))).*(exp((x(4).*meanPhi) + (x(9).*meanPhiDot)));
subplot(1,3,1);
plot(Temp,Kf1,Temp,Kf2,Temp,Kf3);
xlabel('Temp');
ylabel('Kf');
legend({'T const. PhiDot & Phi min','T const. PhiDot & Phi max','T const. PhiDot & Phi mean'},'FontSize',5,'TextColor','blue')
title('2D-Graph Model-2 (Kf - T)')


%Phi constant against Kf values with min, max and mean Temp and Phidot 
Phi = linspace(minPhi,maxPhi);
Kf4 = x(10).*exp(x(1).*minT).*(minPhiDot.^(x(2)+(x(5).*minT)+(x(6).*Phi))).*(Phi.^(x(3)+(x(7).*minT)+(x(8).*minPhiDot))).*(exp((x(4).*Phi) + (x(9).*minPhiDot)));
Kf5 = x(10).*exp(x(1).*maxT).*(maxPhiDot.^(x(2)+(x(5).*maxT)+(x(6).*Phi))).*(Phi.^(x(3)+(x(7).*maxT)+(x(8).*maxPhiDot))).*(exp((x(4).*Phi) + (x(9).*maxPhiDot)));
Kf6 = x(10).*exp(x(1).*meanT).*(meanPhiDot.^(x(2)+(x(5).*meanT)+(x(6).*Phi))).*(Phi.^(x(3)+(x(7).*meanT)+(x(8).*meanPhiDot))).*(exp((x(4).*Phi) + (x(9).*meanPhiDot)));
subplot(1,3,2);
plot(Phi,Kf4,Phi,Kf5,Phi,Kf6);
xlabel('Phi');
ylabel('Kf');
legend({'Phi const. PhiDot & T min','Phi const. PhiDot & T max','Phi const. PhiDot & T mean'},'FontSize',5,'TextColor','blue')
title('2D-Graph Model-2 (Kf - Phi)');

%Phidot constant against Kf values with min, max and mean Temp and Phi
PhiDot = linspace(minPhiDot,maxPhiDot);
Kf7 = x(10).*exp(x(1).*minT).*(PhiDot.^(x(2)+(x(5).*minT)+(x(6).*minPhi))).*(minPhi.^(x(3)+(x(7).*minT)+(x(8).*PhiDot))).*(exp((x(4).*minPhi) + (x(9).*PhiDot)));
Kf8 = x(10).*exp(x(1).*maxT).*(PhiDot.^(x(2)+(x(5).*maxT)+(x(6).*maxPhi))).*(maxPhi.^(x(3)+(x(7).*maxT)+(x(8).*PhiDot))).*(exp((x(4).*maxPhi) + (x(9).*PhiDot)));
Kf9 = x(10).*exp(x(1).*meanT).*(PhiDot.^(x(2)+(x(5).*meanT)+(x(6).*meanPhi))).*(meanPhi.^(x(3)+(x(7).*meanT)+(x(8).*PhiDot))).*(exp((x(4).*meanPhi) + (x(9).*PhiDot)));
subplot(1,3,3);
plot(PhiDot,Kf7,PhiDot,Kf8,PhiDot,Kf9);
xlabel('PhiDot');
ylabel('Kf');
legend({'PhiDot const. Phi & T min','PhiDot const. Phi & T max','PhiDot const. Phi & T mean'},'FontSize',5,'TextColor','blue')
title('2D-Graph Model-2 (Kf - PhiDot)');


end