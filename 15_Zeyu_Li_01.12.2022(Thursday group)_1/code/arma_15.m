%6th order values 15_ARMA
yn = y(7:end);
phyn = [-y(6:end-1), -y(5:end-2), -y(4:end-3), -y(3:end-4), -y(2:end-5), -y(1:end-6) ,u(6:end-1), u(5:end-2), u(4:end-3), u(3:end-4),u(2:end-5), u(1:end-6)];
phynT = phyn';
Theta = (((phynT * phyn)^-1)* phynT *yn);

A = [1,-0.5, 0.6,0.3,0.2,-0.2,0.3]; 
B = [-8.8,5.2,-4.9,1.6,-0.7,0.2];     
tra = tf(B,A,0.02);   
