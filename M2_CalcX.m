function [x] = M2_CalcX(D)

%A is the vector form of the predictor variables i.e......
%.....[x1 x2 x3 x4 x5 x6 x7 x8 x9 x10].

A = [D(:,3) log(D(:,1)) log(D(:,2)) D(:,2) D(:,3).*log(D(:,1)) D(:,2).*log(D(:,1)) D(:,3).*log(D(:,2)) D(:,1).*log(D(:,2)) D(:,1)  ones(size(D(:,1)))];

% values of Kf imported as an column vector.
b = log(D(:,4));

% simple linear regression relation,
% these values form a system of linear equations. 
x = A\b;

end