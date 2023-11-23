%AIC for 15_ARX
mAic = 0;
minTheta = [];
for m = 1:1:10
 y_num = y(m + 1:end);
 y_repeater = [];
 u_iterator = [];
 for i = 1:1:m
 y_repeater = [y_repeater, -y(m - i + 1:end - i)];  
 u_iterator = [u_iterator, u(m - i + 1:end - i)];
 end
 phi_n = [y_repeater, u_iterator];
 theta = inv(transpose(phi_n) * phi_n) * transpose(phi_n) * y_num;
 v_n = transpose(y_num - phi_n * theta) * (y_num - phi_n * theta);
 aic = log(v_n) + 4 * m / size(y_num, 1);
 if aic < mAic | m == 1
 mAic = aic;
 minTheta = theta;
 end
 end