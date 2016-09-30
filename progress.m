for i=1:9
    Foram_Images(i)=load(sprintf('Feature_0%d.mat',i));
end
for i=10:20
    Foram_Images(i)=load(sprintf('Feature_%d.mat',i));
end
%load 'Feature_01.mat';% we will first process image 1
% we have 5 classes need to assign labels to each pixel in image to help for classification.

X0=[];%background
X1=[];%chamber
X2=[];%edge between background and shell
X3=[];%edge between chambers
X4=[];%aperture

%%
for a=1:1:20
gt=Foram_Images(a).GroundTruthTable;
[gr,gc]=size(gt);
fl=Foram_Images(a).FeatureList;
for i=1:1:gr
    for j=1:1:gc
        if(gt(i,j)==0)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                    temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            X0=[X0; temp];
        end
        if(gt(i,j)==1)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                    temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            X1=[X1; temp];
        end
        if(gt(i,j)==2)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                    temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            X2=[X2; temp];
        end
        if(gt(i,j)==3)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                    temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            X3=[X3; temp];
        end
        if(gt(i,j)==4)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                    temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            X4=[X4; temp];
        end
    end
end
end
%now we need to add the class labels at the end of each row to complete the
%training example as a feature vector and label.
rows=size(X0,1);
X0=[X0,zeros(rows,1)];
rows=size(X1,1);
X1=[X1,ones(rows,1)];
rows=size(X2,1);
X2=[X2,2*ones(rows,1)];
rows=size(X3,1);
X3=[X3,3*ones(rows,1)];
rows=size(X4,1);
X4=[X4,4*ones(rows,1)];
%Now combine all the matrices into a single one 
Data=vertcat(X0,X1,X2,X3,X4);
% we have now prepared the data for passing to the classifier.