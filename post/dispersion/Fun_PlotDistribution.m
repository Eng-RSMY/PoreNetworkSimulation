function param = Fun_PlotDistribution(model_size, pos, particles, dispersion_type, now_time, unit_size)
% Fun_PlotParticles ���ݿ�����λ����Ϣ���Ƶ�ǰ��̬
% �����б�:
%     model_size:      1 * 3, ��ʾģ�͵ģ��������ߣ�
%     pos:             4 * n, ÿ�����ݱ�ʾ��ʱ�䣬x���꣬y���꣬z���꣩
%     particles:       1 * 1, ��ʾ��������
%     dispersion_type: 1 * 1, once: ˲��Ͷ��; continue: ����Ͷ��
%     now_time:        1 * 1, ��ǰʱ��
%     unit_size:       1 * 1, ��Ԫ�ߴ�(m)


    % �趨����
    bar_width = 1;

    % ����hist�ֲ�ͼ
    x = pos(2,:);
    cla(1);
    hist(x(x > 0), 0:bar_width:model_size(1));
    dist = hist(x(x > 0), 0:bar_width:model_size(1));
    hold on;
    
    % ������Ͻ����˲��Ͷ��������̬������ϣ�����Ͷ��ʹ��erf�������
    if strcmp(dispersion_type, 'once')
        [muhat, sigmahat] = normfit(x(x > 0));
        [muhat, sigmahat] = normfit(x(x > muhat - 3 * sigmahat & x < muhat + 3 * sigmahat));
    else
        fitx = 0:bar_width:model_size(1);
        fity = dist;
        maxind = find(fity > 0, 1, 'last');
        if maxind > 3
            myfun = fittype('c*(1-erf((x-a)*b))', 'independent', 'x');
            f = fit(fitx(2:maxind)', fity(2:maxind)', myfun, 'StartPoint', [now_time * 927, 0.02, mean(dist(1:maxind)) / 2]);
            % ���漸����ֵѡȡ��ƽ���ٶȣ����������ʼ�߶ȵ�һ��
        end
    end
    
    % ������Ͻ��������ƽ���ٶȺ���ɢϵ������������Ӧͼ��
    if strcmp(dispersion_type, 'once')
        plot(0:model_size(1), bar_width * particles * normpdf(0:model_size(1), muhat, sigmahat), 'r', 'linewidth', 2);
        v_ave = muhat * unit_size / now_time;
        D_prime = (sigmahat * unit_size) ^ 2 / 2 / now_time;
        title(['Time = ', num2str(now_time, '%.4f'), ' s, v = ', ...
            num2str(v_ave, '%.2E'), ' m/s, D = ', num2str(D_prime, '%.2E'), ' m^2/s'], 'FontSize', 10);
    else
        v_ave = 0;
        D_prime = 0;
        if maxind > 3
            plot(0:model_size(1), f.c.*(1-erf(((0:model_size(1))-f.a)*f.b)), 'r', 'linewidth', 2);
            v_ave = f.a * unit_size / now_time;
            D_prime = 1 / (4 * (f.b / unit_size) ^ 2) / now_time;
        end
        title(['Time = ', num2str(now_time, '%.4f'), ' s, v = ', num2str(v_ave, '%.2e'), ' m/s, D = ', num2str(D_prime, '%.2e'), ' m^2/s'], 'FontSize', 10);
    end
    
    % �����������һ������ϵ�Ĵ�С
    if strcmp(dispersion_type, 'once')
        axis([0, model_size(1), 0, particles/20]);
    else
        axis([0, model_size(1), 0, particles/100]);
    end
    drawnow;
    
    param = [v_ave, D_prime];
    
end