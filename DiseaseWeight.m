function sum =DiseaseWeight(normalD,normalL,interaction)
load dw.mat;
sum = 0;
for i =1:length(interaction(1,:))
    if(interaction(normalL,i))
        sum = sum+dw(normalD,i);
    end
end