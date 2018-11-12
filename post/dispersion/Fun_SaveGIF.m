function Fun_SaveGIF(file_name, i)
% Fun_SaveGIF ���浱ǰ��GIF֡
% �����б�:
%     file_name: str  , ��ʾҪ������ļ���
%     i        : 1 * 1, ��ʾ��ǰ�ǵڼ�֡

    I = frame2im(getframe(gcf));
    [I, map] = rgb2ind(I, 256);
    if i == 1
        imwrite(I, map, file_name, 'gif', 'Loopcount', inf, 'DelayTime', 0);
    else
        imwrite(I, map, file_name, 'gif', 'WriteMode', 'append', 'DelayTime', 0);
    end

end

