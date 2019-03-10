function [DL] = DiseaseL(indata)
sum1 = sum(indata);
for i =1:length(sum1)
    if sum1(i)==0
        DL(ceil(length(indata)*rand(1)),i) = 1;
    else 
        DL(:,i) = indata(:,i)/sum1(i);
    end
end
