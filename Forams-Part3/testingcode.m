%%
clear all
close all
load Feature_01.mat
f=FeatureList;
nInstances=size(f,2);
nNodeFeatures=size(f{1,1}.FeatureTableList,3);
gt=GroundTruthTable;
nNodes = numel(gt);
[gr,gc]=size(gt);
%output Y and input features
%x=int32(features);
y=int32(GroundTruthTable+1);

%% Make edgeStruct
% nNodes = numel(y);
nStates = 5;
adj = zeros(nNodes);
for j=1:gr
for i=((j-1)*nInstances+1):(j*nInstances)
   if(i+1<=j*nInstances)
    adj(i,i+1) = 1;
   end
   temp=(i+nInstances);
    if(temp<=((j+1)*nInstances)&&(j<nNodes))
    adj(i,temp)=1;
    end
    if(temp+1<=((j+1)*nInstances)&&(j<nNodes))
     adj(i,temp+1)=1;
    end
    if(temp-1>=((j)*nInstances)&&(j<nNodes))
        adj(i,temp-1)=1;
    end
end
end

adj = adj+adj';
%%
edgeStruct = UGM_makeEdgeStruct(adj,nStates);
maxState = max(nStates);
nEdges = edgeStruct.nEdges;
%% defining Xnode and Xedge

k=f{1,1}.FeatureTableList;
temp=reshape(k,size(k,3),size(k,2)*size(k,1));
for i=2:nInstances
k=f{1,i}.FeatureTableList;
temp=cat(3,temp,reshape(k,size(k,3),size(k,2)*size(k,1)));
end
feat=temp;
%Xnode=ones(nNodeFeatures,nNodes,nInstances);
Xnode=feat;
Xedge=ones(nInstances,1,nEdges);

