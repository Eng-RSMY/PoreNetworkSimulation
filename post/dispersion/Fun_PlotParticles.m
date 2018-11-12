function Fun_PlotParticles(model_size, pos, now_time)
% Fun_PlotParticles ���ݿ�����λ����Ϣ���Ƶ�ǰ��̬
% Params:
%     model_size: 1 * 3, ��ʾģ�͵ģ��������ߣ�
%     pos: 4 * n, ÿ�����ݱ�ʾ��ʱ�䣬x���꣬y���꣬z���꣩

    cla(1);
    scatter(pos(2,:), pos(3,:), '.');
    title(['Time = ', num2str(now_time, '%.4f'), ' s'], 'FontSize', 10);
    axis equal;
    axis([0, model_size(1), 0, model_size(2)]);
    drawnow;
    
end

