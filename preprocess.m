%Ԥ�������2
%��д����ʶ��
I = imread('nums.jpg');%��ȡԭʼͼ��
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');

Igray = rgb2gray(I);%ͼ��ҶȻ�
subplot(2,2,2);
imshow(Igray);
title('�Ҷ�ͼ��');
Igray = 255-Igray;%ͼ����
% figure
% imhist(Igray,150)
% title('ֱ��ͼ');

% se = strel('disk',8);
% background = imopen(Igray,se);
% figure
% imshow(background);
% title('ͼ�񱳾�')

% Ibw =im2bw(Igray,graythresh(Igray));%ͼ���ֵ��

Ibw =im2bw(Igray,0.6);
subplot(2,2,3);
% Ibw = ~Ibw;
imshow(Ibw);    
title('��ֵ��ͼ��');

se= strel('disk',4);%��ʴ�ṹ����ѡ
Ibw_fushi = imerode(Ibw,se);
subplot(2,2,4);
imshow(Ibw_fushi);    
title('��ʴ');
se1= strel('disk',13);
Ibw_pengzhang = imdilate(Ibw_fushi,se1);
figure
imshow(Ibw_pengzhang);    
title('����');

% %�ַ��ָ�
% Iarea_label = bwlabel(Ibw_pengzhang,8);
% M = max(max(Iarea_label));
% pixelcount1 = zeros(M,1);
% for i = 1:M
%     pixelcount1(i) = numel(find(Iarea_label==i));
% end
% pixelcount1_sort = sort(pixelcount1,'descend');
% pixelcount1(pixelcount1<pixelcount1_sort(2)) = 0;
% numindex = find(pixelcount1~=0);
% for i = 1:2
%     [temprow,tempcol] = find(Iarea_label==numindex(i));
%     exrow.min = min(temprow);
%     exrow.max = max(temprow);
%     excol.min = min(tempcol);
%     excol.max = max(tempcol);
%    
%     result{i} = Iarea_label(exrow.min:exrow.max,excol.min:excol.max);
% end
% figure
% subplot(1,2,1)
% imshow(result{1}>=1);
% t1 = title('');
% subplot(1,2,2);
% imshow(result{2}>=1);
% t2 = title('');
% ------------------------------------------
[L,num] = bwlabel(Ibw_pengzhang);
status=regionprops(Ibw_pengzhang,'area','BoundingBox');
areas = [status.Area ];
[areas_sort,index] = sort(areas,2,'ascend');
rects = cat(1,  status.BoundingBox); 
[~, max_id] = max(areas);  
% [~, max_id] = find([status.Area] > 100);
max_rect = rects(max_id, :);   
%show the largest connected region    
figure
imshow(Ibw_pengzhang);
title('��ͨ����');
for i = 1:size(rects,1)
    rectangle('position', rects(i,:), 'EdgeColor', 'r');
end
% rectangle('position',max_rect, 'EdgeColor', 'r');

 
% bw_reg = imcrop(Ibw_pengzhang,max_rect);
% figure
% imshow(bw_reg);
% title('��ͨ�����ȡ');

bw1 = imcrop(Ibw_pengzhang,rects(index(1),:));
bw2 = imcrop(Ibw_pengzhang,rects(index(6),:));
bw3 = imcrop(Ibw_pengzhang,rects(index(3),:));
bw4 = imcrop(Ibw_pengzhang,rects(index(8),:));
bw5 = imcrop(Ibw_pengzhang,rects(index(7),:));
bw6 = imcrop(Ibw_pengzhang,rects(index(5),:));
bw7 = imcrop(Ibw_pengzhang,rects(index(2),:));
bw8 = imcrop(Ibw_pengzhang,rects(index(9),:));
bw9 = imcrop(Ibw_pengzhang,rects(index(4),:));

figure
subplot(3,3,1)
imshow(bw1);
title('1����ͨ�����ȡ');
subplot(3,3,2)
imshow(bw2);
title('2����ͨ�����ȡ');
subplot(3,3,3)
imshow(bw3);
title('3����ͨ�����ȡ');
subplot(3,3,4)
imshow(bw4);
title('4����ͨ�����ȡ');
subplot(3,3,5)
imshow(bw5);
title('5����ͨ�����ȡ');
subplot(3,3,6)
imshow(bw6);
title('6����ͨ�����ȡ');
subplot(3,3,7)
imshow(bw7);
title('7����ͨ�����ȡ');
subplot(3,3,8)
imshow(bw8);
title('8����ͨ�����ȡ');
subplot(3,3,9)
imshow(bw9);
title('9����ͨ�����ȡ');

 bw1_3232 = imresize(bw1,[32,32]);
 bw2_3232 = imresize(bw2,[32,32]);
 bw3_3232 = imresize(bw3,[32,32]);
 bw4_3232 = imresize(bw4,[32,32]);
 bw5_3232 = imresize(bw5,[32,32]);
 bw6_3232 = imresize(bw6,[32,32]);
 bw7_3232 = imresize(bw7,[32,32]);
 bw8_3232 = imresize(bw8,[32,32]);
 bw9_3232 = imresize(bw9,[32,32]);
 figure
subplot(3,3,1)
imshow(bw1_3232);
title('1�Ĺ�һ��ͼ��');
subplot(3,3,2)
imshow(bw2_3232);
title('2�Ĺ�һ��ͼ��');
subplot(3,3,3)
imshow(bw3_3232);
title('3�Ĺ�һ��ͼ��');
subplot(3,3,4)
imshow(bw4_3232);
title('4�Ĺ�һ��ͼ��');
subplot(3,3,5)
imshow(bw5_3232);
title('5�Ĺ�һ��ͼ��');
subplot(3,3,6)
imshow(bw6_3232);
title('6�Ĺ�һ��ͼ��');
subplot(3,3,7)
imshow(bw7_3232);
title('7�Ĺ�һ��ͼ��');
subplot(3,3,8)
imshow(bw8_3232);
title('8�Ĺ�һ��ͼ��');
subplot(3,3,9)
imshow(bw9_3232);
title('9�Ĺ�һ��ͼ��');
dlmwrite('F:\matrialofgra\KNN1\testDigits\1_0.txt',bw1_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\2_0.txt',bw2_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\3_0.txt',bw3_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\4_0.txt',bw4_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\5_0.txt',bw5_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\6_0.txt',bw6_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\7_0.txt',bw7_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\8_0.txt',bw8_3232,'delimiter','','newline','pc');
dlmwrite('F:\matrialofgra\KNN1\testDigits\9_0.txt',bw9_3232,'delimiter','','newline','pc');

% figure
% subplot(1,2,1);
% imshow(bw3_3232);
% subplot(1,2,2);
% imshow(bw8_3232);
% title('��һ��ͼ��');
% dlmwrite('F:\matrialofgra\KNN1\testDigits\3_1.txt',bw3_3232,'delimiter','','newline','pc');
% dlmwrite('F:\matrialofgra\KNN1\testDigits\8_1.txt',bw8_3232,'delimiter','','newline','pc');
% csvwrite('0_0.csv',bw_3232);%����ֵ��ͼ���Ծ������ʽ����
