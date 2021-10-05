function M2_3Dplot(D)

j=1;
x = M2_CalcX(D);
PhiDot = D(:,1);
Phi = D(:,2);
T = D(:,3);
minPhiDot = min(PhiDot);
minPhi = min(Phi);
minT = min(T);


for i=1:length(D(:,1))
    if(D(i,2)==min(D(:,2)))
        y(j,:)=[D(i,1) D(i,3) D(i,4)];
        j=j+1;
    end
end
subplot(1,3,1)
plot3(y(:,1),y(:,2),y(:,3),'.','MarkerSize',15);
hold on
syms PhiDot Temp
fmesh(x(10).*exp(x(1).*Temp).*(PhiDot.^(x(2)+(x(5).*Temp)+(x(6).*minPhi))).*(minPhi.^(x(3)+(x(7).*T)+(x(8).*PhiDot))).*(exp((x(4).*minPhi) + (x(9).*PhiDot))),[min(D(:,1)),max(D(:,1)),min(D(:,3)),max(D(:,3))]);
xlabel('PhiDot')
ylabel('T')
zlabel('Kf')
title('3D-Graph Model-1 (Kf-T-PhiDot)');
colormap jet;


hold off
j=1;
for i=1:length(D(:,1))
    if(D(i,1)==min(D(:,1)))
        z(j,:)=[D(i,2) D(i,3) D(i,4)];
        j=j+1;
    end
end
subplot(1,3,2)
plot3(z(:,1),z(:,2),z(:,3),'.','MarkerSize',15);
hold on
syms Phi Temp
fmesh(x(10).*exp(x(1).*T).*(minPhiDot.^(x(2)+(x(5).*T)+(x(6).*Phi))).*(Phi.^(x(3)+(x(7).*T)+(x(8).*minPhiDot))).*(exp((x(4).*Phi) + (x(9).*minPhiDot))),[min(D(:,2)),max(D(:,2)),min(D(:,3)),max(D(:,3))]);
xlabel('Phi')
ylabel('T')
zlabel('Kf')
title('3D-Graph Model-1 (Kf-T-Phi)')
view(90,0);
colormap jet;
hold off

j=1;
for i=1:length(D(:,1))
    if(D(i,3)==min(D(:,3)))
        w(j,:)=[D(i,1) D(i,2) D(i,4)];
        j=j+1;
    end
end
subplot(1,3,3);
plot3(w(:,1),w(:,2),w(:,3),'.','MarkerSize',15);
hold on
syms PhiDot Phi
fmesh(x(10).*exp(x(1).*minT).*(PhiDot.^(x(2)+(x(5).*minT)+(x(6).*Phi))).*(Phi.^(x(3)+(x(7).*T)+(x(8).*PhiDot))).*(exp((x(4).*Phi) + (x(9).*PhiDot))),[min(D(:,1)),max(D(:,1)),min(D(:,2)),max(D(:,2))]);
xlabel('PhiDot')
ylabel('Phi')
zlabel('Kf')
title('3D-Graph Model-1 (Kf-PhiDot-Phi)')
view(370,30)
colormap jet;
hold off


end