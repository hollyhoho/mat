    function updateUDP(obj,event,handles)%udp�Ļص�����  
    
    global udpReceive
    global errCount
    
%     t1=clock;  

%     frame = fscanf(udpReceive);%�ı���ʽ��
    frame = fread(udpReceive);%�����Ʒ�ʽ��
   

    [frameLength, serialNumber, matID, data] = DataAnalyze(frame);
    dataLength = length(data);

    disp( ['֡����',        num2str(frameLength),   '   ',...
           'ʵ��֡����',    num2str(length(frame)), '   ',...
           '���: ',        num2str(serialNumber),  '   ',...
           '����: ',        num2str(matID),         '   ',...
           '���ݳ���: ',    num2str(dataLength),    '   '...
           '�ۼƴ���֡����', num2str(errCount)]);

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
    
    
      
%     etime(clock,t1)%�鿴ÿ�δ������ݵ�ʱ�俪��  