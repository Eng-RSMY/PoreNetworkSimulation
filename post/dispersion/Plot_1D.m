%!/usr/bin/env matlab
% -*- coding: utf-8 -*-
% ----------------------------------------------------------------------------- %
% Copyright (c) 2018 Tsinghua Institute of Geo-Environment. All Rights Reserved %
% ----------------------------------------------------------------------------- %

% File: Plot_1D.py
% Date: 2018/11/12 20:44:38
% Desc: ��ʾ˲ʱͶ�ŵĻ�е��ɢ����

% ------------------------- %
%      Part1 : ���ò���      %
% ------------------------- %

% ģ��������
data_file  = 'dispersion_2000_x1_paths.txt';    % ·�������ļ�
model_size = [2000, 30, 30];                    % ģ�ͳߴ�
time       = 2;                                 % ģ��ʱ��
particles  = 10000;                             % ģ��������
time_step  = 1e-3;                              % ʱ�䲽��
unit_size  = 621.3161e-9;                       % ��Ԫ�ߴ�(m)

% Script_Set_Param;

% ����������
plot_type          = 'dist';                    % move: ��ʾ�����˶�; dist: ��ʾ���ӷֲ�
dispersion_type    = 'continue';                    % once: ˲��Ͷ��; continue: ����Ͷ��
particles_per_step = 50;                        % ÿһ������Ͷ�ŵ���������������Ͷ����Ч��
is_save            = 0;                         % 0: ������; 1: ���涯ͼ���
save_name          = 'fluid_continue_2000.gif';    % ��Ҫ������ļ���

% ------------------------- %
%      Part2 : ���㲿��      %
% ------------------------- %

data_folder = '../../src/data/';

% ����Ѿ������˱������Ͳ���Ҫ�����ظ�����
if ~exist('position', 'var')
    load([data_folder, data_file]);
    total_steps = round(time / time_step) + 1;
    position = reshape(eval(data_file(1:length(data_file)-4)), [4, total_steps, particles]);
end

% ��ʼ��
figure;
set(gcf, 'position', [100, 500, 1000, 400]);    % ����ͼ���С
res = zeros(total_steps, 2);                    % ƽ���ٶ�����ɢϵ���ĸ��������
if strcmp(dispersion_type, 'continue')          % ����Ͷ��ʱ�������Ͷ��˳��
    index_list = randi(particles, particles_per_step * total_steps, 1);
end

% ��������
for i = 1:total_steps
    
    % ����׼��
    if strcmp(dispersion_type, 'once')
        pos = reshape(position(:, i, :), [4, particles]);
    else
        if strcmp(dispersion_type, 'continue')
            pos = zeros([4, particles_per_step * i]);
            for j = 1:size(pos, 2)
                eff_time_index = i - fix(j / particles_per_step);
                if eff_time_index > 0
                    pos(:, j) = position(:, eff_time_index, index_list(j));
                end
            end
        end
    end
    
%     if (i ~= 1) && (~all(pos(1, :)))
%         total_steps = i - 1;
%         break;
%     end
    
    % ��ͼ
    if strcmp(plot_type, 'dist')
        res(i, :) = Fun_PlotDistribution(model_size, pos, particles, dispersion_type, time_step * (i-1), unit_size);
    else
        if strcmp(plot_type, 'move')
            Fun_PlotParticles(model_size, pos, time_step * i);
        end
    end
    
    % ���涯ͼ
    if is_save ~= 0
        Fun_SaveGIF(save_name, i);
    end
end

% Script_Save_Result;