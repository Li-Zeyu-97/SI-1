%values arx_15
y_length = length(y);
u_length = length(u);
theta_min = [];
m = 10;
yn = y(m+1:y_length);
phiY = [];
phiU = [];
for i = m:-1:1
    phiY = [phiY -y(i:y_length-(m-i+1))];
    phiU = [phiU u(i:u_length-(m-i+1))];
end
phiN = [phiY phiU];
phi = phiN';
theta = inv( phi*phiN) * phi * yn;
Vx = transpose(yn - phiN*theta);
Vn = Vx * (yn - phiN*theta);
aic = log(Vn)+((5*m)/(length(phiN)));

aic
theta

%Parameters of chosen model 6
stairs(t,u)
A = [1, 7.7992 -6.1731 0.8726 -0.2926 -0.1959 0.0049];
B = [0,0.8034 0.5016 0.9005 0.5022 0.3009 0.1005];
model = tf(B,A,0.2);