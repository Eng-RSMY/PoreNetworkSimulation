clear; clc;
n = [20, 20, 20, 20, 20, 20, 20, 20, 20, 20,...
    20, 20, 20, 20, 20, 20, 20, 20, 20, 20,...
    20, 20, 20, 20, 20, 20, 20, 4, 6, 8,...
    10, 12, 14, 16, 13, 13, 13, 13, 20, 20,...
    20, 20, 20, 20, 20, 20, 20];
L = [621.3161, 1258.6771, 2533.7013, 5083.3477, 10185.7161,...
    20388.0699, 40794.1555, 635.6371, 634.4705, 631.1537,...
    624.5978, 618.4555, 613.9014, 609.3241, 604.4461,...
    601.8813, 600.0058, 700.7788, 700.7788, 700.7788,...
    687.0783, 567.8843, 492.5317, 443.2100, 411.6990,...
    392.5183, 378.8179, 402.1087, 429.5096, 458.2806,...
    485.6815, 514.4525, 541.8534, 569.2543, 528.1529,...
    528.1529, 528.1529, 528.1529, 1510.5201, 877.7475,...
    621.3161, 505.6674, 436.5938, 387.1275, 350.5268,...
    320.3374, 294.3087] * 1E-9;
Rp = [100, 200, 400, 800, 1600, 3200, 6400, 100, 100, 100,...
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100,...
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100,...
    100, 100, 100, 100, 100, 100, 100, 100, 100, 100,...
    100, 100, 100, 100, 100, 100, 100, 100] * 1e-9;
Rth = [38.4, 77.1, 154.0, 308.1, 616.2, 1232.3, 2464.4, 38.5, 38.5, 38.5,...
    38.5, 38.3, 38.1, 37.9, 37.6, 37.2, 36.6, 64.9, 61.7, 54.7,...
    43.1, 34.4, 27.8, 22.7, 18.6, 15.2, 12.4, 40.4, 40.1, 39.7,...
    39.4, 39.2, 38.9, 38.7, 39.2, 39.0, 39.0, 39.1, 36.4, 37.4,...
    38.3, 39.2, 40.0, 40.7, 41.3, 42.1, 42.9] * 1E-9;
V = [5.7362E-04, 1.1088E-03, 2.1927E-03, 4.3579E-03, 8.6955E-03,...
    1.7358E-02, 3.4681E-02, 5.4391E-04, 5.4603E-04, 5.5182E-04,...
    5.6480E-04, 5.8210E-04, 6.0203E-04, 6.2689E-04, 6.5892E-04,...
    6.9309E-04, 7.3469E-04, 1.2765E-03, 1.1428E-03, 8.9787E-04,...
    5.7341E-04, 5.1987E-04, 4.1920E-04, 3.3033E-04, 2.5326E-04,...
    1.8761E-04, 1.3750E-04, 6.3246E-04, 7.4848E-04, 7.6214E-04,...
    7.4321E-04, 7.0689E-04, 6.7155E-04, 6.3511E-04, 6.8918E-04,...
    6.8854E-04, 6.8651E-04, 6.8608E-04, 1.7876E-04, 3.5202E-04,...
    5.7333E-04, 7.9612E-04, 1.0303E-03, 1.3000E-03, 1.6077E-03,...
    1.9898E-03, 2.9764E-03];
D = [6.0927E-10, 2.5446E-09, 9.8929E-09, 4.0153E-08, 1.5733E-07,...
    6.4126E-07, 2.5691E-06, 6.4696E-10, 6.1584E-10, 6.2233E-10,...
    6.2325E-10, 6.1200E-10, 6.3061E-10, 6.2915E-10, 6.2755E-10,...
    6.8070E-10, 7.3124E-10, 1.3332E-09, 1.2022E-09, 9.6260E-10,...
    5.9568E-10, 5.3179E-10, 3.5663E-10, 2.4562E-10, 1.7411E-10,...
    1.2228E-10, 8.8001E-11, 8.3832E-10, 3.9926E-10, 3.6166E-10,...
    3.5211E-10, 3.8109E-10, 4.0779E-10, 4.7811E-10, 4.0232E-10,...
    4.0977E-10, 4.1960E-10, 4.3327E-10, 4.6762E-10, 5.3574E-10,...
    6.1638E-10, 6.8521E-10, 7.3813E-10, 8.6320E-10, 9.5341E-10,...
    1.0789E-09, 1.7174E-09];
k = [1.3516E-17, 5.1598E-17, 2.0255E-16, 8.0276E-16, 3.1923E-15,...
    1.2761E-14, 5.0897E-14, 1.2524E-17, 1.2593E-17, 1.2802E-17,...
    1.3290E-17, 1.3751E-17, 1.4328E-17, 1.4897E-17, 1.5785E-17,...
    1.6539E-17, 1.7609E-17, 8.4268E-17, 6.8034E-17, 4.2455E-17,...
    1.6942E-17, 1.0843E-17, 6.5001E-18, 3.7777E-18, 2.0819E-18,...
    1.0826E-18, 5.5419E-19, 5.0519E-18, 8.3021E-18, 1.0335E-17,...
    1.1778E-17, 1.2549E-17, 1.3031E-17, 1.3244E-17, 1.2907E-17,...
    1.2876E-17, 1.2796E-17, 1.2762E-17, 1.5653E-18, 5.5640E-18,...
    1.3499E-17, 2.3980E-17, 3.7448E-17, 5.5049E-17, 7.7361E-17,...
    1.0875E-16, 1.5424E-16];

% fitting
% index = [1:27, 32:47];
% X = [ones(length(D(index)), 1), log(n(index)'), log(L(index)'), log(V(index)')];
% Y = log(D(index)');
% [b, bint, r, rint, stats] = regress(Y, X);
% rcoplot(r, rint);

% plot
% index = [1:27, 32:47];
% X = n(index) .* L(index) .* V(index);
% Y = D(index);
% k = Y / X;
% loglog(X, Y, 'kx', 'markerSize', 10, 'linewidth', 2);
% hold on;
% plot(X, k * X, 'r', 'linewidth', 2);
% title('Dispersion Coefficient with Parameters');
% xlabel('nLV (m^2/s)');
% ylabel('Dispersion Coefficient D_m (m^2/s)');
% legend('Simulation', 'Fitting');

% fitting
% index = [1:27, 28:47];
% X = [ones(length(k(index)), 1), log(L(index)'), log(k(index)')];
% Y = log(D(index)');
% [b, bint, r, rint, stats] = regress(Y, X);
% rcoplot(r, rint);

% plot
index = [1:3, 8:47];
X = (L(index) .^ (-2)) .* (Rth(index) .^ 4);
c = (L(index) ./ (L(index)-2*Rp(index)) + L(index) ./ (sqrt(2)*L(index)-2*Rp(index)) * 4 + L(index) ./ (sqrt(3)*L(index)-2*Rp(index)) * 4) / 9 .* (0.1519 * n(index) - 0.3298);
X = X .* c;
Y = k(index);
loglog(X, Y, 'kx', 'markerSize', 10, 'linewidth', 2);
r = corrcoef(log(X), log(Y));
text(1e-17, 4e-18, ['R^2 = ', num2str(r(1,2)^2, '%.4f')], 'Fontsize', 12);
hold on;
plot([1e-19, 1e-15], [1e-19, 1e-15], 'r:', 'linewidth', 2);
title('Permeability Fitting');
xlabel('f(\zeta)r_{th}^4/L^2 (m^2)');
ylabel('Permeability k_{app} (m^2)');
legend('Simulation', 'Prediction');
