function [length, serialNumber, matID, data] = DataAnalyze(frame)

% strArray = String2StringArray(frame);
% 
% length       = hex2dec([strArray{ 6}, strArray{7}]);
% serialNumber = hex2dec([strArray{ 8}, strArray{9}]);
% matID        = hex2dec( strArray{10});

% dataTemp = strArray(11: end-2);
% dataTemp = reshape(dataTemp,2,[]);
% [a,b]=size(dataTemp);
% data = zeros(1,b);
% for i=1:b
%     data(i) = hex2dec([dataTemp{1,i}, dataTemp{2,i}]);
% end

length       = frame(6) + frame(7)*256;
serialNumber = frame(8) + frame(9)*256;
matID        = frame(10);

dataTemp = frame(11: end-2);
try 
    dataTemp = reshape(dataTemp,2,[]);
    [a,b]=size(dataTemp);
    data = zeros(1,b);
    for i=1:b
        data(i) = dataTemp(1,i) + dataTemp(2,i)*256;
    end
catch
    disp('reshape error')
end