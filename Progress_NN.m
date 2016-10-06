%prepare data for neural network. target matrix should have 5 rows
%corresponding to the 5 classes. Input should be set of 80 rows containing
%the features for the block. Total number of columns will be M*N* number of
%pixels
for i=1:9
    Foram_Images(i)=load(sprintf('Train_Set/Feature_0%d.mat',i));
end
for i=10:40
    Foram_Images(i)=load(sprintf('Train_Set/Feature_%d.mat',i));
end
Y=[];data_nn=[];
for a=1:1:40
im=Foram_Images(a);
gt=im.GroundTruthTable;
fl=im.FeatureList;
[gr,gc]=size(gt);
for i=1:1:gr
    for j=1:1:gc
        if(gt(i,j)==0)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            Y=[Y,[1 0 0 0 0]'];
            data_nn=[data_nn;temp];
        end
         if(gt(i,j)==1)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            Y=[Y,[0 1 0 0 0]'];
            data_nn=[data_nn;temp];
         end
         if(gt(i,j)==2)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            Y=[Y,[0 0 1 0 0]'];
            data_nn=[data_nn;temp];
         end
         if(gt(i,j)==3)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            Y=[Y,[0 0 0 1 0]'];
            data_nn=[data_nn;temp];
         end
         if(gt(i,j)==4)
            temp=[];
            for k=1:1:8
                for l=1:1:10
                temp=[temp,fl{k}.FeatureTableList(i,j,l)];
                end
            end
            Y=[Y,[0 0 0 0 1]'];
            data_nn=[data_nn;temp];
         end
    end
end
end        
data_nn=data_nn';            