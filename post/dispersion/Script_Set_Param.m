global conf;
global batch_i;

% ģ��������
data_file  = ['dispersion_', conf.name{batch_i}, '_paths.txt'];   % ·�������ļ�
if isstrprop(conf.name{batch_i}(1), 'digit')
    model_size = [str2double(conf.name{batch_i}(1:strfind(conf.name{batch_i}, '_') - 1)), 30, 30];                            % ģ�ͳߴ�
end
time       = conf.data(batch_i, 1);                               % ģ��ʱ��
particles  = conf.data(batch_i, 2);                               % ģ��������
time_step  = conf.data(batch_i, 3);                               % ʱ�䲽��
unit_size  = conf.data(batch_i, 4) * 1e-9;                        % ��Ԫ�ߴ�(m)