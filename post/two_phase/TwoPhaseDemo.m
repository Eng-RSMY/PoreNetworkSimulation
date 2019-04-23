model_size = [5, 5, 5];
steps = size(data, 1);
unit_size = 1928.5340e-9;
[x, y, z] = meshgrid(0:unit_size:4*unit_size, 0:unit_size:4*unit_size, 0:unit_size:4*unit_size);

title('���㱥�Ͷȱ仯');
plot(1:500, mean(data(1:500, 1:25), 2), 1:500, mean(data(1:500, 26:50), 2), 1:500, mean(data(1:500, 51:75), 2), 1:500, mean(data(1:500, 76:100), 2), 1:500, mean(data(1:500, 101:125), 2), 'linewidth', 2);
legend('��1�����Σ�', '��2', '��3', '��4', '��5�����Σ�');
xlabel('��������');
ylabel('��ƽ�����Ͷ�');

% for i = 1:3:500
%     scatter3(z(:), y(:), x(:), 100, data(i, :), 'filled');
%     colorbar();
%     title(['���Ͷȱ仯������������� = ', num2str(i)]);
%     view(9, 27);
%     set(gcf, 'Position', [100, 100, 500, 300]);
%     drawnow;
%     Fun_SaveGIF('two_phase.gif', (i+2)/3);
% end