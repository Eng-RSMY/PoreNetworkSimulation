syms x y a
a = 5;
y = (x-3)^2 + a;
y_prime = diff(y); % ��y�ĵ���
x = fzero(inline(y_prime), 1);
x