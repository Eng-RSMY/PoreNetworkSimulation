hist(radii, 0:200);
h = findobj(gca,'Type','patch');
h.FaceColor = 'w';
h.EdgeColor = 'k';
hold on;
xlim([50, 150]);
[muhat, sigmahat] = normfit(radii);
plot(50:150, normpdf(50:150, muhat, sigmahat) * length(radii), 'r', 'linewidth', 2);
xlabel('Pore Size (nm)');
ylabel('Amount');
title('Generated Pores Radii Distribution');
text(115, 300, ['\mu = ', num2str(muhat, '%.2f'), ' nm'], 'FontSize', 14);
text(115, 270, ['\sigma =     ', num2str(sigmahat, '%.2f'), ' nm'], 'FontSize', 14);