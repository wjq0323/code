function [outdata,sum]=DiseaseSet(indata,num)
j=0;
sum = -1;
for i =1:length(indata)
    if(indata(num,i))
    j=j+1;
    outdata(j,1) = i;
    outdata(j,2) = indata(num,i);
    sum = sum+indata(num,i);
    end
end
for i =1:j
    if(eq(outdata(i,2),1))
        outdata(i,3) = 1;
    else
    outdata(i,3) = outdata(i,2)/sum;  
    end
end
