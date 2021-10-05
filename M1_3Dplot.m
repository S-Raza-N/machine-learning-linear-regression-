function  M1_3Dplot(D)

j=1;
x = M1_CalcX(D);
PhiDot = D(:,1);
Phi = D(:,2);
T = D(:,3);
minPhiDot = min(PhiDot);
minPhi = min(Phi);
minT = min(T);
% a loop in which var i goes down through the every row of the 2nd column and...
% checks if the value of each cell of the 2nd column(Phi) is eual to the
% minimum value of the column Phi, then creates a new array y in which it stores the respective 
% values of the PhiDot, Temp and Kf for the minimum value found. 
for i=1:length(D(:,1))
    if(D(i,2)==min(D(:,2)))
        y(j,:)=[D(i,1) D(i,3) D(i,4)];
        j=j+1;
    end
end
subplot(1,3,1)
% plots a 3D grpah of the values stored in array y i.e. PhiDot, Temp and Kf.
plot3(y(:,1),y(:,2),y(:,3),'.','MarkerSize',15);
hold on
syms PhiDot Temp
% fmesh(f, xyinterval) :  a four-element vector of the form [xmin xmax ymin ymax] is used as the interval.
fmesh(x(6).*exp(x(1).*Temp).*(PhiDot.^(x(2)+(x(5).*Temp))).*(minPhi.^x(3)).*(exp(x(4).*minPhi)),[min(D(:,1)),max(D(:,1)),min(D(:,3)),max(D(:,3))]);
xlabel('PhiDot')
ylabel('T')
zlabel('Kf')
title('3D-Graph Model-1 (Kf-T-PhiDot)');
colormap jet;


hold off
j=1;
% Same explanation as above except, instead of Phi, the first column(PhiDot) is looped through(Kept constant). 
for i=1:length(D(:,1))
    if(D(i,1)==min(D(:,1)))
        z(j,:)=[D(i,2) D(i,3) D(i,4)];
        j=j+1;
    end
end
subplot(1,3,2)
% plots a 3D grpah of the values stored in array z i.e. Phi, Temp and Kf.
plot3(z(:,1),z(:,2),z(:,3),'.','MarkerSize',15);
hold on
syms Phi Temp
fmesh(x(6).*exp(x(1).*Temp).*(minPhiDot.^(x(2)+(x(5).*Temp))).*(Phi.^x(3)).*(exp(x(4).*Phi)),[min(D(:,2)),max(D(:,2)),min(D(:,3)),max(D(:,3))]);
xlabel('Phi')
ylabel('T')
zlabel('Kf')
title('3D-Graph Model-1 (Kf-T-Phi)')
view(90,0);
colormap jet;
hold off

% Same explanation as above except, instead of Phi, the thrid column(Temp) is looped through(Kept constant). 
j=1;
for i=1:length(D(:,1))
    if(D(i,3)==min(D(:,3)))
        w(j,:)=[D(i,1) D(i,2) D(i,4)];
        j=j+1;
    end
end
subplot(1,3,3);
% plots a 3D grpah of the values stored in array w i.e. Phi, PhiDot and Kf.
plot3(w(:,1),w(:,2),w(:,3),'.','MarkerSize',15);
hold on
syms PhiDot Phi
fmesh(x(6).*exp(x(1).*minT).*(PhiDot.^(x(2)+(x(5).*minT))).*(Phi.^x(3)).*(exp(x(4).*Phi)),[min(D(:,1)),max(D(:,1)),min(D(:,2)),max(D(:,2))]);
xlabel('PhiDot')
ylabel('Phi')
zlabel('Kf')
title('3D-Graph Model-1 (Kf-PhiDot-Phi)')
view(370,30)
colormap jet;
hold off


end