%The face image can be displayed in matlab with the following command lines:
%===========================================
function [] = displayFaces(data) 
%input: 3d or 4d tensor
if(length(data) == 3):
    is3d = true;
    [faceW, ~, faceH] = size(data);
else:
    is3d = false;
    [~, ~, faceW, faceH] = size(data);
end
numPerLine = 11;
ShowLine = 2;

Y = zeros(faceH*ShowLine,faceW*numPerLine);
% for i=0:ShowLine-1
%    for j=0:numPerLine-1
%      Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(fea(i*numPerLine+j+1,:),[faceH,faceW]);
%    end
% end

imagesc(Y);colormap(gray);
end
%===========================================
