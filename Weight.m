function [dw] = Weight(indata,f)
dw  = indata;
for i =1:length(indata)
    dataset = find(dw(i,:)~=0);
    for j=1:length(dataset)
        if(dataset(1,j)~=i)
            data1 = indata(dataset(1,j),:);
            for m = 1:length(dataset)
                data1(1,dataset(1,m))=0;
            end
            dw(i,:) = dw(i,:)+f*data1*indata(i,dataset(1,j));
        end
    end
end
