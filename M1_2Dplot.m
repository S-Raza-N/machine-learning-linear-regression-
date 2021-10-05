function M1_2Dplot(D)

x = M1_CalcX(D);
%importing phy, phiDot and T columns
PhiDot = D(:,1);
Phi = D(:,2);
T = D(:,3);

%creating min, max and mean for each var repectively for later comparision 
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
Temp = linspace(minT,maxT); %returns a row vector for 100 evenly spaced points b/w minT and maxT
Kf1 = x(6).*exp(x(1).*Temp).*(minPhiDot.^(x(2)+(x(5).*Temp))).*(minPhi.^x(3)).*(exp(x(4).*minPhi));
Kf2 = x(6).*exp(x(1).*Temp).*(maxPhiDot.^(x(2)+(x(5).*Temp))).*(maxPhi.^x(3)).*(exp(x(4).*maxPhi));
Kf3 = x(6).*exp(x(1).*Temp).*(meanPhiDot.^(x(2)+(x(5).*Temp))).*(meanPhi.^x(3)).*(exp(x(4).*meanPhi));
subplot(1,3,1);
plot(Temp,Kf1,Temp,Kf2,Temp,Kf3);
xlabel('Temp');
ylabel('Kf');
legend({'T const. PhiDot & Phi min','T const. PhiDot & Phi max','T const. PhiDot & Phi mean'},'FontSize',5,'TextColor','blue')
title('2D-Graph Model-1 (Kf - T)')


%Phi constant against Kf values with min, max and mean Temp and Phidot 
Phi = linspace(minPhi,maxPhi);
Kf4 = x(6).*exp(x(1).*minT).*(minPhiDot.^(x(2)+(x(5).*minT))).*(Phi.^x(3)).*(exp(x(4).*Phi));
Kf5 = x(6).*exp(x(1).*maxT).*(maxPhiDot.^(x(2)+(x(5).*maxT))).*(Phi.^x(3)).*(exp(x(4).*Phi));
Kf6 = x(6).*exp(x(1).*meanT).*(meanPhiDot.^(x(2)+(x(5).*meanT))).*(Phi.^x(3)).*(exp(x(4).*Phi));
subplot(1,3,2);
plot(Phi,Kf4,Phi,Kf5,Phi,Kf6);
xlabel('Phi');
ylabel('Kf');
legend({'Phi const. PhiDot & T min','Phi const. PhiDot & T max','Phi const. PhiDot & T mean'},'FontSize',5,'TextColor','blue')
title('2D-Graph Model-1 (Kf - Phi)');

%Phidot constant against Kf values with min, max and mean Temp and Phi
PhiDot = linspace(minPhiDot,maxPhiDot);
Kf7 = x(6).*exp(x(1).*minT).*(PhiDot.^(x(2)+(x(5).*minT))).*(minPhi.^x(3)).*(exp(x(4).*minPhi));
Kf8 = x(6).*exp(x(1).*maxT).*(PhiDot.^(x(2)+(x(5).*maxT))).*(maxPhi.^x(3)).*(exp(x(4).*maxPhi));
Kf9 = x(6).*exp(x(1).*meanT).*(PhiDot.^(x(2)+(x(5).*meanT))).*(meanPhi.^x(3)).*(exp(x(4).*meanPhi));
subplot(1,3,3);
plot(PhiDot,Kf7,PhiDot,Kf8,PhiDot,Kf9);
xlabel('PhiDot');
ylabel('Kf');
legend({'PhiDot const. Phi & T min','PhiDot const. Phi & T max','PhiDot const. Phi & T mean'},'FontSize',5,'TextColor','blue')
title('2D-Graph Model-1 (Kf - PhiDot)');


end

