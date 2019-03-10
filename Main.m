function Main()
load('diseasename.mat');
for i=1:length(diseasename)
    i
Dn=diseasename{i,2};
predictall = IIRWR(0.6,0.4,Dn);
predicttop=predictall(1:10,:);
allpre((i-1)*10+1:i*10,2:3)=predicttop;
for j=(i-1)*10+1:i*10
allpre{j,1}=Dn;
end
end

