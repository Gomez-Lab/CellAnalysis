%% This code generates the plots for the discriminant analysis of the macrophage subtypes: Fig S4 

%read from txt and plot
close all
clear
M0 = readtable('M0.csv');
M1 = readtable('M1.csv');
M2 = readtable('M2.csv');
M_mixed = readtable('M_mixed.csv');
%%
Mm = [ M_mixed; M1];

species = Mm.imageName;

spd = Mm.spd;
per = Mm.per;

subplot(2, 2, 1)

h01 = gscatter(spd,per,species,'mg','o^',[],'off');
set(h01,'LineWidth',2)
hold on


%%
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
h02 = fimplicit(f,[0 1 0 1]);
set(h02,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])                            
legend('Ms 0+2','M1','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with accuracy %ge: }' ,num2str(100-err*100)],'FontSize', 20)
%%
M01 = [ M0; M1];

species = M01.imageName;


spd = M01.spd;
per = M01.per;

subplot(2, 2, 2)

h11 = gscatter(spd,per,species,'rg','o^',[],'off');
set(h11,'LineWidth',2)
hold on


%%
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
h12 = fimplicit(f,[0 1 0 1]);
set(h12,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])                            
legend('M0','M1','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with accuracy %ge: }' ,num2str(100-err*100)],'FontSize', 20)
%%
M02 = [ M0; M2];

species = M02.imageName;

spd = M02.spd;
per = M02.per;

subplot(2, 2, 3)

h1 = gscatter(spd,per,species,'rb','o^',[],'off');
set(h1,'LineWidth',2)
hold on


%%
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
legend('M0','M2','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with accuracy %ge: }' ,num2str(100-err*100)],'FontSize', 20)
%%
Ms = [ M1; M2];

species = Ms.imageName;

ecc = Ms.ecc;
sol = Ms.sol;
cmp = Ms.cmp;

spd = Ms.spd;
per = Ms.per;
cellSize = Ms.cellSize;

subplot(2, 2, 4)

h31 = gscatter(spd,per,species,'gb','o^',[],'off');
set(h31,'LineWidth',2)
hold on


%%
[X,Y,Z] = meshgrid(linspace(0,1),linspace(0,1),linspace(0,1));
X = X(:); Y = Y(:);
[C,err,P,logp,coeff] = classify([X Y],[spd per],...
                                species,'Quadratic');
 
hold on;
h  = gscatter(X,Y,C,'bg','.',1,'LineWidth',2);

K = coeff(2,1).const;
L = coeff(2,1).linear ;
Q = coeff(2,1).quadratic; 

f = @(x,y) K + L(1)*x + L(2)*y + Q(1,1)*x.*x + (Q(1,2)+Q(2,1))*x.*y + Q(2,2)*y.*y;
h32 = fimplicit(f,[0 1 0 1]);
set(h32,'Color','k','LineWidth',2,'DisplayName','Decision Boundary')
axis([0 1 0 1])                            
legend('M1','M2','Location','best','FontSize', 14)

xlabel('Speed (µm/min)','FontSize', 18)
ylabel('Persistence','FontSize', 18)
title(['{\bf Classification with accuracy %ge: }' ,num2str(100-err*100)],'FontSize', 20)
