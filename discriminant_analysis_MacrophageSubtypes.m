%%
%%read from txt and plot
close all
clear
M0 = readtable('C0.csv');
M1 = readtable('C1.csv');
M2 = readtable('C2.csv');
M3 = readtable('Cs.csv');

M4 = readtable('Cs12_vs0.csv');
M5 = readtable('Cs01_vs2.csv');
rng(143)
%%
Ms = [ M3; M1];

species = Ms.cluster;

ecc = Ms.ecc;
sol = Ms.sol;
cmp = Ms.cmp;

spd = Ms.spd;
per = Ms.per;

% Create feature matrix
X = [spd, per];

% Perform 5-fold cross-validation
cv = cvpartition(species, 'KFold', 5);

% Initialize arrays to store classification results
accuracies = zeros(5, 1);

for fold = 1:5
    trainIdx = training(cv, fold);
    testIdx = test(cv, fold);
    
    % Train the classifier on the training data
    [C, err, ~, ~, coeff] = classify(X(testIdx, :), X(trainIdx, :), species(trainIdx), 'Quadratic');
    
    % Compute accuracy on the test data
    accuracies(fold) = 1 - err;
end

% Calculate the mean accuracy over all folds
meanAccuracy = mean(accuracies);

subplot(2, 2, 1)

h1 = gscatter(spd,per,species,'mg','v^',[],'off');
set(h1,'LineWidth',2)
hold on


[X,Y,Z] = meshgrid(linspace(0,1),linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
[C,err,P,logp,coeff] = classify([X Y],[spd per],...
                                species,'Quadratic');
 
hold on;
h  = gscatter(X,Y,C,'mg','.',1,'LineWidth',2);

K = coeff(2,1).const;
L = coeff(2,1).linear ;
Q = coeff(2,1).quadratic; 
f = @(x,y) K + L(1)*x + L(2)*y + Q(1,1)*x.*x + (Q(1,2)+Q(2,1))*x.*y + Q(2,2)*y.*y;
h2 = fimplicit(f,[0 1 0 1]);
set(h2,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])  

legend('Cluster 0+2','Cluster 1','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with mean accuracy of }' ,num2str(meanAccuracy * 100)],'FontSize', 14)
%%
%%read from txt and plot

Ms = [ M0; M1];

species = Ms.cluster;

ecc = Ms.ecc;
sol = Ms.sol;
cmp = Ms.cmp;

spd = Ms.spd;
per = Ms.per;

% Create feature matrix
X = [spd, per];

% Perform 5-fold cross-validation
cv = cvpartition(species, 'KFold', 5);

% Initialize arrays to store classification results
accuracies = zeros(5, 1);

for fold = 1:5
    trainIdx = training(cv, fold);
    testIdx = test(cv, fold);
    
    % Train the classifier on the training data
    [C, err, ~, ~, coeff] = classify(X(testIdx, :), X(trainIdx, :), species(trainIdx), 'Quadratic');
    
    % Compute accuracy on the test data
    accuracies(fold) = 1 - err;
end

% Calculate the mean accuracy over all folds
meanAccuracy = mean(accuracies);

subplot(2, 2, 2)

h1 = gscatter(spd,per,species,'rg','v^',[],'off');
set(h1,'LineWidth',2)
hold on


[X,Y,Z] = meshgrid(linspace(0,1),linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
[C,err,P,logp,coeff] = classify([X Y],[spd per],...
                                species,'Quadratic');
 
hold on;
h  = gscatter(X,Y,C,'rg','.',1,'LineWidth',2);

K = coeff(2,1).const;
L = coeff(2,1).linear ;
Q = coeff(2,1).quadratic; 
f = @(x,y) K + L(1)*x + L(2)*y + Q(1,1)*x.*x + (Q(1,2)+Q(2,1))*x.*y + Q(2,2)*y.*y;
h2 = fimplicit(f,[0 1 0 1]);
set(h2,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])  

legend('Cluster 0','Cluster 1','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with mean accuracy of }' ,num2str(meanAccuracy * 100)],'FontSize', 14)
%%
Ms = [ M0; M2];

species = Ms.cluster;

ecc = Ms.ecc;
sol = Ms.sol;
cmp = Ms.cmp;

spd = Ms.spd;
per = Ms.per;

% Create feature matrix
X = [spd, per];

% Perform 5-fold cross-validation
cv = cvpartition(species, 'KFold', 5);

% Initialize arrays to store classification results
accuracies = zeros(5, 1);

for fold = 1:5
    trainIdx = training(cv, fold);
    testIdx = test(cv, fold);
    
    % Train the classifier on the training data
    [C, err, ~, ~, coeff] = classify(X(testIdx, :), X(trainIdx, :), species(trainIdx), 'Quadratic');
    
    % Compute accuracy on the test data
    accuracies(fold) = 1 - err;
end

% Calculate the mean accuracy over all folds
meanAccuracy = mean(accuracies);

subplot(2, 2, 3)

h1 = gscatter(spd,per,species,'rb','v^',[],'off');
set(h1,'LineWidth',2)
hold on


[X,Y,Z] = meshgrid(linspace(0,1),linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
[C,err,P,logp,coeff] = classify([X Y],[spd per],...
                                species,'Quadratic');
 
hold on;
h  = gscatter(X,Y,C,'rb','.',1,'LineWidth',2);

K = coeff(2,1).const;
L = coeff(2,1).linear ;
Q = coeff(2,1).quadratic; 
f = @(x,y) K + L(1)*x + L(2)*y + Q(1,1)*x.*x + (Q(1,2)+Q(2,1))*x.*y + Q(2,2)*y.*y;
h2 = fimplicit(f,[0 1 0 1]);
set(h2,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])  

legend('Cluster 0','Cluster 2','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with mean accuracy of }' ,num2str(meanAccuracy * 100)],'FontSize', 14)
%%
%%
Ms = [ M1; M2];

species = Ms.cluster;

ecc = Ms.ecc;
sol = Ms.sol;
cmp = Ms.cmp;

spd = Ms.spd;
per = Ms.per;

% Create feature matrix
X = [spd, per];

% Perform 5-fold cross-validation
cv = cvpartition(species, 'KFold', 5);

% Initialize arrays to store classification results
accuracies = zeros(5, 1);

for fold = 1:5
    trainIdx = training(cv, fold);
    testIdx = test(cv, fold);
    
    % Train the classifier on the training data
    [C, err, ~, ~, coeff] = classify(X(testIdx, :), X(trainIdx, :), species(trainIdx), 'Quadratic');
    
    % Compute accuracy on the test data
    accuracies(fold) = 1 - err;
end

% Calculate the mean accuracy over all folds
meanAccuracy = mean(accuracies);

subplot(2, 2, 4)

h1 = gscatter(spd,per,species,'gb','v^',[],'off');
set(h1,'LineWidth',2)
hold on


[X,Y,Z] = meshgrid(linspace(0,1),linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
[C,err,P,logp,coeff] = classify([X Y],[spd per],...
                                species,'Quadratic');
 
hold on;
h  = gscatter(X,Y,C,'gb','.',1,'LineWidth',2);

K = coeff(2,1).const;
L = coeff(2,1).linear ;
Q = coeff(2,1).quadratic; 
f = @(x,y) K + L(1)*x + L(2)*y + Q(1,1)*x.*x + (Q(1,2)+Q(2,1))*x.*y + Q(2,2)*y.*y;
h2 = fimplicit(f,[0 1 0 1]);
set(h2,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])  

legend('Cluster 1','Cluster 2','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with mean accuracy of }' ,num2str(meanAccuracy * 100)],'FontSize', 14)
