    function updateUDP(obj,event,handles)%udp的回调函数  
    
    global udpReceive
    global errCount
    
%     t1=clock;  

%     frame = fscanf(udpReceive);%文本方式读
    frame = fread(udpReceive);%二进制方式读
   

    [frameLength, serialNumber, matID, data] = DataAnalyze(frame);
    dataLength = length(data);

    disp( ['帧长：',        num2str(frameLength),   '   ',...
           '实际帧长：',    num2str(length(frame)), '   ',...
           '序号: ',        num2str(serialNumber),  '   ',...
           '垫子: ',        num2str(matID),         '   ',...
           '数据长度: ',    num2str(dataLength),    '   '...
           '累计错误帧数：', num2str(errCount)]);

    if dataLength == 1024
        edgeLength = sqrt(dataLength);
        data = reshape(data,edgeLength,edgeLength);
%         
        bar3(data)
        axis([0 edgeLength+1 0 edgeLength+1 0 4096]) 
    else
        disp('wrong')
        errCount = errCount + 1;
    end
    
    
      
%     etime(clock,t1)%查看每次传输数据的时间开销  