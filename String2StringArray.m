function strArray = String2StringArray(str)

len = length(str);
count = (len+1)/3;
strArray = cell(count, 1);

for i=1:count
    strArray{i} = str(i*3-2:i*3-1);
end