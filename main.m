clc
close all

fprintf(' <<<< Kernelized ANFIS work >>>> ');

data = xlsread('wsn_data.xlsx');
[R,C] = size(data);
numClass = length(unique(data(:,C)));

rng(1)

a = 1;
b = R;
rndIdx = round((b-a).*rand(R,1) + a);

%partition the data random sampling for training and testing
% D_train = data(rndIdx(1:ceil(0.70*R)),:); 
% D_test = data(rndIdx(ceil(0.70*R)+1:R),:);

load D_train
load D_test

clear('data','rndIdx','a','b');

%anfis init
numEpoch = 100;
numClustInEachClass = 1;

%%
%[fismat,outputs,recog_tr(i),recog_te(i),labels,performance] = scg_nfc(D_train(:,1:C-1),D_train(:,C),D_test(:,1:C-1),D_test(:,C),numEpoch,numClass,numClustInEachClass);

%%
% D_trainSmote = SMOTE(D_train);

% [fismat,outputs,recog_tr,recog_te,labels,performance] = scg_nfc(D_trainSmote(:,1:C-1),D_trainSmote(:,C),D_test(:,1:C-1),D_test(:,C),numEpoch,numClass,numClustInEachClass);

%%
newDim = 25;
sigma = 10;
D_rbfTrain = KernelizeWithRBF(D_train,newDim,sigma);
D_rbfTest = KernelizeWithRBF(D_test,newDim,sigma);
C = size(D_rbfTrain,2);
% 
%[fismat,outputs,recog_tr,recog_te,labels,performance] = scg_nfc(D_rbfTrain(:,1:C-1),D_rbfTrain(:,C),D_rbfTest(:,1:C-1),D_rbfTest(:,C),numEpoch,numClass,numClustInEachClass);

%%
D_rbfTrainSmote = SMOTE(D_rbfTrain);
[fismat,outputs,recog_tr,recog_te,labels,performance] = scg_nfc(D_rbfTrainSmote(:,1:C-1),D_rbfTrainSmote(:,C),D_rbfTest(:,1:C-1),D_rbfTest(:,C),numEpoch,numClass,numClustInEachClass);