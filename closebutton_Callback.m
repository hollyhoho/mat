    function closebutton_Callback(hObject, eventdata, handles)  
    fclose(handles.udpTransmit);  
    delete(handles.udpTransmit);  
    clear ipMAT portMAT ipVS portVS;  
    close();%�ر�GUI����  