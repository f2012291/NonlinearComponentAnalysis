clear all;
clc;
%loading data
load('usps_all')

%TEST DATA : M(observation/sample points) x N(features/dimensions)
X_train = [double(data(:, 1:800, 1)'); double(data(:, 1:800, 2)');double(data(:, 1:800, 3)');double(data(:, 1:800, 4)');double(data(:, 1:800, 5)');double(data(:, 1:800, 6)');double(data(:, 1:800, 7)');double(data(:, 1:800, 8)');double(data(:, 1:800, 9)');double(data(:, 1:800, 10)');];
X_test = [double(data(:, 801:1100, 1)'); double(data(:, 801:1100, 2)');double(data(:, 801:1100, 3)');double(data(:, 801:1100, 4)');double(data(:, 801:1100, 5)');double(data(:, 801:1100, 6)');double(data(:, 801:1100, 7)');double(data(:, 801:1100, 8)');double(data(:, 801:1100, 9)');double(data(:, 801:1100, 10)');];

Label = [];
for i=0:9
    Label = [Label; i*ones(800,1)];
end

Train = [Label, X_train];

Label = [];
for i=0:9
    Label = [Label; i*ones(300,1)];
end

Test = [Label, X_test];

csvwrite('Train.csv',Train)
csvwrite('Test.csv',Test)
% 
% % Model=svm.train(X_train,Label);
% % predict=svm.predict(Model,X_test);
% 
% res = multisvm(X_train,Label,X_test);
% 
% 
% 
% function [result] = multisvm(TrainingSet,GroupTrain,TestSet)
% %Models a given training set with a corresponding group vector and 
% %classifies a given test set using an SVM classifier according to a 
% %one vs. all relation. 
% %
% %This code was written by Cody Neuburger cneuburg@fau.edu
% %Florida Atlantic University, Florida USA
% %This code was adapted and cleaned from Anand Mishra's multisvm function
% %found at http://www.mathworks.com/matlabcentral/fileexchange/33170-multi-class-support-vector-machine/
% 
% u=unique(GroupTrain);
% numClasses=length(u);
% result = zeros(length(TestSet(:,1)),1);
% 
% %build models
% for k=1:numClasses
%     %Vectorized statement that binarizes Group
%     %where 1 is the current class and 0 is all other classes
%     G1vAll=(GroupTrain==u(k));
%     models(k) = svmtrain(TrainingSet,G1vAll);
% end
% 
% %classify test cases
% for j=1:size(TestSet,1)
%     for k=1:numClasses
%         if(svmclassify(models(k),TestSet(j,:))) 
%             break;
%         end
%     end
%     result(j) = k;
% end
% end