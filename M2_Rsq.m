function cod_R_square = M2_Rsq(D)

x= M2_CalcX(D);
A = [D(:,3) log(D(:,1)) log(D(:,2)) D(:,2) D(:,3).*log(D(:,1)) D(:,2).*log(D(:,1)) D(:,3).*log(D(:,2)) D(:,1).*log(D(:,2)) D(:,1)  ones(size(D(:,1)))];

Kf = A*x;

% Finding the ln of the Kf values, as after the linearisation of the model 1
% equation b = ln(Kf) in the equation Ax=B
lny = log(D(:,4));
f_avg=mean(lny);
cod_R_square = sum((Kf-f_avg).^2)/sum((lny-f_avg).^2);

end