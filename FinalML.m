function [FL] = FinalML(interaction,DW,kl)
l = length(interaction(:,1));
FL = zeros(l);
for i=1:l
    for j=1:l
        if (DW(j)~=0)
            FL(i,j) = DW(j);
        else
            FL(i,j) = kl(i,j);
        end
        %sum(i,1) = sum(i,1)+FL(i,j); 
    end
end
summ=sum(FL,2);
for i =1:l
    FL(i,:)=FL(i,:)/summ(i);
end
