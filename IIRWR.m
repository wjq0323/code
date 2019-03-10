function finallncprediction1 =  IIRWR(a,r,Dn)
%IIRWR(0.6,0.4,'diseasename')
outdata1 = load('knowndiseaselncrnainteraction.txt');
[pp,qq]=size(outdata1);
for i=1:pp
        interaction(outdata1(i,1),outdata1(i,2))=1;
end
interaction = interaction';
save interaction interaction;
load('diseasename.mat');
[di,j]=find(strcmp(diseasename,Dn));
load('lncrnaname.mat');
load('disSemSim.mat');
dw = Weight(disSemSim,a);
save dw dw;
m = length(lncrnaname);
[kl] = GaussianSimi(interaction,lncrnaname);
for i=1:m
     DW(i,1)=DiseaseWeight(di,i,interaction);
end
DW = DW./(max(DW));
FL = FinalML(interaction,DW,kl);
%      DL = DiseaseL(interaction,di);
DL = DiseaseL(interaction);
DL1 = DL;
DLpro = DL;
DL =(1-r)*FL'*DLpro+r*DL1;
while(norm(DLpro-DL)>1*10^-10)
    DLpro = DL;
    DL =(1-r)*FL'*DLpro+r*DL1;
end  
for i = 1:length(interaction(:,1))
     for j =1:length(interaction(1,:))
          if interaction(i,j)==1 
            DL(i,j)=-10000;
          end
     end
end
pf(:,1) = 1:1:m;
pf(:,2) = DL(:,di);
finallncprediction = sortrows(pf,-2);
for i = 1:length(finallncprediction)
   lnc = cell2mat(lncrnaname(finallncprediction(i,1),2));
   finallncprediction1{i,1} = lnc;
   finallncprediction1(i,2) = num2cell(finallncprediction(i,2));
end

