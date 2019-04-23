mu = 20;              % average of pore radius
sigma = 4;            % standard deviation of pore radius
unit_size = 126.7027; % unit size (can be found in running log)
porosity = 0.0255;    % porosity
thresh = 20;          % statistic size

syms x;
pore_volume = int(normpdf(x, mu, sigma) * 3 / 4 * pi * (x^3), -inf, inf);
large_pore_volume = int(normpdf(x, mu, sigma) * 3 / 4 * pi * (x^3), thresh, inf);
pore_ratio = double(pore_volume / (unit_size ^ 3) / porosity);
large_ratio = double(large_pore_volume / (unit_size ^ 3) / porosity);
disp(['��϶(�����Ǻ��)���ռ�ܿ�϶(���Ǻ��)����� ', num2str(pore_ratio*100), ' %']);
disp(['����', num2str(thresh), 'mm�Ŀ�϶(�����Ǻ��)���ռ�ܿ�϶(���Ǻ��)����� ', num2str(large_ratio*100), ' %']);